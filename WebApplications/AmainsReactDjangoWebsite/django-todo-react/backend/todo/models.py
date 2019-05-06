from django.db import models

# Create your models here.
# originally created by https://github.com/Jordanirabor/django-todo-react
# project modified by Ashley Mains
class ToDo(models.Model):
    title = models.CharField(max_length=120)
    description = models.TextField()
    completed = models.BooleanField(default=False)

    def _str_(self):
        return self.title