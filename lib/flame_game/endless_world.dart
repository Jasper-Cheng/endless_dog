import 'dart:async';
import 'dart:math';

import 'package:endless_dog/flame_game/components/bomb.dart';
import 'package:endless_dog/flame_game/components/dog.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/experimental.dart';
import 'package:flutter/material.dart';

import 'components/bat.dart';
import 'components/bone.dart';
import 'components/volFire.dart';
import 'components/volcano.dart';

class EndlessWorld extends World with HasGameReference,TapCallbacks{

  late final Dog dog;
  late final Bone chicken;

  final Random _random=Random(10);
  final lifeNotifier = ValueNotifier(3);

  @override
  Future<void> onLoad() async{
    dog=Dog(position: Vector2(0,-160));
    add(dog);

    add(
      SpawnComponent.periodRange(
        factory: (_) => Bone(),
        minPeriod: 1.0,
        maxPeriod: 6.0,
        area: Rectangle.fromLTRB(
          game.size.x,-game.size.y/1.8,game.size.x,-game.size.y/1.1
        ),
        random: _random,
      ),
    );

    add(
      SpawnComponent.periodRange(
        factory: (_) => Bomb(),
        minPeriod: 1.0,
        maxPeriod: 5.0,
        area: Rectangle.fromLTRB(
            game.size.x,-game.size.y/1.6,game.size.x,-game.size.y/1.1
        ),
        random: _random,
      ),
    );

    // add(Volcano());
    add(
        SpawnComponent(
          factory: (_) => VolFire(),
          period: 6,
          area: Rectangle.fromLTRB(
              game.size.x,-120,game.size.x,-120
          ),
          random: _random,
        )
    );
    // add(
    //   SpawnComponent.periodRange(
    //     factory: (_) => Man(),
    //     minPeriod: 0.1,
    //     maxPeriod: 1,
    //     area: Rectangle.fromLTRB(
    //         game.size.x,-230,game.size.x/1.3,-230
    //     ),
    //     random: _random,
    //   ),
    // );
  }

  void addLife(){
    lifeNotifier.value++;
  }

  void removeLife(){
    lifeNotifier.value--;
  }

  @override
  void onTapDown(TapDownEvent event) {
    dog.jump();
  }

}
