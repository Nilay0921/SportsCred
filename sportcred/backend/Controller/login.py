from app import *
from flask_restful import Resource
from flask import request


class Login(Resource):
    def post(self):
        result = ""
        json_data = request.get_json(force=True)
        result = self.username_and_password_login(json_data)
        return {"status": 'success', 'data': result}, 201
    
    def username_and_password_login(self, json_data):
        if not json_data:
            return {'message': 'No input data provided'}, 400

        user = get_user(json_data['username'])
        if not user:
            return {'message': 'Username does not exist'}, 400

        if not check_password_hash(user.password, json_data['password']):
            return {'message': 'Password incorrect'}, 400

        return user