# SIGE/views.py
from django.contrib.auth import login, logout
from django.contrib.auth.decorators import login_required
from django.shortcuts import redirect, render, get_object_or_404
from django.views.generic import View
from django.contrib.auth.forms import AuthenticationForm
from django.utils.decorators import method_decorator
from .forms import RegisterForm, ReservaForm, SalaForm, HorarioForm
from .models import Reserva, Sala, Horario
from django.contrib import messages
from django.http import HttpResponseBadRequest
from django.utils.timezone import now
from datetime import datetime, timedelta
from django.http import JsonResponse






class CustomLoginView(View):
    def get(self, request):
        form = AuthenticationForm()
        return render(request, 'login.html', {'form': form})

    def post(self, request):
        form = AuthenticationForm(data=request.POST)
        if form.is_valid():
            user = form.get_user()
            login(request, user)
            # Redirigir según el tipo de usuario
            if user.user_type == 'admin':
                return redirect('staff/home')
            elif user.user_type == 'regular':
                return redirect('salas')
        return render(request, 'login.html', {'form': form})


@login_required
def admin_dashboard(request):
    return render(request, 'staff/home.html')

@login_required
def regular_dashboard(request):
    return render(request, 'base.html')

def register(request):
    if request.method == 'POST':
        form = RegisterForm(request.POST)
        if form.is_valid():
            user = form.save(commit=False)
            user.set_password(form.cleaned_data['password'])
            user.save()
            return redirect('login')  # Redirige al login después de registrar
    else:
        form = RegisterForm()
    return render(request, 'register.html', {'form': form})

def logout_view(request):
    logout(request)
    return redirect('login')


# Vista para estudiante
def reservar_sala(request, horario_id):
    horario = get_object_or_404(Horario, id=horario_id, disponible=True)

    # Crear la reserva
    Reserva.objects.create(
        usuario=request.user,
        horario=horario,
        fecha=now().date()
    )

    # Marcar el horario como ocupado
    horario.disponible = False
    horario.save()

    return redirect('mis_reservas')










    
    
#prueba calendario (experimento)
def obtener_horarios_disponibles(request, sala_id):
    # Obtener la sala seleccionada
    sala = get_object_or_404(Sala, id=sala_id)
    horarios = Horario.objects.filter(sala=sala, disponible=True)  # Filtrar por sala y horarios disponibles
    
    # Crear la lista de eventos
    eventos = []
    for horario in horarios:
        eventos.append({
            "title": f"{horario.hora_inicio} - {horario.hora_fin}",
            "start": horario.fecha.strftime("%Y-%m-%d") + "T" + horario.hora_inicio.strftime("%H:%M:%S"),
            "end": horario.fecha.strftime("%Y-%m-%d") + "T" + horario.hora_fin.strftime("%H:%M:%S"),
            "id": horario.id,
        })
    
    # Depurar los eventos en la consola
    print(f"Eventos para la sala {sala.numero_sala}: {eventos}")
    
    # Renderizar la plantilla solo si no es una solicitud AJAX
    if request.method == "GET" and "fetch" not in request.GET:
        return render(request, 'estudiantes/salas_disponibles.html', {'sala': sala})
    
    # Responder con JSON si es una solicitud AJAX
    return JsonResponse(eventos, safe=False)


def calcular_fecha_proxima(fecha):
    dias = {
        'Lunes': 0,
        'Martes': 1,
        'Miércoles': 2,
        'Jueves': 3,
        'Viernes': 4,
        'Sábado': 5,
    }
    hoy = datetime.now().date()
    delta = (dias[fecha] - hoy.weekday()) % 7
    return hoy + timedelta(days=delta)


#reservar horarios 
@login_required
def reservar_horario(request, sala_id):
    if request.method == "POST":
        # Recuperar el horario seleccionado
        horario_id = request.POST.get('horario_id')
        
        if not horario_id:
            return HttpResponseBadRequest("El ID del horario es requerido.")

        horario = get_object_or_404(Horario, id=horario_id, sala_id=sala_id)

        # Verificar si el horario está disponible
        if not horario.disponible:
            return HttpResponseBadRequest("El horario ya no está disponible.")

        # Crear la reserva
        Reserva.objects.create(
            estudiante=request.user,  # Usuario autenticado
            horario=horario,
        )
        
        # Marcar el horario como no disponible
        horario.disponible = False
        horario.save()

        # Mensaje de éxito
        messages.success(request, "Reserva creada con éxito.")

        # Redirigir a una página de confirmación o al calendario
        return redirect('salas', sala_id=sala_id)
    
    return HttpResponseBadRequest("Método no permitido.")











