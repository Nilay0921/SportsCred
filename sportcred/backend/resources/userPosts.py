from flask_restful import Resource
from flask import request, Blueprint, jsonify
from models import db, Post, Comment
from datetime import datetime, timedelta

postBp = Blueprint('postBp', __name__)

class UserPosts():
    
    @postBp.route("/addPost", methods=['POST'])
    def addPost():
        json_data = request.get_json(force=True)
        if not json_data:
               return jsonify({'message': 'No input data provided'}), 400

        post = Post(
            username = json_data['username'],
            title = json_data['title'],
            body = json_data['body']
        )

        db.session.add(post)
        db.session.commit()

        result = Post.serialize(post)
        return jsonify({ "status" : 'success', 'data': result }), 201

    @postBp.route("/getPost", methods=['GET'])
    def getPost():
        json_data = request.get_json(force=True)
        post_list = []
        if not json_data:
            return jsonify({'message': 'No input data provided'}), 400
        
        if json_data['query_by']=='trending':
            print("Here at trending")
            since = datetime.now() - timedelta(weeks=1)
            print(since)
            posts = Post.query.filter(Post.timestamp >= since).all()
            
        elif json_data['query_by']=='search':
            print("Here at search")
            posts = Post.query.filter(Post.title.in_(json_data['title']))
        else:
            print("Here at else")
            posts = Post.query.order_by(Post.timestamp).all()
        if post_list == []:
            return jsonify({'message': 'No posts found'}), 404
        
        for i in range(0, len(posts)):
            post_list.append(posts[i].serialize())

        return jsonify({"status" : str(post_list)}), 200
    
    @postBp.route("/updatePost", methods=['PUT'])
    def updatePost():
        json_data = request.get_json(force=True)
        if not json_data:
            return jsonify({'message': 'No input data provided'}), 400
        post = Post.query.filter_by(post_id = json_data['posts_id']).first()
        if not post:
            return jsonify({'message': 'no such post found'}), 400
        if json_data['username'] == post.username:
            post.body = json_data['body']
            db.session.commit()
            return jsonify({ "status" : 'success'}), 200
        return jsonify({ "status" : 'not authhorized'}), 400
            
    @postBp.route("/deletePost", methods=['DELETE'])
    def deletePost():
        json_data = request.get_json(force=True)
        if not json_data:
            return jsonify({'message': 'No input data provided'}), 400
        post = Post.query.filter_by(post_id = json_data['posts_id']).first()
        if not post:
            return jsonify({'message': 'no such post found'}), 400
        if json_data['username'] == post.username:
            comments = Comment.query.filter_by(post_id = json_data['posts_id']).delete()
            db.session.delete(post)
            db.session.commit()
            return jsonify({ "status" : 'success'}), 200
        return jsonify({ "status" : 'not authhorized'}), 401
        
    @postBp.route("/upvote'", methods=['PUT'])
    def upvote():
        json_data = request.get_json(force=True)
        if not json_data:
               return jsonify({'message': 'No input data provided'}), 400
        
        post = Post.query.filter_by(id=json_data['post_id']).one()
        
        if json_data['state'] == 'true':
            post.upvotes += 1
        else:
            post.upvotes -= 1

        result = post.upvotes

        db.session.commit()
        
        return jsonify({ "status" : 'success', 'data': result}), 201