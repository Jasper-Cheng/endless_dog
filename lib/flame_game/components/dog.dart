import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/image_composition.dart';

import '../endless_runner.dart';
import 'bone.dart';
import 'package:flutter/material.dart';


enum DogState {
  running,
  jumping,
  falling,
}
class Dog extends SpriteAnimationGroupComponent<DogState> with CollisionCallbacks,HasGameReference<EndlessRunner>{

  final double _jumpHeight = -150;
  bool isFalling = false;

  @override
  Future<void> onLoad() async {
    size=Vector2.all(100);
    position=Vector2(0, -180);
    priority=1;

    animations={
      DogState.running: SpriteAnimation.spriteList(
        [await game.loadSprite('run_dog.png'),await game.loadSprite('run_dog2.png')],
        stepTime:  0.38,
      ),
      DogState.jumping: SpriteAnimation.spriteList(
        [await game.loadSprite('jump_dog.png')],
        stepTime: double.infinity,
      ),
      DogState.falling: SpriteAnimation.spriteList(
        [await game.loadSprite('fall_dog.png')],
        stepTime: double.infinity,
      ),
    };
    current=DogState.running;

    add(RectangleHitbox(position: Vector2(size.x/2, 12),size: Vector2(16,20)));
  }

  void jump(){
    if(current!=DogState.running)return;
    current=DogState.jumping;
    add(MoveByEffect(Vector2(66,_jumpHeight), EffectController(duration: 0.5, curve: Curves.easeOut,onMax: (){
      isFalling=true;
    })));
  }

  @override
  void update(double dt) {
    super.update(dt);
    if(isFalling){
      isFalling=false;
      current=DogState.falling;
      add(MoveByEffect(Vector2(-66,-_jumpHeight), EffectController(duration: 0.5, curve: Curves.easeIn,onMax: (){
        current=DogState.running;
      })));
    }
  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if(other is Bone){
      other.removeFromParent();
      game.world.addLife();
    }
    print("Bone has collision $other");
  }


}