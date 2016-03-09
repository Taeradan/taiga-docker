#!/bin/sh

python3 manage.py migrate --noinput
python3 manage.py loaddata initial_user
python3 manage.py loaddata initial_project_templates
python3 manage.py loaddata initial_role
python3 manage.py compilemessages
python3 manage.py collectstatic --noinput
