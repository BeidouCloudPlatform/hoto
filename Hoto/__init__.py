from flask import Flask

__version__ = '0.1'


def create_app(config='Hoto.config.Config'):
    app = Flask(__name__)
    with app.app_context():
        app.config.from_object(config)

        from Hoto.test import test
        app.register_blueprint(test)
        return app
