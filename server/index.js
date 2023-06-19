require('dotenv').config();
const express = require('express');
const http = require('http');
const { default: mongoose } = require('mongoose');

const app = express();
const port = process.env.PORT || 3000;
let server = http.createServer(app);

let io = require('socket.io')(server);

app.use(express.json());

const DB = process.env.DB_URI;

io.on('connection', (socket) => {
  console.log('a user connected');
  socket.on('create_room', async ({ userName }) => {
    console.log(userName);

    // 部屋を作成

    // プレイヤー情報を保存
  })
});

mongoose
.connect(DB)
.then(() => {
  console.log('MongoDB connected');
})
.catch((err) => console.log(err));

server.listen(port, '0.0.0.0', () => {
  console.log(`Server is running on port ${port}`);
})