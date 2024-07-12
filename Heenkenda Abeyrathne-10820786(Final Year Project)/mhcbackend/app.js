const express = require('express');
const body_parser = require ('body-parser');
const userRouter = require('./routers/signupRoutes')
const postingRouter = require('./routers/postingRoutes')
const chatRouter = require('./routers/chatRoutes')
const commentRouter = require('./routers/commentRoutes')

const app = express();

app.use(body_parser.json());

app.use('/',userRouter);
app.use('/',postingRouter);
app.use('/',chatRouter);
app.use('/',commentRouter);


module.exports = app;