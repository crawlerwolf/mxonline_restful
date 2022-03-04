# -*- coding: utf-8 -*-
from django_filters import rest_framework as filters
from .models import Teacher


class TeacherFilter(filters.FilterSet):
    max_work_years = filters.NumberFilter(field_name="work_years", lookup_expr='gte')
    min_work_years = filters.NumberFilter(field_name="work_years", lookup_expr='lte')
    points_contains = filters.CharFilter(field_name="points", lookup_expr='contains')

    class Meta:
        model = Teacher
        fields = ['org', 'points_contains', 'max_work_years', 'min_work_years']

