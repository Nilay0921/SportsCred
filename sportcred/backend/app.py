from flask import Blueprint
from flask_restful import Api
from resources.register import Register
from resources.login import Login

api_bp = Blueprint('api', __name__)
api = Api(api_bp)

#Routes

api.add_resource(Register, '/register')

api.add_resource(Login, '/login')
