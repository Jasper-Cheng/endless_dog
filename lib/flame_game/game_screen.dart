import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'endless_runner.dart';
import 'game_back_dialog.dart';
import 'game_die_dialog.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  static const String dieDialogKey = 'die_dialog';
  static const String backButtonKey = 'back_buttton';
  static const String backDialogKey = 'back_dialog';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameWidget<EndlessRunner>(
        game: EndlessRunner(),
        overlayBuilderMap: {
          backButtonKey: (BuildContext context, EndlessRunner game) {
            return Positioned(
              top: 46,
              right: 20,
              child: GestureDetector(
                child: const Icon(
                  Icons.arrow_back_outlined,
                  size: 30,
                ),
                onTap: (){
                  game.pauseEngine();
                  game.overlays.add(backDialogKey);
                },
              ),
            );
          },
          backDialogKey:(BuildContext context, EndlessRunner game) {
            return GameBackDialog(context: context,game: game);
          },
          dieDialogKey: (BuildContext context, EndlessRunner game) {
            return GameDieDialog(context: context,game: game);
          },
        },
      ),
    );
  }
}
