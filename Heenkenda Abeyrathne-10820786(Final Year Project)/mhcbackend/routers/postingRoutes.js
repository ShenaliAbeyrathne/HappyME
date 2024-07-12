const router = require('express').Router();
const postingController = require('../controller/postingController');

// Create a new post
router.post('/createPost', postingController.createPost);

// Get all posts
router.get('/getAllPosts', postingController.getAllPosts);

module.exports = router;
