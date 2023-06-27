from django.shortcuts import render, HttpResponse, redirect
from .models import Niveau, MyUser as User, Matiere, Shedule
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
import datetime

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
    
    errors = []
    success = ""
    teachers = User.objects.filter(is_teacher=True)
    matieres = Matiere.objects.filter(niveau_id=pk)
    
    if request.method == "POST":
        teacher_id = request.POST.get('teacher_id')
        subject_id = request.POST.get('subject_id')
        start_time = request.POST.get('start_time')
        end_time = request.POST.get('end_time')
        weekNum = request.POST.get('weekNum')
        
        if teacher_id and subject_id and pk and start_time and end_time:
            
            try:
                Shedule.objects.create(
                teacher=User.objects.get(id=teacher_id),
                subject=Matiere.objects.get(id=subject_id),
                start_time=start_time,
                end_time=end_time,
                week_num=weekNum,
            )
            except:
                errors.append("Erreur lors de la création de l'emploi du temps")
            
            success = "Votre emploi du temps a été bien enregistré"
        else:
            errors.append("Veuillez bien remplir tout les champs")
    
    context = {
        'days': ["Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi"],
        'hours': ["7h-10", "10h-13h", "13h-16", "16h-19h"],
        'niveaux': Niveau.objects.all(),
        'level': Niveau.objects.get(id=pk),
        'teachers': teachers,
        'matieres': matieres,
        'errors': errors,
        'success': success,
    }
    
    return render(request, 'Emplois.html', context)