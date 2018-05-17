#!/usr/bin/env bash

# Check that a .hoto_skey file or SECRET_KEY envvar is set
if [ ! -f ".hoto_skeykey" ] && [ -z "$SECRET_KEY" ]; then
    if [ "$WORKERS" -gt 1 ]; then
        echo "[ ERROR ] You are configured to use more than 1 worker."
        echo "[ ERROR ] To do this, you must define the SECRET_KEY environment variable or create a .hoto_skey file."
        echo "[ ERROR ] Exiting..."
        exit 1
    fi
fi

if [ -z "$WORKERS" ]; then
    WORKERS=1
fi



# Start Hoto
echo "Starting Hoto"
gunicorn 'Hoto:create_app()' \
    --bind '0.0.0.0:8000' \
    --workers $WORKERS \
    --worker-class 'gevent' \
    --access-logfile "${LOG_FOLDER:-/opt/Hoto/Hoto/logs}/access.log" \
    --error-logfile "${LOG_FOLDER:-/opt/Hoto/Hoto/logs}/error.log"
