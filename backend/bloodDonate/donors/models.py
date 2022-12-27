from django.db import models

# Create your models here.


class DonorCard(models.Model):
    id = models.BigAutoField(primary_key=True)
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    email = models.EmailField()
    phone = models.CharField(max_length=12)
    blood_group = models.CharField(max_length=3)
    age = models.CharField(max_length=5)
    gender = models.CharField(max_length=2)    