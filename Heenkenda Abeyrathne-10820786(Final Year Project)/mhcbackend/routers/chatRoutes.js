const router = require('express').Router();
const chatController = require('../controller/chatController');
const socketIo = require('socket.io');

// Initialize Socket.IO
const server = require('http').createServer();
const io = socketIo(server);
chatController.init(io);
router.post('/send', chatController.sendMessage);
router.get('/all', chatController.getAllMessages);

module.exports = router;
