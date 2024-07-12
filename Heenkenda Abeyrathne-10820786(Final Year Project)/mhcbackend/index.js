const app = require('./app');
const db = require('./config/db');
const UserModel = require('./model/signup');

const port = 3000;

app.get('/',(req,res)=>{
    res.send("Hello World")
})

app.listen(port, () => {
    console.log(`Server listening on port http://localhost:${port}`);
});