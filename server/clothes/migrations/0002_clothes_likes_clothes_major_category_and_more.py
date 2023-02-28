# Generated by Django 4.1.5 on 2023-02-26 12:37

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('clothes', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='clothes',
            name='likes',
            field=models.ManyToManyField(blank=True, related_name='liked_clothes', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AddField(
            model_name='clothes',
            name='major_category',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.PROTECT, related_name='clothes', to='clothes.majorcategory'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='clothes',
            name='minor_category',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.PROTECT, related_name='clothes', to='clothes.minorcategory'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='clothes',
            name='user',
            field=models.ForeignKey(db_column='user_id', default=1, on_delete=django.db.models.deletion.CASCADE, related_name='clothes', to=settings.AUTH_USER_MODEL),
            preserve_default=False,
        ),
    ]
