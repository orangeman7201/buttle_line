import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../provider/room_data_provider.dart';
import './socket_client.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance.socket!;

  void createRoom(String userName, String roomPassword) {
    _socketClient.emit('createRoom', {
      'userName': userName,
      'roomPassword': roomPassword,
    });
  }

  void createRoomSuccessListener(BuildContext context) {
    _socketClient.on('createRoomSuccess', (room) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(room);
      GoRouter.of(context).go('/waiting_room');
    });
  }
}
