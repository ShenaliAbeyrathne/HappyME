const Userservice = require("../services/signupServices");

exports.register = async (req,res,next)=>{
    try{
      const {email,username,password}= req.body;

      const successRes = await Userservice.registerUser(email,username,password);

      res.json({status :true,success:"User Registered Successfully"});
    }catch(error){
        throw error
    }
}

exports.login = async (req,res,next)=>{
    try{
      const {email,username,password}= req.body;
      console.log("------",password);
      
      const user = await Userservice.checkuser(email);
      console.log("--------user-------",user);

      if(!user){
        throw new Error('User does not exist')
      }
      const isMatch = await user.comparePassword(password);
      if(isMatch === false){
        throw new Error('Invalid Password')

      }


      let tokenData = {_id:user._id,email:user.email,username:user.username}
     
      const token = await Userservice.generateToken(tokenData,"secretKey",'1h')
    
      res.status(200).json({status:true,token:token})
    }catch(error){
        throw error
    }
}