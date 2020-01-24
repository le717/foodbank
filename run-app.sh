exec gunicorn --bind 0.0.0.0:5000 --workers 2 --log-level error --error-logfile /var/log/errors.log wsgi:app
