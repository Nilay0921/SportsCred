from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from flask_marshmallow import Marshmallow
import os

from werkzeug.security import generate_password_hash, check_password_hash

# Init app
app = Flask(__name__)
basedir = os.path.abspath(os.path.dirname(__file__))

# Database
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///' + os.path.join(basedir, 'db.sqlite')
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

# Init db
db = SQLAlchemy(app)

# Init ma
ma = Marshmallow(app)

# CLASSES

# User Class
class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(20), unique=True)
    email = db.Column(db.String, unique=True)
    password = db.Column(db.String)
    
    def __init__(self, username, email, password):
        self.username = username
        self.email = email
        self.password = password

# Profile Class
class Profile(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.String(100), unique=True)
    status = db.Column(db.String(100))
    #profile_pic = db.Column(db.LargeBinary)
    
    def __init__(self, user_id, status):#, profile_pic):
        self.user_id = user_id
        self.status = status
        #self.profile_pic = profile_pic
        
# SCHEMAS

# User schema
class UserSchema(ma.Schema):
    class Meta:
        fields = ('id', 'username', 'email', 'password')

# Profile schema
class ProfileSchema(ma.Schema):
    class Meta:
        fields = ('id','user_id', 'status')#, 'profile_pic')

# Init schema

# Init user schema
user_schema = UserSchema()
users_schema = UserSchema(many=True)

# Init profile schema
profile_schema = ProfileSchema()
profiles_schema = ProfileSchema(many=True)

# CRUD operations

# CRUD User

# Create a user
@app.route('/user', methods=['POST'])
def add_user():
    username = request.json['username']
    email = request.json['email']
    password = request.json['password']
    new_user = User(username, email, generate_password_hash(password))
    
    db.session.add(new_user)
    db.session.commit()
    
    return user_schema.jsonify(new_user)

# Get All Users
@app.route('/user', methods=['GET'])
def get_users():
    all_users = User.query.all()
    result = users_schema.dump(all_users)
    return jsonify(result)

# Get Single User
@app.route('/user/<name>', methods=['GET'])
def get_user(name):
    user = User.query.filter_by(username=name).first()
    return user_schema.jsonify(user)

# Update a user
@app.route('/user/<name>', methods=['PUT'])
def update_user(name):
    
    user = User.query.filter_by(username=name).first()

    email = request.json['email']
    password = request.json['password']
    
    user.email = email
    user.password = password
    
    db.session.commit()
    
    return user_schema.jsonify(user)

# delete User
@app.route('/user/<name>', methods=['DELETE'])
def delete_user(name):
    user = User.query.filter_by(username=name).first()
    db.session.delete(user)
    db.session.commit()
    
    return user_schema.jsonify(user)

# CRUD Profile

# Create Profile
@app.route('/profile', methods=['POST'])
def add_profile():
    user_id = request.json['user_id']
    status = request.json['status']
    #profile_pic = request.json['profile_pic']
    new_profile = Profile(user_id, status)#, profile_pic)
    
    db.session.add(new_profile)
    db.session.commit()
    
    return profile_schema.jsonify(new_profile)

#Get All Profiles
@app.route('/profile', methods=['GET'])
def get_profiles():
    all_profiles = Profile.query.all()
    result = profiles_schema.dump(all_profiles)
    return jsonify(result)

# Get Single Profile
@app.route('/profile/<userid>', methods=['GET'])
def get_profile(userid):
    profile = Profile.query.filter_by(user_id=userid).first()
    return profile_schema.jsonify(profile)

# Update profile
@app.route('/profile/<userid>', methods=['PUT'])
def update_profile(userid):
    
    profile = Profile.query.filter_by(user_id=userid).first()

    status = request.json['status']
    #profile_pic = request.json['profile_pic']
    
    profile.status = status
    #profile.profile_pic = profile_pic
    
    db.session.commit()
    
    return profile_schema.jsonify(profile)

# Run server
if __name__ == '__main__':
    app.run(debug=True)