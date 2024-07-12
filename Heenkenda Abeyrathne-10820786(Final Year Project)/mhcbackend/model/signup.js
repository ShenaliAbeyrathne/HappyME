const mongoose = require ('mongoose');
const db = require('../config/db');
const bcrypt = require ("bcrypt");

const{Schema} = mongoose;

const UserSchema = new Schema({
    email: {
        type: String,
        required: true,
        unique: true,
        unique : true,
        lowercase : true,
      },
      username: {
        type: String,
        required: true,
      },
      password: {
        type: String,
        required: true,
      },
      date: {
        type: Date,
        default: Date.now,
      },

});

UserSchema.pre('save',async function(){
    try{
        var user = this;
        const salt = await(bcrypt.genSalt(10));
        const hashpass = await bcrypt.hash(user.password,salt);
        user.password = hashpass;
    }catch(error){
        throw error;
    }
});
 
UserSchema.methods.comparePassword = async function(userPassword){
    try{
       const isMatch = await bcrypt.compare(userPassword,this.password);
       return isMatch; 
    }catch(error){
        throw error;
    }
}

const UserModel = db.model('user',UserSchema);
module.exports = UserModel;