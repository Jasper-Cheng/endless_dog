import 'package:flame/collisions.dart';
import 'package:flame/components.dart';


enum DogState {
  running,
  jumping,
  falling,
}
class Dog extends SpriteAnimationGroupComponent<DogState> with CollisionCallbacks{

  @override
  Future<void> onLoad() async {
    // TODO: implement onLoad

  }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollisionStart
    super.onCollisionStart(intersectionPoints, other);
  }


}