import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/animation.dart';

import '../endless_runner.dart';


enum DogState {
  running,
  jumping,
  falling,
}
class Dog extends SpriteAnimationGroupComponent<DogState> with CollisionCallbacks,HasGameReference<EndlessRunner>{

  final double _jumpHeight = -120;
  bool isFalling = false;

  @override
  Future<void> onLoad() async {

    size=Vector2.all(100);
    position=Vector2(0, -game.size.y*0.45);
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
  }

  void jump(){
    if(current!=DogState.running)return;
    current=DogState.jumping;
    add(MoveByEffect(Vector2(20,_jumpHeight), EffectController(duration: 0.4, curve: Curves.easeOut,onMax: (){
      isFalling=true;
    })));
  }

  @override
  void update(double dt) {
    super.update(dt);
    if(isFalling){
      isFalling=false;
      current=DogState.falling;
      add(MoveByEffect(Vector2(-20,-_jumpHeight), EffectController(duration: 0.4, curve: Curves.easeIn,onMax: (){
        current=DogState.running;
      })));
    }
  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
  }


}