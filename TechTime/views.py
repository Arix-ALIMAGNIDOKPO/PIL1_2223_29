from django.shortcuts import render, HttpResponse, redirect
from django.http import JsonResponse
from .models import Niveau, MyUser as User, Matiere, Shedule, Classroom
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from datetime import datetime, timedelta
from django.core.mail import send_mail
from django.db.models import Q


def send_mail_for_student(shedule, current_week):
    message = f"Votre emploi du temps de la semaine {current_week} a été mise à jour"
    students = User.objects.filter(niveau_id=shedule.niveau.id)

    for student in students:
        try:
            send_mail(
                f"Emploi du temps de la semaine {current_week}",
                message,
                "TechTimeTable techtimetable29@gmail.com",
                [student.email],
                fail_silently=True,
            )
        except:
            continue


def get_week_num(date):
    date = datetime.fromisoformat(date)
    return date.isocalendar()[1]


def get_hour_range(time):
    hour = time.hour

    if 0 <= hour < 10:
        return 1
    elif 10 <= hour < 13:
        return 2
    elif 13 <= hour < 16:
        return 3
    elif 16 <= hour < 24:
        return 4


def get_timetable_data(niveau_id: int | None = None, current_week: bool = False, week=None):

    if current_week:
        start_date = datetime.now().date() - timedelta(days=datetime.now().date().weekday())
        end_date = start_date + timedelta(days=6)
        timetable_entries = Shedule.objects.filter(
            start_time__date__range=(start_date, end_date), niveau_id=niveau_id)
    else:
        timetable_entries = Shedule.objects.filter(
            niveau_id=niveau_id, week_num=week)

    all_week = []

    for entry in timetable_entries:
        week_number = entry.start_time.isocalendar()[1]

        if week_number not in all_week:
            all_week.append(week_number)

    grouped_timetable = {}

    for entry in timetable_entries:
        week_number = entry.start_time.isocalendar()[1]
        day_name = entry.start_time.strftime('%A')

        if week_number not in grouped_timetable:
            grouped_timetable[week_number] = {}

        if day_name not in grouped_timetable[week_number]:
            grouped_timetable[week_number][day_name] = {
                1: [],  # 07-10h
                2: [],  # 10h-13h
                3: [],  # 13h-16h
                4: [],  # 16h-19h
            }

        hour_range = get_hour_range(entry.start_time.time())

        grouped_timetable[week_number][day_name][hour_range].append({
            'id': entry.id,
            'subject': entry.subject.serialize(),
            'teacher': entry.teacher.serialize(),
            'niveau': entry.niveau.serialize(),
            'classroom': entry.classroom.serialize(),
            'start_time': str(entry.start_time.strftime("%d/%m/%Y, %H:%M")),
            'end_time': str(entry.end_time.strftime("%d/%m/%Y, %H:%M")),
        })

    timetable_data = []

    days_of_week = ['Monday', 'Tuesday', 'Wednesday',
                    'Thursday', 'Friday', 'Saturday', 'Sunday']
    current_day_index = datetime.now().weekday()

    for i in range(7):
        day_index = (current_day_index + i) % 7
        day_name = days_of_week[day_index]
        day_data = {
            'day_name': day_name.capitalize(),
            'time_slots': {},
        }

        for hour_range in range(1, 5):
            hour_range_data = grouped_timetable.get(
                week, {}).get(day_name, {}).get(hour_range, [])
            day_data['time_slots'][hour_range] = hour_range_data

        timetable_data.append(day_data)

    return [timetable_data, all_week]


def Accueil(request):
    return render(request, 'Accueil.html')


def Connexion(request):

    if request.user.is_authenticated:
        return redirect('emplois', 999999)

    errors = []

    if request.method == "POST":
        email = request.POST.get('email')
        password = request.POST.get('password')

        if email and password:
            user = authenticate(email=email, password=password)

            if user is not None:
                login(request, user)
                return redirect('emplois', 999999)
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
        return redirect('/connexion/')

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


@login_required
def emploi_student(request):
    current_week = datetime.now().isocalendar()[1]
    current_week = int(request.GET.get('week', current_week))
    timetable_data = get_timetable_data(
        request.user.niveau.id, True, current_week)

    context = {
        'timetable_data': timetable_data[0],
        'all_week': timetable_data[1],
        'current_week': current_week,
        'level': request.user.niveau,
    }

    return render(request, 'Emplois.html', context)


@login_required
def destroy_shedule(request, pk):
    next = request.GET.get('next')

    if not request.user.is_staff or not request.user.is_superuser:
        return redirect('emploi_student')

    Shedule.objects.get(id=pk).delete()

    return redirect(next)


@login_required
def Emplois(request, pk):

    if not request.user.is_staff or not request.user.is_superuser:
        return redirect('emploi_student')

    try:
        niveaux = Niveau.objects.get(id=pk)
    except:
        niveaux = Niveau.objects.first()
        pk = niveaux.id

    errors = []
    success = ""
    teachers = User.objects.filter(is_teacher=True)
    matieres = Matiere.objects.filter(niveau_id=pk)

    current_week = datetime.now().isocalendar()[1]
    current_week = int(request.GET.get('week', current_week))

    if request.method == "POST":
        teacher_id = request.POST.get('teacher_id')
        subject_id = request.POST.get('subject_id')
        classroom_id = request.POST.get('classroom_id')
        start_time = request.POST.get('start_time')
        end_time = request.POST.get('end_time')

        if teacher_id and subject_id and pk and start_time and end_time and classroom_id:
            weekNum = get_week_num(start_time)

            try:
                shedule = Shedule.objects.create(
                    teacher=User.objects.get(id=teacher_id),
                    subject=Matiere.objects.get(id=subject_id),
                    classroom=Classroom.objects.get(id=classroom_id),
                    niveau=Niveau.objects.get(id=pk),
                    start_time=start_time,
                    end_time=end_time,
                    week_num=weekNum,
                )
                send_mail_for_student(shedule, current_week)
            except:
                errors.append(
                    "Erreur lors de la création de l'emploi du temps")

            success = "Votre emploi du temps a été bien enregistré"
        else:
            errors.append("Veuillez bien remplir tout les champs")

    timetable_data = get_timetable_data(pk, True, current_week)

    context = {
        'niveaux': Niveau.objects.all(),
        'classrooms': Classroom.objects.all(),
        'level': niveaux,
        'teachers': teachers,
        'matieres': matieres,
        'errors': errors,
        'success': success,
        'timetable_data': timetable_data[0],
        'all_week': timetable_data[1],
        'current_week': current_week,
    }

    return render(request, 'Emplois.html', context)
