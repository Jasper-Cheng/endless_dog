import 'package:flame/components.dart';

import '../endless_world.dart';

class Volcano extends SpriteComponent with HasGameReference, HasWorldReference<EndlessWorld>{

  Volcano({super.position}) : super();

  @override
  Future<void> onLoad() async {

    size=Vector2(60, 30);
    // position=Vector2(100, 0);
    sprite=await game.loadSprite('volcano.png');
    // add(MoveByEffect(Vector2(12,-30), EffectController(duration: 3)));
    // add();
    // add(SequenceEffect(
    //   [
    //     MoveByEffect(Vector2(0,-230), EffectController(duration: 3))
    //   ]
    // ));
    // add(SpriteComponent(sprite: await Sprite.load('hello_world.jpg'),position: Vector2(23, 15),size: Vector2(35,45)));
    // add(RectangleHitbox(position: Vector2(23, 15),size: Vector2(35,45)));
  }

}