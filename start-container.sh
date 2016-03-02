#!/bin/bash
service rabbitmq-server start 
/usr/sbin/rabbitmqctl add_user gmzeuboy gmzeupass 
/usr/sbin/rabbitmqctl add_vhost gmzeuboy
/usr/sbin/rabbitmqctl set_permissions -p gmzeuboy gmzeuboy '.*' '.*' '.*'
cd /root/AetDjango && python manage.py runserver 0.0.0.0:8000 &
cd /root/AetDjango && celery worker -A aeternuum.celery -B -l info &
cd
