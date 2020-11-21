from flask_restful import Resource
from flask import request, Flask, Blueprint, jsonify
from werkzeug.security import generate_password_hash
from models import db, User, Profile, ACS
#from __main__ import app
import random
import string

registerBp = Blueprint('registerBp', __name__)

class Register(Resource):
    
    #delete this after testing is finished
    @registerBp.route("/getUser", methods=["GET"])
    def getUser():
        users = User.query.all()
        user_list = []
        for i in range(0, len(users)):
            user_list.append(users[i].serialize())
        return jsonify({ "status" : str(user_list)}), 200

    @registerBp.route('/addUser', methods=["POST"])    
    def addUser():
        json_data = request.get_json(force=True)
        if not json_data:
               return jsonify({'message': 'No input data provided'}), 400

        user = User.query.filter_by(email=json_data['email'].lower()).first()
        if user:
            return jsonify({'message': 'Email address already exists'}), 400
        
        """response = requests.get("https://isitarealemail.com/api/email/validate", params = {'email': email})
        status = response.json()['status']
        if status != "valid":
            return jsonify({'message': 'Email address does not exist/cannot be found'}), 400"""

        user = User.query.filter_by(username=json_data['username']).first()
        if user:
            return jsonify({'message': 'Username not available'}), 400

        user = User(
            username = json_data['username'],
            email = json_data['email'],
            password = generate_password_hash(json_data['password'])
        )
        db.session.add(user)
        db.session.commit()

        result = User.serialize(user)
        
        profile = Profile(
            username = result['username']
        )
        db.session.add(profile)
        db.session.commit()
        
        acs = ACS(
            username = result['username']
        )
        db.session.add(acs)
        db.session.commit()

        return jsonify({ "status": 'success', 'data': result }), 201