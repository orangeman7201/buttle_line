import 'package:flutter/cupertino.dart';

import './socket_client.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance.socket!;

  void createRoom(String userName, String roomPassword) {
    _socketClient.emit('create_room', {
      'userName': userName,
      'roomPassword': roomPassword,
    });
  }

  void createRoomSuccessListener(BuildContext context) {
    _socketClient.on('create_room_success', (data) {
      Navigator.of(context)
          .pushNamed('/room', arguments: {'roomId': data['roomId']});
      // context.go('/room', parameters: {'roomId': data['roomId']});
    });
  }
}
