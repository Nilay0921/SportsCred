from flask_restful import Resource
from flask import request
from werkzeug.security import check_password_hash
from models import db, User
import random
import string

class Login(Resource):
    
    def get(self):
        result = ""
        json_data = request.get_json(force=True)
        #header = request.headers["Authorization"]

        #if not header:
        #    result = self.username_and_password_login(json_data)
        #else:
            #user = User.query.filter_by(api_key=header).first()
        user = User.query.filter_by(username=json_data['username']).first()
        if user:
            result = User.serialize(user)
        else:
            result = self.username_and_password_login(json_data)

        return {"status": 'success', 'data': result}, 201

    def username_and_password_login(self, json_data):
        if not json_data:
            return {'message': 'No input data provided'}, 400

        user = User.query.filter_by(username=json_data['username']).first()
        if not user:
            return {'message': 'Username does not exist'}, 400

        if not check_password_hash(user.password, json_data['password']):
            return {'message': 'Password incorrect'}, 400

        return User.serialize(user)

    def generate_key(self):
        return ''.join(random.choice(string.ascii_letters + string.digits) for _ in range(50))