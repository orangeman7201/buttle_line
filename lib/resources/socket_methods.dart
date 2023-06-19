import './socket_client.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance.socket!;

  void createRoom(String userName, String roomPassword) {
    _socketClient.emit('create_room', {
      'userName': userName,
      'roomPassword': roomPassword,
    });
  }
}
