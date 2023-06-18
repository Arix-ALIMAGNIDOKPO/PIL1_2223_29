from django.shortcuts import render, HttpResponse


def Acceuil(request):
    return render(request, 'Accueil.html')


def Connexion(request):
    return render(request, 'Connexion.html')


def Inscription(request):
    return render(request, 'Inscription.html')
