class Player {
  final String userName;
  final String socketID;
  final double score;
  final String playerType;
  Player({
    required this.userName,
    required this.socketID,
    required this.score,
    required this.playerType,
  });

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'socketID': socketID,
      'score': score,
      'playerType': playerType,
    };
  }

  factory Player.fromMap(Map<String, dynamic> map) {
    return Player(
      userName: map['userName'] ?? '',
      socketID: map['socketID'] ?? '',
      score: map['score']?.toDouble() ?? 0.0,
      playerType: map['playerType'] ?? '',
    );
  }

  Player copyWith({
    String? userName,
    String? socketID,
    double? score,
    String? playerType,
  }) {
    return Player(
      userName: userName ?? this.userName,
      socketID: socketID ?? this.socketID,
      score: score ?? this.score,
      playerType: playerType ?? this.playerType,
    );
  }
}
