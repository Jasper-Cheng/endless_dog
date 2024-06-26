import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';

import '../endless_world.dart';

class Bomb extends SpriteAnimationComponent with HasGameReference, HasWorldReference<EndlessWorld>{

  @override
  Future<void> onLoad() async {

    size=Vector2(40, 40);
    animation=SpriteAnimation.spriteList(
      [await game.loadSprite('bomb1.png'),await game.loadSprite('bomb2.png'),await game.loadSprite('bomb3.png'),await game.loadSprite('bomb4.png')],
      stepTime: 0.3,
    );
    // add(CircleComponent(
    //   radius: 18,
    //   anchor: Anchor.center,
    //   position: Vector2(20,20)
    // ));
    // add(RotateEffect.by(360, EffectController(duration: 1,infinite: true)));
    add(CircleHitbox(
        radius: 18,
        anchor: Anchor.center,
        position: Vector2(20,20),
        collisionType: CollisionType.passive
    ));
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= world.baseSpeedFactory*150 * dt;

    if(position.x<=-size.x){
      removeFromParent();
      // game.world.add(Bone());
    }
  }

}