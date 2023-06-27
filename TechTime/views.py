from django.shortcuts import render, HttpResponse, redirect
from .models import Niveau, MyUser as User, Matiere
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required


def Accueil(request):
    return render(request, 'Accueil.html')


def Connexion(request):
    
    if request.user.is_authenticated:
        return redirect('emplois')
    
    errors = []

    if request.method == "POST":
        email = request.POST.get('email')
        password = request.POST.get('password')

        if email and password:
            user = authenticate(email=email, password=password)

            if user is not None:
                login(request, user)
                return redirect('emplois')
            else:
                errors.append("Mot de passe ou email incorrect")
        else:
            errors.append("Veuillez bien remplir tout les champs")

    context = {
        'niveaux': Niveau.objects.all(),
        'errors': errors,
    }
    
    return render(request, 'Connexion.html', context)


def Inscription(request):
    
    if request.user.is_authenticated:
        return redirect('connexion')
    
    errors = []

    if request.method == "POST":
        email = request.POST.get('email')
        first_name = request.POST.get('first_name')
        last_name = request.POST.get('last_name')
        password = request.POST.get('password')
        confirm_password = request.POST.get('confirm_password')
        niveau = request.POST.get('niveau')

        if email and first_name and last_name and password and niveau:

            if password == confirm_password:
                try:
                    user = User.objects.create_user(email, password)
                    user.first_name = first_name
                    user.last_name = last_name
                    user.niveau = Niveau.objects.get(id=niveau)
                    user.save()

                    login(request, user)
                    return redirect('accueil')
                except:
                    errors.append(
                        "Un utilisateur existe déjà avec cet email")

            else:
                errors.append("Vos deux mots de passe ne sont pas identiques")
        else:
            errors.append("Veuillez bien remplir tout les champs")

    context = {
        'niveaux': Niveau.objects.all(),
        'errors': errors,
    }

    return render(request, 'Inscription.html', context)

def deconnexion(request):
    logout(request)
    return redirect('accueil')

@login_required(login_url='connexion')
def Emplois(request, pk):
    
    teachers = User.objects.filter(is_teacher=True)
    matieres = Matiere.objects.all()
    
    context = {
        'days': ["Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi"],
        'hours': ["7h-10", "10h-13h", "13h-16", "16h-19h"],
        'niveaux': Niveau.objects.all(),
        'level': Niveau.objects.get(id=pk),
        'teachers': teachers,
        'matieres': matieres,
    }
    
    return render(request, 'Emplois.html', context)