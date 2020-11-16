from flask import Flask
from flask_sqlalchemy import SQLAlchemy
import os

def create_app(config_filename):
    app = Flask(__name__)
    app.config.from_object(config_filename)
    
    basedir = os.path.abspath(os.path.dirname(__file__))
    app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///' + os.path.join(basedir, 'db.sqlite')
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False


    from app import api_bp
    app.register_blueprint(api_bp, url_prefix='/api')
    
    from models import db
    db.init_app(app)
    with app.app_context():
        db.create_all()

    return app

if __name__ == "__main__":
    app = create_app("config")
    app.run(debug=True)