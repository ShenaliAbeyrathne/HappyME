const CommentService = require('../services/commentServices');

// Create a new comment
exports.createComment = async (req, res) => {
  try {
    const { postId, content } = req.body;
    await CommentService.createComment(postId, content);
    res.status(201).json({ message: 'Comment created successfully' });
  } catch (error) {
    res.status(500).json({ message: 'Error creating comment', error: error.message });
  }
};

// Get all comments for a post
exports.getAllCommentsForPost = async (req, res) => {
  try {
    const { postId } = req.params;
    const comments = await CommentService.getAllCommentsForPost(postId);
    res.status(200).json(comments);
  } catch (error) {
    res.status(500).json({ message: 'Error getting comments', error: error.message });
  }
};
