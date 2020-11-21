from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_mail import Mail, Message
import os

def create_app(config_filename):
    app = Flask(__name__)
    app.config.from_object(config_filename)
    app.config['MAIL_SERVER']='smtp://127.0.0.1'
    app.config['MAIL_PORT'] = 1025
    app.config['MAIL_USERNAME'] = 'send@sportcred.com'
    app.config['MAIL_PASSWORD'] = ''
    app.config['MAIL_USE_TLS'] = False
    app.config['MAIL_USE_SSL'] = True

    mail = Mail(app)
    
    basedir = os.path.abspath(os.path.dirname(__file__))
    app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///' + os.path.join(basedir, 'db.sqlite')
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

    from resources.register import registerBp
    app.register_blueprint(registerBp)
    
    from resources.userPosts import postBp
    app.register_blueprint(postBp)
    
    from resources.login import loginBp
    app.register_blueprint(loginBp)

    from resources.profile import profileBp
    app.register_blueprint(profileBp)

    from resources.userPosts import postBp
    app.register_blueprint(postBp)

    from resources.userComments import commentBp
    app.register_blueprint(commentBp)

    #create database
    from models import db
    db.init_app(app)
    with app.app_context():
        db.create_all()

    return app

if __name__ == "__main__":
    app = create_app("config")
    app.run(debug=True)