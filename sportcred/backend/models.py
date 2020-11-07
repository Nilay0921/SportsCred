from flask import Flask
from marshmallow import Schema, fields, pre_load, validate
from flask_marshmallow import Marshmallow
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy_utils import EmailType, force_auto_coercion, ScalarListType

ma = Marshmallow()
db = SQLAlchemy()

class User(db.Model):
    __tablename__ = 'users'

    id = db.Column(db.Integer(), primary_key = True)
    username = db.Column(db.String(20), unique = True, nullable = False)
    email = db.Column(EmailType(), unique=True, nullable = False)
    password = db.Column(db.String)
    verification = db.Column(db.String(6), default = None, unique = False, nullable = True)
    api_key = db.Column(db.String(), nullable = False)

    def __init__(self, username, email, password, api_key):
        self.username = username
        self.email = email
        self.password = password
        self.api_key = api_key
    
    def __repr__(self):
        return '<id {}>'.format(self, id)

    def serialize(self):
        return {
            'id': self.id,
            'username': self.username,
            'email': self.email,
            'password': self.password,
            'verification': self.verification,
            'api_key': self.api_key
        }

class Profile(db.Model):
    __tablename__ = 'profiles'

    id = db.Column(db.Integer(), primary_key = True)
    user_id = db.Column(db.Integer(), db.ForeignKey('users.id'), unique = True, nullable = False)
    bio = db.Column(db.String(200), default = None, unique = False, nullable = True)
    level = db.Column(db.String(), default = 'fanalyst', unique = False, nullable = False)
    profile_pic = db.Column(db.LargeBinary(), default = None, unique = False, nullable = True)

    def __init__(self, user_id):
        self.user_id = user_id
    
    def __repr__(self):
        return '<id {}>'.format(self, id)

    def serialize(self):
        return {
            'id': self.id,
            'user_id': self.user_id,
            'bio': self.bio,
            'level': self.level,
            'profile_pic': self.profile_pic
        }

class MCQ_Question(db.Model):
    __tablename__ = 'mcq_questions'

    id = db.Column(db.Integer(), primary_key = True)
    question = db.Column(db.String(), unique = True, nullable = False)
    options = db.Column(ScalarListType(), unique = False, nullable = False)
    answer = db.Column(db.String(), unique = False, nullable = False)

    def __init__(self, question, options, answer):
        self.question = question
        self.options = options
        self.answer = answer

    def __repr__(self):
        return '<id {}>'.format(self, id)
    
    def serialize(self):
        return {
            'id': self.id,
            'question': self.question.question,
            'options': self.options,
            'answer': self.answer
        }

class ACS(db.Model):
    INIT_SCORE = 200
    __tablename__ = 'acss'
    id = db.Column(db.Integer(), primary_key = True)
    user_id = db.Column(db.Integer(), db.ForeignKey('users.id'), unique = True, nullable = False)
    score = db.Column(db.Integer(), default = INIT_SCORE, unique = False, nullable = False)
    trivia_history = db.Column(ScalarListType(), default = [INIT_SCORE] , unique = False, nullable = False)
    daily_history = db.Column(ScalarListType(), default = [INIT_SCORE], unique = False, nullable = False)
    debate_history = db.Column(ScalarListType(), default = [INIT_SCORE], unique = False, nullable = False)

    def __init__(self, user_id):
        self.user_id = user_id

    def __repr__(self):
        return '<id {}>'.format(self, id)
    
    def serialize(self):
        return {
            'id': self.id,
            'user_id': self.user_id,
            'score': self.score,
            'trivia_history': self.question.trivia_history,
            'daily_history': self.daily_history,
            'debate_history': self.debate_history
        }

class Analytic(db.Model):
    __tablename__ = 'analytics'
    id = db.Column(db.Integer(), primary_key = True)
    user_id = db.Column(db.Integer(), db.ForeignKey('users.id'), unique = True, nullable = True)
    answers = db.Column(ScalarListType(), nullable = False)
    
    def __init__(self, user_id, answers):
        self.user_id = user_id
        self.answers = answers
    
    def __repr__(self):
        return '<id {}>'.format(self, id)
    
    def serialize(self):
        return {
            'id': self.id,
            'user_id': self.user_id,
            'answers': self.answers
        }