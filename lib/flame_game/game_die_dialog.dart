import 'package:endless_dog/router.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter/material.dart';

import 'endless_runner.dart';
import 'game_screen.dart';


class GameDieDialog extends StatelessWidget {
  const GameDieDialog({super.key, required this.context, required this.game});
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
                'you are die!',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              GestureDetector(
                child: const Icon(
                  Icons.arrow_back_outlined,
                  size: 30,
                ),
                onTap: (){
                  GoRouter.of(context).go(RoutePath.home);
                },
              ),
              const SizedBox(height: 30),
              GestureDetector(
                child: Text(
                  "Replay",
                  style: TextStyle(
                      fontSize: 20
                  ),
                ),
                onTap: (){
                  game?.overlays.remove(GameScreen.dieDialogKey);
                  GoRouter.of(context).pushReplacement(RoutePath.game_screen);
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
