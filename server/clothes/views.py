from django.db.models import Count

from rest_framework import status
from rest_framework.decorators import action
from rest_framework.permissions import AllowAny
from rest_framework.response import Response
from rest_framework.viewsets import ModelViewSet

from .models import Clothes, MajorCategory, MinorCategory
from .serializers import ClothesSerializer, ClothesRetrieveSerializer

# Create your views here.
class ClothesViewSet(ModelViewSet):
    queryset = Clothes.objects.all()
    majorcategory_queryset = MajorCategory.objects.all()
    minorcategory_queryset = MinorCategory.objects.all()
    serializer_class = ClothesSerializer

    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset()
        serializer = ClothesRetrieveSerializer(queryset, many=True)
        return Response(serializer.data)

    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        serializer = ClothesRetrieveSerializer(instance, context=self.get_serializer_context())
        return Response(serializer.data)

    @action(detail=False, methods=['get'], url_path=r'list/(?P<user_id>[^/.]+)')
    def user_clothes(self, request, user_id):
        params = request.query_params
        queryset = self.get_queryset().filter(user=user_id).order_by('-created_at')

        if 'major' in params:
            queryset = queryset.filter(major_category=params['major']).order_by('-created_at')
        
        serializer = ClothesSerializer(queryset, context=self.get_serializer_context(), many=True)
        data = {
            "results" : serializer.data
        }
        return Response(data)

    @action(detail=False, methods=['get'], url_path=r'stats/(?P<user_id>[^/.]+)')
    def user_clothes_stats(self, request, user_id):
        queryset = self.get_queryset().filter(user=user_id)
        
        total_count = queryset.count()
        color_count = queryset.values('color').annotate(count=Count('color'))
        brand_count = queryset.values('brand').annotate(count=Count('brand'))

        category_count = []
        category_value = queryset.values('major_category').annotate(count=Count('major_category'))
        for i in category_value:
            new_category_value = {'major_category': self.majorcategory_queryset.filter(id=1).values('name_en').get()['name_en'], 'count':i['count']}
            category_count.append(new_category_value)

        data = {
            "total_count" : total_count,
            "category_count" : category_count,
            "color_count" : color_count,
            "brand_count" : brand_count,
        }
        return Response(data)

        
    @action(detail=False, methods=['get'], url_path=r'stats/(?P<user_id>[^/.]+)/(?P<major_category>[a-z]+)')
    def user_clothes_stats_major(self, request, user_id, major_category):
        majorcategory_list = [i['name_en'] for i in self.majorcategory_queryset.values()]
        if major_category not in majorcategory_list:
            return Response(status=status.HTTP_400_BAD_REQUEST)
        else:
            queryset = self.get_queryset().filter(user=user_id,
                major_category=self.majorcategory_queryset.filter(name_en=major_category).values('id').get()['id'])
            
            total_count = queryset.count()
            color_count = queryset.values('color').annotate(count=Count('color'))
            brand_count = queryset.values('brand').annotate(count=Count('brand'))

            category_count = []
            category_value = queryset.values('minor_category').annotate(count=Count('minor_category'))
            for i in category_value:
                new_category_value = {'minor_category': self.minorcategory_queryset.filter(id=i['minor_category']).values('name_en').get()['name_en'], 'count':i['count']}
                category_count.append(new_category_value)
                
            data = {
                "total_count" : total_count,
                "category_count" : category_count,
                "color_count" : color_count,
                "brand_count" : brand_count,
            }
            return Response(data)

