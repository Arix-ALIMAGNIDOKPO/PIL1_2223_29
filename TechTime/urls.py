from django.urls import path
from django.contrib.auth import views as auth_views
from . import views
from .views import Accueil


urlpatterns = [
    path('', views.Accueil, name="accueil"),
    path('connexion/', views.Connexion, name='connexion'),
    path('inscription/', views.Inscription, name='inscription'),
    path('se-deconnecter/', views.deconnexion, name='logout'),
    path('emplois/<int:pk>', views.Emplois, name='emplois'),
    path('delete-shedule/<int:pk>', views.destroy_shedule, name='destroy_shedule'),
    path('votre-emploi-temps', views.emploi_student, name='emploi_student'),
    # reinitialisation du mot de passe
    path('reset_password', auth_views.PasswordResetView.as_view(
        template_name='Password_reset.html'), name='reset_password'),
    path('reset_password_send', auth_views.PasswordResetDoneView.as_view(
        template_name='Password_reset_sent.html'), name='password_reset_done'),
    path('reset/<uidb64>/<token>', auth_views.PasswordResetConfirmView.as_view(
        template_name='Password_reset_form.html'), name='password_reset_confirm'),
    path('reset_password_complete', auth_views.PasswordResetCompleteView.as_view(
        template_name='Password_reset_done.html'), name='password_reset_complete')
]
