from flask_restful import Resource
from flask import request, Blueprint, jsonify
from models import db, Post, Comment
from datetime import datetime

commentBp = Blueprint('commentBp', __name__)

class UserComments():
    
    @commentBp.route("/addComment", methods=['POST'])
    def addComment():
        json_data = request.get_json(force=True)
        if not json_data:
               return jsonify({'message': 'No input data provided'}), 400

        comment = Comment(
            post_id = json_data['post_id'],
            username = json_data['username'],
            content = json_data['content']
        )

        db.session.add(comment)
        db.session.commit()

        result = Comment.serialize(Comment)
        return jsonify({ "status" : 'success', 'data': comment}), 201
        
    @commentBp.route("/getComment", methods=['GET'])
    def getComment():
        json_data = request.get_json(force=True)
        comment_list = []
        if not json_data:
            return jsonify({'message': 'No input data provided'}), 400
        
        if json_data['query_by']=='top':
            comments = Comment.query.order_by(Comment.upvotes.desc()).all()
        
        else: #json_data['query_by']=='latest'
            comments = Comment.query.order_by(Comment.timestamp.desc()).all()
        
        if comment_list == []:
            return jsonify({'message': 'No comments found'}), 404
        
        for i in range(0, len(comments)):
            comment_list.append(comments[i].serialize())

        return jsonify({"status" : str(comment_list)}), 200

    @commentBp.route("/deleteComment", methods=['DELETE'])
    def deleteComment():
        json_data = request.get_json(force=True)
        if not json_data:
            return jsonify({'message': 'No input data provided'}), 400
        comment = Comment.query.filter_by(id=json_data['comment_id']).first()
        if not comment:
            return jsonify({'message': 'no such comment found'}), 400
        if json_data['username'] == comment.username:
            db.session.delete(comment)
            db.session.commit()
            return jsonify({ "status" : 'success'}), 200
            
        return jsonify({ "status" : 'not authhorized'}), 401

    @commentBp.route("/upvote'", methods=['PUT'])
    def upvote():
        json_data = request.get_json(force=True)
        if not json_data:
               return jsonify({'message': 'No input data provided'}), 400
        
        commment = Comment.query.filter_by(id=json_data['id']).one()
        
        if json_data['state'] == 'true':
            comment.upvotes += 1
        else:
            comment.upvotes -= 1

        result = comments.upvotes

        db.session.commit()
        
        return jsonify({ "status" : 'success', 'data': result}), 201