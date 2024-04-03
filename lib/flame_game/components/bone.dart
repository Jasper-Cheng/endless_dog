import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../endless_world.dart';

class Bone extends SpriteAnimationComponent with HasGameReference, HasWorldReference<EndlessWorld>{

  @override
  Future<void> onLoad() async {

    size=Vector2(40, 40);
    // position=Vector2(game.size.x, -game.size.y*0.45);
    animation=SpriteAnimation.spriteList(
      [await game.loadSprite('bone0.png'),await game.loadSprite('bone1.png'),await game.loadSprite('bone0.png'),await game.loadSprite('bone2.png')],
      stepTime: 0.40,
    );
    // add(SpriteComponent(sprite: await Sprite.load('hello_world.jpg'),position: Vector2(20, 20),size: Vector2(30,16),anchor: Anchor.center));
    add(RectangleHitbox(position: Vector2(20, 20),size: Vector2(30,16),anchor: Anchor.center,collisionType: CollisionType.passive));
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