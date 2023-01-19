from .models import Clothes

from rest_framework import serializers

class ClothesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Clothes
        fields = ['name', 'major_category', 'user']