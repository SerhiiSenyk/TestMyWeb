#!/bin/sh
source venv/bin/activate
flask db upgrade
flask  translate compile
gunicorn -b :5000 --access-logfile - --error-logfile - pages:app
