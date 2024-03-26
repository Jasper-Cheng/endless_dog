import 'dart:async';
import 'dart:math';

import 'package:endless_dog/flame_game/components/dog.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/experimental.dart';

import 'components/bone.dart';

class EndlessWorld extends World with HasGameReference,TapCallbacks{

  late final Dog dog;
  late final Bone chicken;

  late final Random _random;

  @override
  Future<void> onLoad() async{
    _random=Random(10);
    dog=Dog();
    add(dog);

    add(
      SpawnComponent.periodRange(
        factory: (_) => Bone(),
        minPeriod: 1.0,
        maxPeriod: 6.0,
        area: Rectangle.fromLTRB(
          game.size.x,-game.size.y/1.8,game.size.x/1.3,-game.size.y/1.2
        ),
        random: Random(),
      ),
    );
  }

  @override
  void onTapDown(TapDownEvent event) {
    dog.jump();
  }

}
