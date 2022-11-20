from django.db import models
from django.contrib.auth.models import AbstractUser
from rest_framework.authtoken.models import Token

# Create your models here.

class UserModel(AbstractUser):
    id = models.BigAutoField(primary_key=True)
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    email = models.EmailField()
    phone = models.CharField(max_length=12)
    blood_group = models.CharField(max_length=3)
    age = models.CharField(max_length=5)
    gender = models.CharField(max_length=2)
    key = models.OneToOneField(Token, on_delete=models.CASCADE, parent_link=True, null="123")
    
    def __str__(self) -> str:
        return self.first_name + " " + self.last_name