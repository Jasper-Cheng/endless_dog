import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';

import '../endless_world.dart';

class Fire extends SpriteComponent with HasGameReference, HasWorldReference<EndlessWorld>{

  Fire({super.position}) : super();

  @override
  Future<void> onLoad() async {

    size=Vector2(12,32);
    // position=Vector2(100, 0);
    sprite=await game.loadSprite('fire.png');

    add(MoveByEffect(Vector2(0,-32), EffectController(duration: 4)));
    // add(SpriteComponent(sprite: await Sprite.load('hello_world.jpg'),size: Vector2(12,36)));
    add(RectangleHitbox(size: Vector2(12,32)));
  }

}