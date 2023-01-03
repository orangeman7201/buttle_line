import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../audio/audio_controller.dart';
import '../audio/sounds.dart';
// import '../player_progress/player_progress.dart';
import '../style/palette.dart';

class CreateRoomScreen extends StatelessWidget {
  const CreateRoomScreen();

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
                height: 220,
                child: Transform.rotate(
                  angle: -0.1,
                  child: const Text(
                    'Buttle line',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Permanent Marker',
                      fontSize: 55,
                      height: 1,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      audioController.playSfx(SfxType.buttonTap);
                      GoRouter.of(context).push('/create_room');
                    },
                    child: const Text('作成'),
                  ),
                  SizedBox(width: 70),
                  ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    child: const Text('Back'),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
