const mongoose = require('mongoose');
const db = require('../config/db');

const commentSchema = new mongoose.Schema({
  postId: {
     type: mongoose.Schema.Types.ObjectId,
      ref: 'Post',
     required: true 
    },
  content: {
     type: String,
     required: true 
    },
  createdAt: { 
    type: Date, 
    default: Date.now 
},
});

const Comment = db.model('Comment', commentSchema);

module.exports = Comment;
