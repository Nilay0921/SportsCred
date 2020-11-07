from flask_restful import Resource
from flask import request
from werkzeug.security import generate_password_hash
import requests
from models import db, User, Profile, ACS
import random
import string


"""def is_valid_email(email: str):
    response = requests.get("https://isitarealemail.com/api/email/validate", params = {'email': email})
    status = response.json()['status']
    if status == "valid":
        return True
    else:
        return False
"""

class Register(Resource):
    #delete this after testing is finished
    def get(self):
        users = User.query.all()
        user_list = []
        for i in range(0, len(users)):
            user_list.append(users[i].serialize())
        return { "status" : str(user_list)}, 200

    def post(self):
        json_data = request.get_json(force=True)

        if not json_data:
               return {'message': 'No input data provided'}, 400

        user = User.query.filter_by(email=json_data['email'].lower()).first()
        if user:
            return {'message': 'Email address already exists'}, 400
            
        """elif not is_valid_email(json_data['email'].lower()):
            return {'message': 'Email address does not exist/cannot be found'}, 400
        """
        user = User.query.filter_by(username=json_data['username']).first()
        if user:
            return {'message': 'Username not available'}, 400

        api_key = self.generate_key()

        user = User.query.filter_by(api_key=api_key).first()
        if user:
            return {'message': 'API key already exists'}, 400

        user = User(
            api_key = api_key,
            username = json_data['username'],
            email = json_data['email'],
            password = generate_password_hash(json_data['password'])
        )
        db.session.add(user)
        db.session.commit()

        result = User.serialize(user)
        
        profile = Profile(
            user_id = result['id']
        )
        db.session.add(profile)
        db.session.commit()
        
        acs = ACS(
            user_id = result['id']
        )
        db.session.add(acs)
        db.session.commit()

        return { "status": 'success', 'data': result }, 201

    def generate_key(self):
        return ''.join(random.choice(string.ascii_letters + string.digits) for _ in range(50))
        
