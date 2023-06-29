from django.contrib.auth.models import BaseUserManager, AbstractBaseUser, PermissionsMixin
from django.db import models
from colorfield.fields import ColorField


class Niveau(models.Model):
    label = models.CharField(max_length=100)
    capacity = models.IntegerField()

    def __str__(self):
        return self.label

    def serialize(self):
        return {
            'id': self.id,
            'label': self.label,
            'capacity': self.capacity,
        }


class Matiere(models.Model):
    label = models.CharField(max_length=100)
    bgColor = ColorField(default='#FF0000', null=True, blank=True)
    niveau = models.ForeignKey(Niveau, on_delete=models.CASCADE, null=True)

    def __str__(self):
        return self.label

    def serialize(self):
        return {
            'id': self.id,
            'label': self.label,
            'bgColor': self.bgColor,
            'niveau': self.niveau.serialize(),
        }


class Classroom(models.Model):
    label = models.CharField(max_length=100)
    desc = models.TextField(null=True)

    def __str__(self):
        return self.label

    def serialize(self):
        return {
            'id': self.id,
            'label': self.label,
            'desc': self.desc,
        }


class MyUserManager(BaseUserManager):
    def create_user(self, email, password=None):
        """
        Creates and saves a User with the given email, date of
        birth and password.
        """
        if not email:
            raise ValueError("Users must have an email address")

        user = self.model(
            email=self.normalize_email(email),
        )

        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, password=None):
        """
        Creates and saves a superuser with the given email, date of
        birth and password.
        """
        user = self.create_user(
            email,
            password=password,
        )
        user.is_admin = True
        user.is_staff = True
        user.is_superuser = True
        user.save(using=self._db)
        return user


class MyUser(AbstractBaseUser, PermissionsMixin):
    email = models.EmailField(
        verbose_name="email address",
        max_length=255,
        unique=True,
    )
    first_name = models.CharField(max_length=40)
    last_name = models.CharField(max_length=40)
    password = models.CharField(max_length=255)
    niveau = models.ForeignKey(
        Niveau, on_delete=models.CASCADE, null=True, blank=True)
    is_active = models.BooleanField(default=True)
    is_admin = models.BooleanField(default=False)
    is_staff = models.BooleanField(default=False)
    is_teacher = models.BooleanField(default=False)

    objects = MyUserManager()

    USERNAME_FIELD = "email"

    def __str__(self):
        return self.email

    def serialize(self):
        return {
            'id': self.id,
            'first_name': self.first_name,
            'last_name': self.last_name,
            'email': self.email,
        }


class Shedule(models.Model):
    teacher = models.ForeignKey(MyUser, on_delete=models.CASCADE)
    subject = models.ForeignKey(Matiere, on_delete=models.CASCADE)
    classroom = models.ForeignKey(
        Classroom, on_delete=models.SET_NULL, null=True)
    niveau = models.ForeignKey(
        Niveau, on_delete=models.SET_NULL, null=True)
    start_time = models.DateTimeField()
    end_time = models.DateTimeField()
    week_num = models.IntegerField()
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"emploi du temps du {self.start_time} au {self.end_time} de {self.subject.label}"