#via segura pero visualmente inferior
class CalendarioReservaView(View):
    def get(self, request, sala_id):
        sala = Sala.objects.get(id=sala_id)
        horarios = Horario.objects.filter(sala=sala, disponible=True)
        form = ReservaForm(sala_id=sala_id)
        return render(request, 'calendario_reserva.html', {
            'sala': sala,
            'horarios': horarios,
            'form': form
        })

    def post(self, request, sala_id):
        form = ReservaForm(request.POST, sala_id=sala_id)
        if form.is_valid():
            sala = form.cleaned_data['sala']
            horario = form.cleaned_data['horario']
            fecha = form.cleaned_data['fecha']

            # Crear la reserva
            Reserva.objects.create(
                usuario=request.user,
                sala=sala,
                horario=horario,
                fecha=fecha
            )

            # Marcar el bloque como no disponible
            horario.disponible = False
            horario.save()

            return redirect('listar_salas')
        return render(request, 'calendario_reserva.html', {'form': form})

#listado de salas  
@method_decorator(login_required, name='dispatch')
class ListarSalasView(View):
    def get(self, request):
        salas = Sala.objects.all()
        return render(request, 'estudiantes/listad_salas.html', {'salas': salas})
    







    

# Panel principal del staff
def staff_dashboard(request):
    if request.user.user_type != 'staff':
        return redirect('login')  # Restringe acceso a solo usuarios staff
    return render(request, 'staff/home.html')

# Listar reservas
def listar_reservas(request):
    if request.user.user_type != 'admin':
        return redirect('login')
    reservas = Reserva.objects.all()
    return render(request, 'staff/listar_reservas.html', {'reservas': reservas})

# Gestión de salas
def gestionar_salas(request):
    if request.user.user_type != 'admin':
        return redirect('login')
    salas = Sala.objects.all()
    if request.method == 'POST':
        form = SalaForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('gestionar_salas')
    else:
        form = SalaForm()
    return render(request, 'staff/gestionar_salas.html', {'salas': salas, 'form': form})

# Gestión de horarios
def gestionar_horarios(request):
    if request.user.user_type != 'admin':
        return redirect('login')
    horarios = Horario.objects.all()
    if request.method == "POST":
        form = HorarioForm(request.POST)
        if form.is_valid():
            form.save()  # La lógica de la fecha se maneja en el formulario
            return redirect('gestionar_horarios')
    else:
        form = HorarioForm()
    
    return render(request, 'staff/gestionar_horarios.html', {'form': form, 'horarios' : horarios})



def editar_sala(request, sala_id):
    if request.user.user_type != 'admin':
        return redirect('login')
    sala = get_object_or_404(Sala, id=sala_id)
    if request.method == 'POST':
        form = SalaForm(request.POST, instance=sala)
        if form.is_valid():
            form.save()
            return redirect('gestionar_salas')
    else:
        form = SalaForm(instance=sala)
    return render(request, 'staff/editar_sala.html', {'form': form, 'sala': sala})

def editar_horario(request, horario_id):
    if request.user.user_type != 'admin':
        return redirect('login')
    horario = get_object_or_404(Horario, id=horario_id)
    if request.method == 'POST':
        form = HorarioForm(request.POST, instance=horario)
        if form.is_valid():
            form.save()
            return redirect('gestionar_horarios')
    else:
        form = HorarioForm(instance=horario)
    return render(request, 'staff/editar_horario.html', {'form': form, 'horario': horario})

def eliminar_reserva(request, reserva_id):
    if request.user.user_type != 'admin':
        return redirect('login')
    reserva = get_object_or_404(Reserva, id=reserva_id)
    horario = reserva.horario

    # Eliminar la reserva
    reserva.delete()

    # Marcar el bloque horario como disponible
    horario.disponible = True
    horario.save()

    return redirect('listar_reservas')