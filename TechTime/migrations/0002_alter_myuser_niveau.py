# Generated by Django 4.0 on 2023-06-22 18:20

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('TechTime', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='myuser',
            name='niveau',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='TechTime.niveau'),
        ),
    ]