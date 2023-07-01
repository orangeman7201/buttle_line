// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:game_template/provider/room_data_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../audio/audio_controller.dart';
import '../audio/sounds.dart';
import '../style/palette.dart';

class WaitingRoomScreen extends StatefulWidget {
  const WaitingRoomScreen({super.key});

  @override
  _WaitingRoomScreen createState() => _WaitingRoomScreen();
}

class _WaitingRoomScreen extends State<WaitingRoomScreen> {
  bool isReady = false;

  @override
  Widget build(BuildContext context) {
    final roomInfo = Provider.of<RoomDataProvider>(context).roomData.toString();
    final palette = context.watch<Palette>();
    final audioController = context.watch<AudioController>();

    return Scaffold(
        backgroundColor: palette.backgroundMain,
        body: Stack(children: <Widget>[
          Positioned(
            top: 10.0,
            right: 10.0,
            width: 80.0,
            height: 50.0,
            child: ElevatedButton(
              onPressed: isReady
                  ? null
                  : () {
                      audioController.playSfx(SfxType.buttonTap);
                      GoRouter.of(context).go('/create_room');
                    },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(300, 50),
              ),
              child: const Text('退出'),
            ),
          ),
          Container(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(height: 40),
                Container(
                    alignment: Alignment.center,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '部屋のID',
                              style: TextStyle(
                                fontSize: 30,
                                height: 1,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              roomInfo,
                              style: TextStyle(
                                fontSize: 30,
                                height: 1,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
                Container(
                  alignment: Alignment.center,
                  height: 120,
                  width: 500,
                  decoration: BoxDecoration(color: Colors.blue),
                  child: const Text(
                    '友達を待っています。',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isReady = !isReady;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(300, 50),
                      ),
                      child: Text(isReady ? 'キャンセル' : '準備完了'),
                    ),
                    SizedBox(width: 40),
                    ElevatedButton(
                      onPressed: isReady
                          ? () {
                              audioController.playSfx(SfxType.buttonTap);
                              GoRouter.of(context).go('/game_field');
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(300, 50),
                      ),
                      child: const Text('試合開始'),
                    ),
                  ],
                ),
              ],
            ),
          )
        ]));
  }
}
