import os

if not os.environ.get('SECRET_KEY'):
    try:
        with open('.hoto_skey', 'rb') as secret_key:
            key = secret_key.read()
    except (OSError, IOError):
        key = None

    if not key:
        key = os.urandom(128)
        try:
            with open('.hoto_skey', 'wb') as secret_key:
                secret_key.write(key)
                secret_key.flush()
        except (OSError, IOError):
            pass


class Config(object):

    DEBUG = True
    SECRET_KEY = os.environ.get('SECRET_KEY') or key


class TestingConfig(Config):

    SECRET_KEY = 'AAAAAAAAAAAAAAAA'
    DEBUG = True
