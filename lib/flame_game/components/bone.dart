import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../endless_world.dart';

class Bone extends SpriteAnimationComponent with HasGameReference, HasWorldReference<EndlessWorld>{

  @override
  Future<void> onLoad() async {

    size=Vector2(36, 36);
    // position=Vector2(game.size.x, -game.size.y*0.45);
    animation=SpriteAnimation.spriteList(
      [await game.loadSprite('bone0.png'),await game.loadSprite('bone1.png'),await game.loadSprite('bone0.png'),await game.loadSprite('bone2.png')],
      stepTime: 0.40,
    );
    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= 200 * dt;

    if(position.x<=-size.x){
      removeFromParent();
      // game.world.add(Bone());
    }
  }

}