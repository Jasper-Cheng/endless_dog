import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../endless_world.dart';

class Bat extends SpriteAnimationComponent with HasGameReference, HasWorldReference<EndlessWorld>{

  @override
  Future<void> onLoad() async {

    size=Vector2(80, 80);
    // position=Vector2(game.size.x, -game.size.y*0.45);
    animation=SpriteAnimation.spriteList(
      [await game.loadSprite('bat2.png'),await game.loadSprite('bat1.png'),await game.loadSprite('bat2.png'),await game.loadSprite('bat3.png')],
      stepTime: 0.40,
    );
    // add(SpriteComponent(sprite: await Sprite.load('hello_world.jpg'),position: Vector2(23, 15),size: Vector2(35,45)));
    add(RectangleHitbox(position: Vector2(23, 15),size: Vector2(35,45)));
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= 160 * dt;

    if(position.x<=-size.x){
      removeFromParent();
      // game.world.add(Bone());
    }
  }

}