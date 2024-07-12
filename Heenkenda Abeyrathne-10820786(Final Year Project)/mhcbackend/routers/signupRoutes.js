const router = require('express').Router();
const UserController = require("../controller/signupController");

router.post('/registration',UserController.register);
router.post('/login',UserController.login);


module.exports = router;