from django.urls import path
from django.contrib.auth import views as auth_views
from . import views
from .views import Accueil



urlpatterns = [
    path('accueil/', views.Accueil, name="accueil"),
    path('connexion/', views.Connexion, name='connexion'),
    path('inscription/', views.Inscription, name='inscription'),
    path('se-deconnecter/', views.deconnexion, name='logout'),
    path('emplois/', views.Emplois, name='emplois'),
    #reinitialisation du mot de passe
    path('reset_password', auth_views.PasswordResetView.as_view(), name='reset_password'),
    path('reset_password_send', auth_views.PasswordResetDoneView.as_view(), name='password_reset_done'),
    path('reset/<uidb64>/<token>', auth_views.PasswordResetConfirmView.as_view(), name='password_reset_confirm'),
    path('reset_password_complete', auth_views.PasswordResetCompleteView.as_view(), name='password_reset_complete')
]
