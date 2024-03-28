import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';

import '../endless_world.dart';

class Bat extends SpriteAnimationComponent with HasGameReference, HasWorldReference<EndlessWorld>{

  @override
  Future<void> onLoad() async {

    size=Vector2(80, 60);
    // position=Vector2(game.size.x, -game.size.y*0.45);
    // sprite=await game.loadSprite('bat2.png');
    animation=SpriteAnimation.spriteList(
      [await game.loadSprite('bat2.png'),await game.loadSprite('bat1.png'),await game.loadSprite('bat2.png'),await game.loadSprite('bat3.png')],
      stepTime: 0.25,
    );
    add(PolygonComponent(
      [
        Vector2(29, 13),
        Vector2(56, 44),
        Vector2(54, 45),
        Vector2(25, 15)
        // Vector2(20, 10)
      ]
    ));
    // add(ScaleEffect.by(Vector2(1.5,1.5), EffectController(duration: 3)));
    add(PolygonHitbox(
      [
        Vector2(29, 13),
        Vector2(56, 44),
        Vector2(54, 45),
        Vector2(25, 15)
      ],
    ));
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= 150 * dt;

    if(position.x<=-size.x){
      removeFromParent();
      // game.world.add(Bone());
    }
  }

}