const UserModel = require('../model/signup');
const jwt = require('jsonwebtoken');

class UserService{
    static async registerUser(email,username,password){
try{
      const createUser = new UserModel({email,username,password});
      return await createUser.save();
}catch(err){
    throw err;
}
}
    static async checkuser(email){
        try{
          return await UserModel.findOne({email}); 
      }catch(error){
          throw error;
      }
    }

    static async generateToken(tokenData,secretKey,jwt_expire){
      return jwt.sign(tokenData,secretKey,{expiresIn:jwt_expire});
    }
    s

}


module.exports = UserService;