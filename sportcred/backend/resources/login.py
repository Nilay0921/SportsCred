from flask_restful import Resource
from flask import request, Blueprint, jsonify
from werkzeug.security import generate_password_hash, check_password_hash
from models import db, User
import random
import string

loginBp = Blueprint('loginBp', __name__)

class Login(Resource):
    
    @loginBp.route("/login", methods=["GET"])
    def login():

        header = request.headers["Authorization"]

        if header:
            print("header print")
            user = User.query.filter_by(username=header).first()
            if user:
                result = User.serialize(user)
        else:
            json_data = request.get_json(force=True)
            if not json_data:
                return jsonify({'message': 'No input data provided'}), 400
            user = User.query.filter_by(username=json_data['username']).first()
            if not user:
                return jsonify({'message': 'Username does not exist'}), 400
            
            if not check_password_hash(user.password, json_data['password']):
                return jsonify({'message': 'Password incorrect'}), 400
            result = User.serialize(user)
            
        return jsonify({"status": 'success', 'data': result}), 200