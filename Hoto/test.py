from flask import render_template, Blueprint

test = Blueprint('test', __name__)

@test.route('/')
def test_home():
    return 'test page'
