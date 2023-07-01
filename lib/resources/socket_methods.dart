import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../provider/room_data_provider.dart';
import '../utils/utils.dart';
import './socket_client.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance.socket!;

  void createRoom(String userName) {
    _socketClient.emit('createRoom', {
      'userName': userName,
    });
  }

  void createRoomSuccessListener(BuildContext context) {
    _socketClient.on('createRoomSuccess', (room) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(room);
      GoRouter.of(context).go('/waiting_room');
    });
  }

  void joinRoom(String userName, String roomId) {
    if (userName.isNotEmpty && roomId.isNotEmpty) {
      _socketClient.emit('joinRoom', {'userName': userName, 'roomId': roomId});
    }
  }

  void joinRoomSuccessListener(BuildContext context) {
    _socketClient.on('joinRoomSuccess', (room) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(room);
      GoRouter.of(context).go('/waiting_room');
    });
  }

  void errorOccurListener(BuildContext context) {
    _socketClient.on('errorOccurred', (error) {
      showSnackBar(context, error);
    });
  }

  void updatePlayersState(BuildContext context) {
    _socketClient.on('updatePlayers', (playerData) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updatePlayer1(playerData[0]);
      Provider.of<RoomDataProvider>(context, listen: false)
          .updatePlayer1(playerData[1]);
    });
  }
}
