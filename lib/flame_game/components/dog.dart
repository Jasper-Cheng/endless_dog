import 'dart:ui';

import 'package:endless_dog/flame_game/components/bat.dart';
import 'package:endless_dog/flame_game/components/fire.dart';
import 'package:endless_dog/flame_game/components/volFire.dart';
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


  Dog({super.position}) : super();

  final double _jumpHeight = -150;
  bool isFalling = false;

  @override
  Future<void> onLoad() async {
    size=Vector2.all(100);
    // position=Vector2(0, -180);
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
    // add(SpriteComponent(sprite: await Sprite.load('hello_world.jpg'),size: Vector2(60,80),position: Vector2(20,10)));
    // add(CircleComponent(radius: 36,position: Vector2(20,16)));
    add(CircleHitbox(radius: 36,position: Vector2(20,16)));
  }

  void jump(){
    if(current!=DogState.running)return;
    current=DogState.jumping;
    add(MoveByEffect(Vector2(66,_jumpHeight), EffectController(duration: 0.6, curve: Curves.easeOut,onMax: (){
      isFalling=true;
    })));
  }

  @override
  void update(double dt) {
    super.update(dt);
    if(isFalling){
      isFalling=false;
      current=DogState.falling;
      add(MoveByEffect(Vector2(-66,-_jumpHeight), EffectController(duration: 0.8, curve: Curves.easeIn,onMax: (){
        current=DogState.running;
      })));
    }
  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if(other is Bone){
      add(ColorEffect(Colors.green, EffectController(duration: 0.2,alternate: true,repeatCount: 1)));
      other.removeFromParent();
      game.world.addLife();
    }else if(other is Bat){
      add(ColorEffect(Colors.red, EffectController(duration: 0.2,alternate: true,repeatCount: 1)));
      // other.removeFromParent();
      game.world.removeLife();
    }else if(other is Fire){
      add(ColorEffect(const Color(0xFF9E3608), EffectController(duration: 0.2,alternate: true,repeatCount: 1)));
      // other.parent?.removeFromParent();
      game.world.removeLife();
    }
    print("Bone has collision $other");
  }


}