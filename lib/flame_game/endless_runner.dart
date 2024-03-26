import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'components/background.dart';
import 'endless_world.dart';

class EndlessRunner extends FlameGame<EndlessWorld> with HasCollisionDetection{

  EndlessRunner() : super(
    world: EndlessWorld(),
  );

  @override
  Future<void> onLoad() async {
    camera.backdrop.add(Background());
    camera.viewfinder.anchor=Anchor.bottomLeft;


    final textRenderer = TextPaint(
      style: const TextStyle(
        fontSize: 26,
        color: Colors.black,
      ),
    );
    camera.viewport.add(TextComponent(
      text: "0",
      position: Vector2(20, 40),
      textRenderer: textRenderer
    ));
  }

}
