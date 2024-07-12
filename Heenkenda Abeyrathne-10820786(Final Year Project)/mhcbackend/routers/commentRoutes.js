const router = require('express').Router();
const commentController = require('../controller/commentController');

// Create a new comment
router.post('/createComment', commentController.createComment);

// Get all comments for a post
router.get('/getAllCommentsForPost', commentController.getAllCommentsForPost);

module.exports = router;
