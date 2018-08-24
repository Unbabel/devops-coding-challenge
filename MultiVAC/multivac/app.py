# coding: utf-8
from flask import Flask

from multivac.multivac_bp import multivac_bp


def create_app():
    app = Flask(__name__)
    app.register_blueprint(multivac_bp)
    return app
