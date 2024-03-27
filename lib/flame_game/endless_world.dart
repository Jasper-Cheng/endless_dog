import 'dart:async';
import 'dart:math';

import 'package:endless_dog/flame_game/components/dog.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/experimental.dart';
import 'package:flutter/material.dart';

import 'components/bone.dart';

class EndlessWorld extends World with HasGameReference,TapCallbacks{

  late final Dog dog;
  late final Bone chicken;

  final Random _random=Random(10);
  final lifeNotifier = ValueNotifier(3);

  @override
  Future<void> onLoad() async{
    dog=Dog();
    add(dog);

    add(
      SpawnComponent.periodRange(
        factory: (_) => Bone(),
        minPeriod: 0.2,
        maxPeriod: 1,
        area: Rectangle.fromLTRB(
          game.size.x,-game.size.y/1.8,game.size.x/1.3,-game.size.y/1.2
        ),
        random: _random,
      ),
    );
  }

  void addLife(){
    lifeNotifier.value++;
  }

  @override
  void onTapDown(TapDownEvent event) {
    dog.jump();
  }

}
