import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'components/background.dart';
import 'endless_world.dart';

class EndlessRunner extends FlameGame<EndlessWorld> with HasCollisionDetection{

  EndlessRunner() : super(
    world: EndlessWorld(),
    camera: CameraComponent.withFixedResolution(width: 1600, height: 720),
  );

  @override
  Future<void> onLoad() async {
    camera.backdrop.add(Background());
    camera.viewfinder.anchor=Anchor.bottomLeft;

    final lifeComponent=TextComponent(
        text: world.lifeNotifier.value.toString(),
        position: Vector2(20, 20),
        textRenderer: TextPaint(
          style: const TextStyle(
            fontSize: 46,
            color: Colors.black,
          ),
        )
    );

    world.lifeNotifier.addListener(() {
      lifeComponent.text=world.lifeNotifier.value.toString();
    });

    camera.viewport.add(lifeComponent);
  }

}
