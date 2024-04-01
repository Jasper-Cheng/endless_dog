import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../endless_world.dart';

class Bone extends SpriteAnimationComponent with HasGameReference, HasWorldReference<EndlessWorld>{

  @override
  Future<void> onLoad() async {

    size=Vector2(30, 30);
    // position=Vector2(game.size.x, -game.size.y*0.45);
    animation=SpriteAnimation.spriteList(
      [await game.loadSprite('bone0.png'),await game.loadSprite('bone1.png'),await game.loadSprite('bone0.png'),await game.loadSprite('bone2.png')],
      stepTime: 0.40,
    );
    // add(SpriteComponent(sprite: await Sprite.load('hello_world.jpg'),position: Vector2(4, 4),size: Vector2(24,24)));
    add(RectangleHitbox(position: Vector2(4, 4),size: Vector2(24,24),collisionType: CollisionType.passive));
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= world.baseSpeedFactory*200 * dt;

    if(position.x<=-size.x){
      removeFromParent();
      // game.world.add(Bone());
    }
  }

}