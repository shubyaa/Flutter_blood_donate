from django.urls import path
from . import views
from rest_framework.authtoken import views as auth_views

urlpatterns = [
    path('',view=views.hello, name="home"),
    path('users/', view=views.UserModelView.as_view(), name="users"),
    path('users/<int:user_id>', view=views.UserModelGetUpdates.as_view()),
    path('token/', view=auth_views.obtain_auth_token),
    
    path('login/', view=views.UserLogin.as_view()),
    path('logout/', view=views.logout)
]