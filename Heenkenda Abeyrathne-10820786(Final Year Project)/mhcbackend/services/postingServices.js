const Posting = require('../model/posting');
const axios = require('axios');

class PostingService {
  static async createPost(content) {
    try {
      const newPost = new Posting({ content });
      
      return await newPost.save();
    } catch (error) {
      throw error;
    }
  }

  static async getAllPosts() {
    try {
      return await Posting.find();
    } catch (error) {
      throw error;
    }
  }

  static async sendPostToBackend(content) {
    try {
      const response = await axios.post('http://your-backend-api-url/api/posting', { content });
      return response.data;
    } catch (error) {
      throw error;
    }
  }
}

module.exports = PostingService;
