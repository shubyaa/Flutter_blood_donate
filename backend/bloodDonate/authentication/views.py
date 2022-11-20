from django.shortcuts import render
from django.http import HttpResponse

from django.contrib.auth import login, logout
from django.contrib.auth import logout as lg

from rest_framework.response import Response
from rest_framework.authtoken.models import Token
from rest_framework.views import APIView
from rest_framework import status, permissions
from rest_framework.decorators import api_view,permission_classes
from .models import UserModel
from .serializers import UserModelSerializer
# Create your views here.


### This is a demo json object skeleton for practice
# {
#   "first_name" : "Sheetal",
#   "last_name" : "Makwana",
#   "email" : "sheet@gmail.com",
#   "phone" : "845978965",
#   "blood_group" : "AB+",
#   "gender" : "F"
# }

def hello(request):
    return HttpResponse("""<html>
    <body>
    Hello World
    </body>
    </html>""")
    

@api_view(['GET'])
@permission_classes((permissions.IsAuthenticated,))
def logout(request):
        

    lg(request)
    return Response({'status':'success', 'message':"Logged out"}, status=status.HTTP_200_OK)

    
   
@permission_classes((permissions.AllowAny,))
class UserLogin(APIView):
    def get(self, request):
        return Response({'status':'success', 'data':'data is called'}, status=status.HTTP_200_OK)
    
    def post(self, request):
        data_ = {
            'email' : request.data.get('email'),
            'password' : request.data.get('password')
        }
        
        try:
            user = UserModel.objects.get(email=data_.get('email'))
            
            token = Token.objects.get_or_create(user=user)[0].key
            print(token)
            if not user.check_password(data_.get('password')):
                return Response({'status': 'failure', 'data':"Password Incorrect"}, status=status.HTTP_403_FORBIDDEN)
            else:
                if user is not None:
                    if user.is_active:
                        login(request, user)
                        # serializer = UserModelSerializer(user)
                        
                        return Response({'status': 'success', 'message':"Logged In", 'token':token}, status=status.HTTP_200_OK)
                    else:
                        # login(user)
                        # serializer = UserModelSerializer(user)
                        return Response({'status': 'failure', 'message':'Errors'}, status=status.HTTP_202_ACCEPTED)

        except Exception as e:
            print(e)
            return Response({'status': 'failure', 'data':"1515"}, status=status.HTTP_403_FORBIDDEN)

        # return Response({'status': 'success', 'data':'email'}, status=status.HTTP_200_OK0)


@permission_classes((permissions.AllowAny,))
class UserModelGetUpdates(APIView):
    
    permission_classes = (permissions.AllowAny,)
    
    def get(self, request, user_id):
        result = UserModel.objects.filter(id=user_id)
        print(result.exists())
        if result.exists():
            serializers = UserModelSerializer(result, many=True)
            return Response({'status':'success', 'data':serializers.data}, status=status.HTTP_200_OK)
        else:
            return Response({"status": "failure", "data":"User dosen't exists"}, status=status.HTTP_404_NOT_FOUND)

    def delete(self, request, user_id, *args, **kwargs):
        instance_ = UserModel.objects.filter(id=user_id)
        
        if not instance_:
            return Response({"status": "failure", "data":"User dosen't exists"}, status=status.HTTP_404_NOT_FOUND)
        
        serializer = UserModelSerializer(instance_, many=True)
        instance_.get(id=user_id)
        instance_.delete()
        return Response({"status":"success", "data":serializer.data}, status=status.HTTP_200_OK)


@permission_classes((permissions.AllowAny,))    
class UserModelView(APIView):
    
    def get(self, request, *args, **kwargs):
        result = UserModel.objects.filter(is_superuser=0)
        serializers = UserModelSerializer(result, many=True)
        return Response({'status':'success', 'data':serializers.data}, status=status.HTTP_200_OK)
    
    def post(self, request, *args, **kwargs):
        
        data_ = {
            'first_name': request.data.get('first_name'),
            'last_name': request.data.get('last_name'),
            'username' : request.data.get('username'),
            'email': request.data.get('email'),
            'phone': request.data.get('phone'),
            'blood_group': request.data.get('blood_group'),
            'gender': request.data.get('gender'),
            'password': request.data.get('password')
        }
        
        serializer = UserModelSerializer(data=data_)
        if serializer.is_valid():
            user_ = UserModel.objects.filter(email=serializer.validated_data.get('email'))
            if user_.exists():
                return Response({'status':'failure', 'data':"User with that Email Id already exists"}, status=status.HTTP_403_FORBIDDEN)
            else:
                # print(serializer.data['email'])
                serializer.save()
                user = UserModel.objects.get(email = serializer.validated_data.get('email'))
                token_obj, _ = Token.objects.get_or_create(user=user)
                
                
                
                return Response({'status':'success','data':serializer.data, 'token':token_obj}, status=status.HTTP_201_CREATED)
        else:
            return Response({'status':'failure', 'data':serializer.errors, 'token':''}, status=status.HTTP_404_NOT_FOUND)
        
        
