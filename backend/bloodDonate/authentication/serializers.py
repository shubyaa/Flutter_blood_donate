from rest_framework import serializers
from .models import UserModel

class UserModelSerializer(serializers.ModelSerializer):
    first_name = serializers.CharField(max_length=50, required=True)
    last_name = serializers.CharField(max_length=50, required=True)
    email = serializers.EmailField(required=True)
    phone = serializers.CharField(max_length=12, required=True)
    blood_group = serializers.CharField(required=True)
    gender = serializers.CharField(required=True)
    token = serializers.CharField(required=False)
    
    
    class Meta:
        model = UserModel
        fields = [
            "id",
            "first_name",
            "last_name",
            "username",
            "email",
            "phone",
            "blood_group",
            "gender",
            "password",
            "token",
            ]
        
    def create(self, validated_data):
        user = UserModel.objects.create(**validated_data)
        # print(validated_data)
        user.set_password(validated_data["password"])
        user.save()
        return user
    
    def update(self, instance, validated_data):
        
        instance.first_name =  validated_data.get('first_name', instance.first_name)
        instance.last_name =  validated_data.get('last_name', instance.last_name)
        instance.email =  validated_data.get('email', instance.email)
        instance.phone =  validated_data.get('phone', instance.phone)
        instance.blood_group =  validated_data.get('blood_group', instance.blood_group)
        instance.gender =  validated_data.get('gender', instance.gender)
        
        instance.save()      
        
        return super().update(instance, validated_data)