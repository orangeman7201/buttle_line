import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../audio/audio_controller.dart';
import '../audio/sounds.dart';
import '../style/palette.dart';

class CreateRoomScreen extends StatelessWidget {
  const CreateRoomScreen();
  static const _gap = SizedBox(height: 20);

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    final audioController = context.watch<AudioController>();

    return Scaffold(
        backgroundColor: palette.backgroundMain,
        body: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(100, 50, 100, 0),
            child: Column(
              children: [
                TextField(
                  autofocus: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: '部屋の名前',
                  ),
                ),
                _gap,
                TextField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: '部屋に入るためのパスワード',
                  ),
                ),
                _gap,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        audioController.playSfx(SfxType.buttonTap);
                        GoRouter.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey),
                      child: const Text('戻る'),
                    ),
                    SizedBox(width: 70),
                    ElevatedButton(
                      onPressed: () {
                        audioController.playSfx(SfxType.buttonTap);
                        GoRouter.of(context).push('/create_room');
                      },
                      child: const Text('部屋を作る'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
