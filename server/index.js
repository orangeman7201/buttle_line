require('dotenv').config();
const express = require('express');
const http = require('http');
const { default: mongoose } = require('mongoose');

const app = express();
const port = process.env.PORT || 3000;
let server = http.createServer(app);
const Room = require('./models/room');

let io = require('socket.io')(server);

app.use(express.json());

const DB = process.env.DB_URI;

io.on('connection', (socket) => {
  console.log('a user connected');
  socket.on('createRoom', async ({ userName }) => {
    // 部屋を作成{}
    // 予想: 部屋を作る＝websocketで特定のサーバーをlistenしている状態
    try {
      let player = {
        userName,
        socketID: socket.id,
        playerType: 'host',
      };
      let room = new Room({
        currentRound: 1,
        players: [player],
      });
      room = await room.save();
      const roomId = room._id.toString();
      socket.join(roomId);

      // io→全員にデータを拡散してくれるスピーカー的な存在　
      // socket→自分にデータを送ってくれるやつ。
      io.to(roomId).emit('createRoomSuccess', room)
    } catch (err) {
      console.log(err);
    }

    // プレイヤー情報を保存
    // 予想： listenしているサーバー情報をmongoDBに保存すること
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