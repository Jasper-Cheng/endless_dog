import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../endless_world.dart';

class Volcano extends SpriteComponent with HasGameReference, HasWorldReference<EndlessWorld>{

  Volcano({super.position}) : super();

  @override
  Future<void> onLoad() async {

    size=Vector2(60, 30);
    sprite=await game.loadSprite('volcano.png');
  }

}