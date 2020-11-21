from flask_restful import Resource
from flask import Flask, request, Blueprint, jsonify
from flask_mail import Mail, Message
from werkzeug.security import generate_password_hash
from models import db, User
import random
import string

passwordBp = Blueprint('passwordBp', __name__)

class Password(Resource):
    
    @passwordBp.route("/sendEmail", methods=["PUT"])
    def sendEmail():  
        result = ""
        json_data = request.get_json(force=True)
        if not json_data:
            return {'message': 'No input data provided'}, 400

        user = User.query.filter_by(email=json_data['email']).first()
        if not user:
            return {'message': 'email does not exist'}, 400
        email = user.email
        user.verification = ''.join(random.choice(string.digits) for _ in range(6))
        db.session.commit()
        email_msg = "Hello,\nWe've received a request to reset your password. If you want to reset your password, please enter the verification code below in the SportsCred app\n" + str(code) + "\n"
        msg = Message('Confirm Password Change', sender = 'dummy@gmail.com', recipients = [json_data['email']])
        msg.body = email_msg
        with app.app_context():
            mail.send(msg)
        
        return {'message': 'email sent'}, 200

    @passwordBp.route("/getEmail", methods=["PUT"])
    def getEmail(): 
        json_data = request.get_json(force=True)
        if not json_data:
            return {'message': 'No input data provided'}, 400       
        user = User.query.filter_by(email=self.email).first()
        if (user.verification == json_data['check']):
            return {'message': 'verification complete'}, 200
        return {'message': 'code does not match'}, 400
        
    @passwordBp.route("/updatePassword", methods=["PUT"])
    def updatePassword(): 
        json_data = request.get_json(force=True)
        if not json_data:
            return {'message': 'No input data provided'}, 400    
        user = User.query.filter_by(email=json_data['email']).first()
        user.password = generate_password_hash(json_data['password'])
        user.verification = None
        db.session.commit()
        return {'message': 'password changed'}, 200