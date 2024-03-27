import 'package:endless_dog/flame_game/components/fire.dart';
import 'package:endless_dog/flame_game/components/volcano.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../endless_world.dart';

class VolFire extends PositionComponent with HasGameReference, HasWorldReference<EndlessWorld>{

  @override
  Future<void> onLoad() async {
    size=Vector2(100, 0);
    add(Fire(position: Vector2(25,0)));
    add(Volcano(position: Vector2(0,0)));
    // add(SpriteComponent(sprite: await Sprite.load('jump_dog.png'),position: Vector2(0, 12),size: Vector2(24,20)));
    // add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= 100 * dt;

    if(position.x<=-size.x){
      removeFromParent();
      // game.world.add(Bone());
    }
  }

}