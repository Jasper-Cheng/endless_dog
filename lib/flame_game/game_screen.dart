import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'endless_runner.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameWidget<EndlessRunner>(
        game: EndlessRunner(),
      ),
    );
  }
}
