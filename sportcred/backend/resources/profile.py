from flask_restful import Resource
from flask import request
from models import db, User, Profile

class Profile(Resource):
    def get(self):
        header = request.headers["Authorization"]
        json_data = request.get_json(force=True)

        if not header:
            return {"Messege" : "No api key!"}, 400
        else:
            user = User.query.filter_by(api_key=header).first()
            if user:
                profile = Profile.query.filter_by(user_id=user.id).first()
                if profile:
                    return {"status": 'success', 'profile': profile}, 302
                
                return {"Message" : "profile not found"}, 404
            return {"Message" : "user not found"}, 404
        
    def put(self):
        header = request.headers["Authorization"]
        json_data = request.get_json(force=True)

        if not header:
            return {"Messege" : "No api key!"}, 400
        else:
            user = User.query.filter_by(api_key=header).first()
            if user:
                profile = Profile.query.filter_by(user_id=user.id).first()
                if profile:
                    profile.bio = json.data['bio']
                    profile.profile_pic = json.data['profile_pic']
                    db.session.commit()
                    return { "status": 'success', 'profile': profile }, 200
                
                return {"Message": "profile not found"}, 404
                
            return {"Message" : "user not found"}, 404