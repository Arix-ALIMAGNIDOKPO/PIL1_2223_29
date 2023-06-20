from django.shortcuts import render

# Create your views here.
def Accueil(request):
    return render(request,'Accueil.html')
def Connexion(request):
    return render(request,'Connexion.html')
def Inscription(request):
    return render(request,'Inscription.html')
