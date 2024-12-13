# SIGE/urls.py
from django.urls import path
from SIGE import views

urlpatterns = [
    path('', views.CustomLoginView.as_view(), name='login'),
    path('regular/dashboard/', views.regular_dashboard, name='base'),
    path('register/', views.register, name='register'),
    path('logout/', views.logout_view, name='logout'),
    #estudiante v1
    path('salas/', views.ListarSalasView.as_view(), name= 'salas'),
    path('reservar/<int:sala_id>/',views.CalendarioReservaView.as_view() , name='crear_reserva'),
    #staff urls
    path('staff/', views.admin_dashboard, name='staff/home'),
    path('staff/reservas/', views.listar_reservas, name='listar_reservas'),
    path('staff/salas/', views.gestionar_salas, name='gestionar_salas'),
    path('staff/horarios/', views.gestionar_horarios, name='gestionar_horarios'),
    path('staff/salas/<int:sala_id>/editar/', views.editar_sala, name='editar_sala'),
    path('staff/horarios/<int:horario_id>/editar/', views.editar_horario, name='editar_horario'),
    path('staff/reservas/<int:reserva_id>/eliminar/', views.eliminar_reserva, name='eliminar_reserva'),
    # Vista para el calendario interactivo
    path('horarios/disponibles/<int:sala_id>/', views.obtener_horarios_disponibles, name='obtener_horarios_disponibles'),
    path('estudiante/reservar/<int:sala_id>/', views.reservar_horario, name='reservar_horario'),
]


