from django.shortcuts import render

# Create your views here.
# originally created by https://github.com/Jordanirabor/django-todo-react
# project modified by Ashley Mains
from django.shortcuts import render
from rest_framework import viewsets
from .serializers import ToDoSerializer
from .models import ToDo

class ToDoView(viewsets.ModelViewSet):
    serializer_class = ToDoSerializer
    queryset = ToDo.objects.all()