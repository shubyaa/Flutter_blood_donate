from django.urls import path
from . import views
from rest_framework.authtoken import views as auth_views

urlpatterns = [

    path('users/', view=views.UserModelView.as_view(), name="users"),
    
    # path('update/', view=views.UpdateUserModel.as_view())
]