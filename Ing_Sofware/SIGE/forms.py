from django import forms
from django.contrib.auth.forms import AuthenticationForm
from datetime import datetime, timedelta
from .models import CustomUser, Sala, Horario

class CustomLoginForm(AuthenticationForm):
    username = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control'}))
    password = forms.CharField(widget=forms.PasswordInput(attrs={'class': 'form-control'}))


class RegisterForm(forms.ModelForm):
    password = forms.CharField(widget=forms.PasswordInput)
    confirm_password = forms.CharField(widget=forms.PasswordInput)

    class Meta:
        model = CustomUser
        fields = ['username', 'email', 'password', 'user_type']

    def clean(self):
        cleaned_data = super().clean()
        password = cleaned_data.get("password")
        confirm_password = cleaned_data.get("confirm_password")

        if password != confirm_password:
            raise forms.ValidationError("Las contraseñas no coinciden")
        
class ReservaForm(forms.Form):
    sala = forms.ModelChoiceField(queryset=Sala.objects.filter(disponible=True), label="Sala")
    fecha = forms.DateField(
        widget=forms.DateInput(attrs={'type': 'date'}),
        label="Fecha"
    )

    def __init__(self, *args, **kwargs):
        sala_id = kwargs.pop('sala_id', None)
        super().__init__(*args, **kwargs)
        if sala_id:
            self.fields['horario'] = forms.ModelChoiceField(
                queryset=Horario.objects.filter(sala_id=sala_id, disponible=True),
                label="Bloque Horario"
            )
        else:
            self.fields['horario'] = forms.ModelChoiceField(
                queryset=Horario.objects.none(),
                label="Bloque Horario"
            )

class SalaForm(forms.ModelForm):
    class Meta:
        model = Sala
        fields = ['numero_sala', 'disponible']

class HorarioForm(forms.ModelForm):
    class Meta:
        model = Horario
        fields = ['sala', 'dia_semana', 'hora_inicio', 'hora_fin', 'disponible']
    
    def save(self, commit=True):
        # Obtén el objeto del formulario pero sin guardarlo aún
        horario = super().save(commit=False)

        # Lógica para calcular la fecha a partir del día de la semana
        dias = {
            'lunes': 0,
            'martes': 1,
            'miercoles': 2,
            'jueves': 3,
            'viernes': 4,
            'sabado': 5,  # Agrega Domingo si es necesario
        }

        # Verifica si dia_semana está en el diccionario
        dia_semana = horario.dia_semana
        if dia_semana not in dias:
            raise ValueError(f"Día de la semana no válido: {dia_semana}")

        hoy = datetime.now().date()
        delta = (dias[dia_semana] - hoy.weekday()) % 7
        horario.fecha = hoy + timedelta(days=delta)
        
        if commit:
            horario.save()
        
        return horario