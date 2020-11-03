from app import *
from flask_restful import Resource
from flask import request
import random
import string

class Register(Resource):

    def post(self):
        json_data = request.get_json(force=True)

        if not json_data:
               return {'message': 'No input data provided'}, 400

        user = User.query.filter_by(username=json_data['username']).first()
        if user:
            return {'message': 'Username not available'}, 400

        user = User.query.filter_by(email=json_data['email']).first()
        if user:
            return {'message': 'Email address already exists'}, 400
        
        user = User(
            username = json_data['username'],
            email = json_data['email'],
            password = json_data['password'],
        )
        db.session.add(user)
        db.session.commit()

        return { "status": 'success', 'data': user }, 201