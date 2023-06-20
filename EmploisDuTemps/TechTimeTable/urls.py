from django import views 
from django.urls import path,include
from .views import *

urlpatterns = [
    path('', Accueil, name="Accueil"),
    path('Connexion', Connexion, name="Connexion"),
    path('Inscription', Inscription, name="Inscription"),
]

