#!/bin/bash
service rabbitmq-server start > /tmp/rabbit.out 2> /tmp/rabbit.err
/usr/sbin/rabbitmqctl add_user gmzeuboy gmzeupass >> /tmp/rabbit.out 2>> /tmp/rabbit.err
/usr/sbin/rabbitmqctl add_vhost gmzeuboy >> /tmp/rabbit.out 2>> /tmp/rabbit.err
/usr/sbin/rabbitmqctl set_permissions -p gmzeuboy gmzeuboy '.*' '.*' '.*' >> /tmp/rabbit.out 2>> /tmp/rabbit.err
cd /root/AetDjango && python manage.py runserver 0.0.0.0:8000 &
cd /root/AetDjango && celery worker -A aeternuum.celery -B -l info &
cd
