from django.urls import path
from . import views


urlpatterns = [
    path('accueil/', views.Acceuil),
    path('connexion/', views.Connexion, name='connexion'),
    path('inscription/', views.Inscription, name='inscription'),
]
