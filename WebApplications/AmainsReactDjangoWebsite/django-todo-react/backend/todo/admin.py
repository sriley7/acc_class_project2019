from django.contrib import admin
from .models import ToDo

# originally created by https://github.com/Jordanirabor/django-todo-react
# project modified by Ashley Mains
class TodoAdmin(admin.ModelAdmin):
    list_display = ('title', 'description', 'completed')
# Register your models here.
admin.site.register(ToDo, TodoAdmin)