import 'package:endless_dog/flame_game/components/bomb.dart';
import 'package:endless_dog/flame_game/components/fire.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/image_composition.dart';

import '../endless_runner.dart';
import 'bone.dart';
import 'package:flutter/material.dart';


enum DogState {
  running,
  jumpDown,
  doubleJumpDown
}
class Dog extends SpriteAnimationGroupComponent<DogState> with CollisionCallbacks,HasGameReference<EndlessRunner>{


  Dog({super.position}) : super();

  double backSpeed=1.8;

  bool invincible=false;

  late MoveAlongPathEffect jumpingAlongPathEffect;
  late Path jumpingAlongPath;

  @override
  Future<void> onLoad() async {
    size=Vector2.all(70);
    priority=1;

    jumpingAlongPathEffect=MoveAlongPathEffect(
        Path()..addPolygon(const [
          Offset(0, 0),
          Offset(30, -100),
          Offset(60, 0),
        ], false), EffectController(duration: 0.8,
        curve: const Cubic(0.3, 0.75, 0.75, 0.3)),
        onComplete: (){
          current=DogState.running;
        });

    Sprite jumpDog=await game.loadSprite('run_dog.png');
    animations={
      DogState.running: SpriteAnimation.spriteList(
        [await game.loadSprite('run_dog.png'),await game.loadSprite('run_dog2.png')],
        stepTime:  0.38,
      ),
      DogState.jumpDown: SpriteAnimation.spriteList(
        [jumpDog],
        stepTime: double.infinity,
      ),
      DogState.doubleJumpDown: SpriteAnimation.spriteList(
        [jumpDog],
        stepTime: double.infinity,
      ),
    };
    current=DogState.running;
    // add(SpriteComponent(sprite: await Sprite.load('hello_world.jpg'),size: Vector2(60,80),position: Vector2(20,10)));
    // add(CircleComponent(radius: 20,position: Vector2(18,16)));
    add(CircleHitbox(radius: 20,position: Vector2(18,16)));
  }

  void jump(){
    if(current==DogState.doubleJumpDown)return;
    if(current==DogState.running){
      current=DogState.jumpDown;
      jumpingAlongPathEffect.reset();
      add(jumpingAlongPathEffect);
    }else if(current==DogState.jumpDown){
      jumpingAlongPathEffect.pause();
      add(MoveAlongPathEffect(
          Path()..addPolygon([
            const Offset(0, 0),
            const Offset(40, -100),
            Offset(80, -position.y-150),
          ], false), EffectController(duration: 0.8+(-position.y-160)*0.001,
          curve: Curves.linear),
          onComplete: (){
            current=DogState.running;
          }));
      current=DogState.doubleJumpDown;
    }
    // print("-position.y-160=${-position.y-160}");
    // print("0.8+(-position.y-160)*0.005=${0.8+(-position.y-160)*0.005}");
  }

  @override
  void update(double dt) {
    super.update(dt);
    if(position.x+size.x>=game.size.x){
      position.x=game.size.x-size.x;
    }
    if(current==DogState.running){
      if(position.x>=backSpeed*game.world.baseSpeedFactory){
        position.x=position.x-backSpeed*game.world.baseSpeedFactory;
      }else{
        position.x=0;
      }
    }
  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if(other is Bone){
      add(ColorEffect(Colors.green, EffectController(duration: 0.3,alternate: true,repeatCount: 1)));
      other.removeFromParent();
      game.world.addLife();
      return;
    }
    // print("Bone has collision $other  invincible $invincible");
    if(invincible)return;
    invincible=true;
    if(other is Bomb){
      add(ColorEffect(Colors.red, EffectController(duration: 0.3,alternate: true,repeatCount: 1),
          onComplete: (){
            invincible=false;
          }));
      // other.removeFromParent();
      game.world.removeLife();
    }else if(other is Fire){
      add(ColorEffect(const Color(0xFF9E3608), EffectController(duration: 0.3,alternate: true,repeatCount: 1),
          onComplete: (){
            invincible=false;
          }));
      // other.parent?.removeFromParent();
      game.world.removeLife();
    }

  }


}