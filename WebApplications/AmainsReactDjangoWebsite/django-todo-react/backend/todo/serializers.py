#todo serializers.py

from rest_framework import serializers
from .models import ToDo

# originally created by https://github.com/Jordanirabor/django-todo-react
# project modified by Ashley Mains
class ToDoSerializer(serializers.ModelSerializer):
    class Meta:
        model = ToDo
        fields =('id',  'title', 'description', 'completed')