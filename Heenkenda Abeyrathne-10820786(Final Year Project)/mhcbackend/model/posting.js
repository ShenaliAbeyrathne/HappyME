const mongoose = require('mongoose');
const db = require('../config/db');

const postingSchema = new mongoose.Schema({
  content: {
    type: String,
    required: true,
    maxLength: 150,
  },
  createdAt: {
    type: Date,
    default: Date.now,
  },
});

const Posting = db.model('Posting', postingSchema);

module.exports = Posting;
