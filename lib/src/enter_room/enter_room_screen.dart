// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../resources/socket_methods.dart';
import '../audio/audio_controller.dart';
import '../audio/sounds.dart';
import '../style/palette.dart';

class EnterRoomScreen extends StatefulWidget {
  const EnterRoomScreen({super.key});

  @override
  _EnterRoomScreenState createState() => _EnterRoomScreenState();
}

class _EnterRoomScreenState extends State<EnterRoomScreen> {
  String roomName = '';
  String userName = '';

  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.joinRoomSuccessListener(context);
    _socketMethods.errorOccurListener(context);
    _socketMethods.updatePlayersState(context);
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    final audioController = context.watch<AudioController>();

    return Scaffold(
        backgroundColor: palette.backgroundMain,
        body: Container(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 30),
              Container(
                alignment: Alignment.center,
                height: 120,
                child: const Text(
                  '部屋に入室',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Permanent Marker',
                    fontSize: 30,
                    height: 1,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '部屋のid',
                      ),
                      onChanged: (text) {
                        setState(() {
                          roomName = text;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 300,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'ニックネーム',
                      ),
                      onChanged: (text) {
                        setState(() {
                          userName = text;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      audioController.playSfx(SfxType.buttonTap);
                      _socketMethods.joinRoom(userName, roomName);
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(300, 50),
                    ),
                    child: const Text('入室'),
                  ),
                  SizedBox(width: 70),
                ],
              ),
            ],
          ),
        ));
  }
}
