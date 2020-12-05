from flask_restful import Resource
from flask import request, Blueprint, jsonify
from models import db, User, Profile, ACS

profileBp = Blueprint('profileBp', __name__)

class userProfile(Resource):

    @profileBp.route("/getProfile", methods=["GET"])
    def getProfile():
        json_data = request.get_json(force=True)

        user = User.query.filter_by(username=json_data['username']).first()
        if not user:
            return jsonify({"Message" : "User not found"}), 404
        else:
            profile = Profile.query.filter_by(username=json_data['username']).first()
            if not profile:
                return jsonify({"Message" : "Profile not found"}), 404

            acs = ACS.query.filter_by(username=user.username).first()
            level = ''
            if acs.score < 300:
                level = 'fanalyst'
            elif acs.score < 600:
                level = 'analyst'
            elif acs.score < 900:
                level = 'proanalyst'
            else:
                level = 'expertanalyst'

        profile = Profile.serialize(profile)
                
        return jsonify({"status": 'success', 'profile': profile , 'level': level}), 302
                
    @profileBp.route("/updateProfile", methods=["PUT"])
    def updatetProfile():
        header = request.headers["Authorization"]
        json_data = request.get_json(force=True)

        if not header:
            return jsonify({"Messege" : "No api key!"}), 400
        else:
            user = User.query.filter_by(username=header).first()
            if user:
                profile = Profile.query.filter_by(username=user.username).first()
                if profile:
                    profile.bio = json_data['bio']
                    #profile.profile_pic = json_data['profile_pic']
                    db.session.commit()
                    profile = Profile.serialize(profile)
                    return jsonify({ "status": 'success', 'profile': profile }), 200
                
                return jsonify({"Message": "profile not found"}), 404
                
            return jsonify({"Message" : "user not found"}), 404