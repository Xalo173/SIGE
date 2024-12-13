from django.contrib.auth.models import AbstractUser
from django.db import models

# Modelo personalizado de usuario
class CustomUser(AbstractUser):
    USER_TYPE_CHOICES = (
        ('admin','Admin'),
        ('regular', 'Regular'),
    )
    user_type = models.CharField(max_length=10, choices=USER_TYPE_CHOICES, default='regular')

# Modelo de Sala
class Sala(models.Model):
    numero_sala = models.CharField(max_length=10, unique=True)  # Añadido unique para evitar duplicados
    disponible = models.BooleanField(default=True)

    def __str__(self):
        return f"Sala {self.numero_sala}"

# Modelo de Horario
class Horario(models.Model):
    DIAS_SEMANA_CHOICES = [
        ('lunes', 'Lunes'),
        ('martes', 'Martes'),
        ('miercoles', 'Miércoles'),
        ('jueves', 'Jueves'),
        ('viernes', 'Viernes'),
        ('sabado', 'Sábado'),
    ]

    dia_semana = models.CharField(max_length=15, choices=DIAS_SEMANA_CHOICES)
    hora_inicio = models.TimeField()
    hora_fin = models.TimeField()
    fecha = models.DateField(null=True, blank=True)  # Nueva fecha específica
    disponible = models.BooleanField(default=True)
    sala = models.ForeignKey(Sala, on_delete=models.CASCADE, related_name="horarios")

    def __str__(self):
        return f"{self.dia_semana}: {self.hora_inicio} - {self.hora_fin} (Sala {self.sala.numero_sala})"

    class Meta:
        unique_together = ('dia_semana', 'hora_inicio', 'hora_fin', 'sala')  # Asegura que no haya horarios duplicados

# Modelo de Reserva
class Reserva(models.Model):
    usuario = models.ForeignKey(CustomUser, on_delete=models.CASCADE)
    sala = models.ForeignKey(Sala, on_delete=models.CASCADE)
    horario = models.ForeignKey(Horario, on_delete=models.CASCADE, null=True, blank=True)
    fecha = models.DateField()

    def __str__(self):
        return f"Reserva - Sala {self.sala.numero_sala} ({self.fecha}) por {self.usuario.username}"

    class Meta:
        unique_together = ('usuario', 'sala', 'horario', 'fecha')  # Evita reservas duplicadas

# Modelo de Notificación
class Notificacion(models.Model):
    usuario = models.ForeignKey(CustomUser, on_delete=models.CASCADE, related_name="notificaciones")
    mensaje = models.TextField()
    fecha_creacion = models.DateTimeField(auto_now_add=True)
    leida = models.BooleanField(default=False)

    def marcar_leida(self):
        self.leida = True
        self.save()

    def __str__(self):
        return f"Notificación para {self.usuario.username} - {self.mensaje[:30]}..."

    class Meta:
        ordering = ['-fecha_creacion']  # Ordena por fecha de creación descendente
