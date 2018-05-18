#!/bin/sh

exec gunicorn 'Hoto:create_app()' \
    --bind '0.0.0.0:4000' \
    --access-logfile "${LOG_FOLDER:-/opt/Hoto/Hoto/logs}/access.log" \
    --error-logfile "${LOG_FOLDER:-/opt/Hoto/Hoto/logs}/error.log"
