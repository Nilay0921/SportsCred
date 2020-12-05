from flask_restful import Resource
from flask import request, Blueprint, jsonify
from models import db, Pick

pickBp = Blueprint('pickBp', __name__)

class UserPicks():
    
    @pickBp.route("/addPick", methods=['POST'])
    def addPick():
        json_data = request.get_json(force=True)
        if not json_data:
               return jsonify({'message': 'No input data provided'}), 400
               
    pick = Pick(
        username = json_data['username'],
        picks = json_data['picks']
    )
    
    db.session.add(pick)
    db.session.commit()