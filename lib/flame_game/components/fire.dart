import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';

import '../endless_world.dart';

class Fire extends SpriteComponent with HasGameReference, HasWorldReference<EndlessWorld>{

  Fire({super.position}) : super();

  @override
  Future<void> onLoad() async {

    size=Vector2(12,30);
    // position=Vector2(100, 0);
    sprite=await game.loadSprite('fire.png');

    add(MoveByEffect(Vector2(0,-25), EffectController(duration: 3)));
    // add(SpriteComponent(sprite: await Sprite.load('jump_dog.png'),position: Vector2(0, -10),size: Vector2(30,60)));
    // add(RectangleHitbox());
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