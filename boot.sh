#!/bin/sh
source venv/bin/activate
#flask db upgrade
flask  compile
exec gunicorn -b :5000 --access-logfile - --error-logfile - pages:app
