import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../audio/audio_controller.dart';
import '../audio/sounds.dart';
import '../settings/settings.dart';
import '../style/palette.dart';

class GameFieldScreen extends StatelessWidget {
  const GameFieldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    final settingsController = context.watch<SettingsController>();
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
                    'Battle line  Main Field',
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
                      GoRouter.of(context).go('/create_room');
                    },
                    child: const Text('勝ち'),
                  ),
                  SizedBox(width: 70),
                  ElevatedButton(
                    onPressed: () => GoRouter.of(context).push('/enter_room'),
                    child: const Text('負け'),
                  ),
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
        ));
  }

  // static const _gap = SizedBox(height: 10);
}
