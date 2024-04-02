import 'dart:async';
import 'dart:math';

import 'package:endless_dog/flame_game/components/bomb.dart';
import 'package:endless_dog/flame_game/components/dog.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/experimental.dart';
import 'package:flutter/material.dart';

import 'components/bone.dart';
import 'components/volFire.dart';
import 'game_screen.dart';

class EndlessWorld extends World with HasGameReference,TapCallbacks{

  late final Dog dog;

  final Random _random=Random(10);
  final lifeNotifier = ValueNotifier(3);

  double baseSpeedFactory=1.0;
  DateTime currentTime=DateTime.now();

  late SpawnComponent boneSpawnComponent;
  late SpawnComponent bombSpawnComponent;
  late SpawnComponent volFireSpawnComponent;

  @override
  Future<void> onLoad() async{
    game.overlays.add(GameScreen.backButtonKey);
    dog=Dog(position: Vector2(0,-150));
    add(dog);

    boneSpawnComponent=SpawnComponent.periodRange(
      factory: (_) => Bone(),
      minPeriod: 0.1,
      maxPeriod: 6.0,
      area: Rectangle.fromLTRB(
          game.size.x,-game.size.y/3,game.size.x,-game.size.y/1.1
      ),
      random: _random,
    );
    add(boneSpawnComponent);

    bombSpawnComponent=SpawnComponent.periodRange(
      factory: (_) => Bomb(),
      minPeriod: 0.1,
      maxPeriod: 5.0,
      area: Rectangle.fromLTRB(
          game.size.x,-game.size.y/2,game.size.x,-game.size.y/1.1
      ),
      random: _random,
    );
    add(bombSpawnComponent);

    // add(Volcano());

    volFireSpawnComponent=SpawnComponent(
      factory: (_) => VolFire(),
      period: 6,
      area: Rectangle.fromLTRB(
          game.size.x,-120,game.size.x,-120
      ),
      random: _random,
    );
    add(volFireSpawnComponent);
    // add(
    //   SpawnComponent.periodRange(
    //     factory: (_) => Man(),
    //     minPeriod: 0.1,
    //     maxPeriod: 1,
    //     area: Rectangle.fromLTRB(
    //         game.size.x,-230,game.size.x/1.3,-230
    //     ),
    //     random: _random,
    //   ),
    // );

    add(TimerComponent(period: 3,repeat: true,onTick: (){
      baseSpeedFactory=baseSpeedFactory+0.1;
      // print("bone  ${boneSpawnComponent.maxPeriod}");
      // print("bomb  ${bombSpawnComponent.maxPeriod}");
      // print("volFire  ${volFireSpawnComponent.period}");
      if(boneSpawnComponent.maxPeriod!=null){
        if(boneSpawnComponent.maxPeriod!>1){
          boneSpawnComponent.maxPeriod=boneSpawnComponent.maxPeriod!-0.1;
        }else{
          boneSpawnComponent.maxPeriod=1;
        }
      }else{
        boneSpawnComponent.maxPeriod=6;
      }
      if(bombSpawnComponent.maxPeriod!=null){
        if(bombSpawnComponent.maxPeriod!>0.8){
          bombSpawnComponent.maxPeriod=bombSpawnComponent.maxPeriod!-0.1;
        }else{
          bombSpawnComponent.maxPeriod=0.8;
        }
      }else{
        bombSpawnComponent.maxPeriod=5;
      }
      volFireSpawnComponent.period=volFireSpawnComponent.period>1.2?volFireSpawnComponent.period-0.1:1.2;
      boneSpawnComponent.minPeriod=0.1;
      bombSpawnComponent.minPeriod=0.1;
      // print("baseSpeedFactory $baseSpeedFactory");
    }));
  }

  void addLife(){
    lifeNotifier.value++;
    // print("addLife lifeNotifier.value ${lifeNotifier.value}");
  }

  void removeLife(){
    lifeNotifier.value--;
    // print("addLife lifeNotifier.value ${lifeNotifier.value}");
    if(lifeNotifier.value==0){
      game.pauseEngine();
      game.overlays.add(GameScreen.dieDialogKey);
    }
  }

  @override
  void onTapDown(TapDownEvent event) {
    dog.jump();
  }

}
