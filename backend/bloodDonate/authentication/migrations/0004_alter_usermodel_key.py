# Generated by Django 4.1.3 on 2022-11-20 06:10

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('authtoken', '0003_tokenproxy'),
        ('authentication', '0003_usermodel_key'),
    ]

    operations = [
        migrations.AlterField(
            model_name='usermodel',
            name='key',
            field=models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, parent_link=True, to='authtoken.token'),
        ),
    ]
