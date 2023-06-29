const mongoose = require('mongoose');

const playerSchema = new mongoose.Schema({
  userName: {
    type: String,
    required: true,
    trim: true,
  },
  socketID: {
    type: String,
  },
  points: {
    type: Number,
    default: 0,
  },
  playerType: {
    type: String,
    enum: ['host', 'guest'],
    default: 'guest',
    required: true,
  },
});

module.exports = playerSchema;