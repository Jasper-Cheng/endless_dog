import 'package:endless_dog/flame_game/components/dog.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';

class EndlessWorld extends World with HasGameReference,TapCallbacks{

  late final Dog dog;

  @override
  Future<void> onLoad() async{
    dog=Dog();
    add(dog);
  }

  @override
  void onTapDown(TapDownEvent event) {
    dog.jump();
  }

}
