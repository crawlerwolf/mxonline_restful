# Generated by Django 3.2.12 on 2022-02-25 10:53

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('organization', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='courseorg',
            name='course_nums',
        ),
    ]
