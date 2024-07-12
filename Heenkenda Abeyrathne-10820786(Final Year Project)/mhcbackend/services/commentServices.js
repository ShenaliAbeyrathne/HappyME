const Comment = require('../model/comment');
const axios = require('axios');

class CommentService {
  static async createComment(postId, content) {
    try {
      const newComment = new Comment({ postId, content });
      
      return await newComment.save();
    } catch (error) {
      throw error;
    }
  }

  static async getAllCommentsForPost(postId) {
    try {
      return await Comment.find({ postId }).sort({ createdAt: 'desc' });
    } catch (error) {
      throw error;
    }
  }

  static async sendCommentToBackend(postId, content) {
    try {
      const response = await axios.post('http://your-backend-api-url/api/comments', { postId, content });
      return response.data;
    } catch (error) {
      throw error;
    }
  }
}

module.exports = CommentService;
