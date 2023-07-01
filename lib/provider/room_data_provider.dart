import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/player.dart';

class RoomDataProvider extends ChangeNotifier {
  // これがこのクラス内に保存されているデータ本体。
  Map<String, dynamic> _roomData = {};

  Player _player1 = Player(
    userName: '',
    socketID: '',
    score: 0,
    playerType: 'host',
  );

  Player _player2 = Player(
    userName: '',
    socketID: '',
    score: 0,
    playerType: 'guest',
  );

  // これがゲッター
  Map<String, dynamic> get roomData => _roomData;
  Player get player1 => _player1;
  Player get player2 => _player2;

  // これがセッター
  void updateRoomData(Map<String, dynamic> roomData) {
    _roomData = roomData;
    notifyListeners();
  }

  void updatePlayer1(Map<String, dynamic> player1Data) {
    _player1 = Player.fromMap(player1Data);
    notifyListeners();
  }

  void updatePlayer2(Map<String, dynamic> player2Data) {
    _player2 = Player.fromMap(player2Data);
    notifyListeners();
  }
}
