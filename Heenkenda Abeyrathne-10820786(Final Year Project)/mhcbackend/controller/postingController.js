const PostingService = require('../services/postingServices');

// Create a new post
exports.createPost = async (req, res) => {
  try {
    const { content } = req.body;
     
    await PostingService.createPost(content); // Call createPost method from PostingService
    res.status(201).json({ message: 'Post created successfully' });
  } catch (error) {
    res.status(500).json({ message: 'Error creating post', error: error.message });
  }
};

// Get all posts
exports.getAllPosts = async (req, res) => {
  try {
    const posts = await PostingService.getAllPosts(); // Call getAllPosts method from PostingService
    res.status(200).json(posts);
  } catch (error) {
    res.status(500).json({ message: 'Error getting posts', error: error.message });
  }
};
