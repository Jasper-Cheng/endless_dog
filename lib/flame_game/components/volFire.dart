import 'package:endless_dog/flame_game/components/fire.dart';
import 'package:endless_dog/flame_game/components/volcano.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../endless_world.dart';

class VolFire extends PositionComponent with HasGameReference, HasWorldReference<EndlessWorld>{

  @override
  Future<void> onLoad() async {
    size=Vector2(100, 0);
    add(Fire(position: Vector2(28,0)));
    add(Volcano(position: Vector2(0,0)));
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= world.baseSpeedFactory*100 * dt;

    if(position.x<=-size.x){
      removeFromParent();
      // game.world.add(Bone());
    }
  }

}