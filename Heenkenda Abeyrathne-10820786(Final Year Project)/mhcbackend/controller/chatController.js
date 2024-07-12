const ChatService = require('../services/chatServices');
const socketIo = require('socket.io');

let io;

function init(ioInstance) {
  io = ioInstance;
  io.on('connection', (socket) => {
    console.log('A user connected');

    socket.on('disconnect', () => {
      console.log('User disconnected');
    });

    socket.on('chat message', async (data) => {
      try {
        const { sender, message } = data;
        const newMessage = new Chat({ sender, message });
        await newMessage.save();
        io.emit('chat message', { sender, message }); // Broadcast message to all clients
      } catch (error) {
        console.error('Error sending message:', error);
      }
    });
  });
}

exports.init = init;

exports.sendMessage = async (req, res) => {
  try {
    const { sender, message } = req.body;
    const newMessage = new ChatService({ sender, message });
    await newMessage.save();
    res.status(201).json({ message: 'Message sent successfully' });
  } catch (error) {
    res.status(500).json({ message: 'Error sending message', error: error.message });
  }
};

exports.getAllMessages = async (req, res) => {
  try {
    const messages = await ChatService.find().populate('sender', 'username'); // Populate sender details from User model
    res.status(200).json(messages);
  } catch (error) {
    res.status(500).json({ message: 'Error getting messages', error: error.message });
  }
};
