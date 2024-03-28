import 'package:endless_dog/flame_game/game_screen.dart';
import 'package:endless_dog/router.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter/material.dart';

import 'endless_runner.dart';

/// This dialog is shown when a level is completed.
///
/// It shows what time the level was completed in and if there are more levels
/// it lets the user go to the next level, or otherwise back to the level
/// selection screen.
class GameBackDialog extends StatelessWidget {

  const GameBackDialog({super.key, required this.context, required this.game});
  final BuildContext? context;
  final EndlessRunner? game;


  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: game?.size.x,
          height: game?.size.y,
          color: Colors.black.withOpacity(0.6),
        ),
        Container(
          width: 300,
          height: 200,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'are you want to stop game currently？',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Text(
                      "OK",
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                    onTap: (){
                      GoRouter.of(context).go(RoutePath.home);
                    },
                  ),
                  const SizedBox(width: 16),
                  GestureDetector(
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                    onTap: (){
                      game?.resumeEngine();
                      game?.overlays.remove(GameScreen.backDialogKey);
                    },
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
