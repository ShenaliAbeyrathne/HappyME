const Chat = require('../model/chat');
const axios = require('axios');

class ChatService {
  static async sendMessage(sender, message) {
    try {
      const newMessage = new Chat({ sender, message });
      return await newMessage.save();
    } catch (error) {
      throw error;
    }
  }

  static async getAllMessages() {
    try {
      return await Chat.find().populate('sender', 'username'); // Assuming 'sender' is a reference to the User model
    } catch (error) {
      throw error;
    }
  }

  static async sendChatToBackend(sender, message) {
    try {
      const response = await axios.post('http://your-backend-api-url/api/chat/send', { sender, message });
      return response.data;
    } catch (error) {
      throw error;
    }
  }
}

module.exports = ChatService;
