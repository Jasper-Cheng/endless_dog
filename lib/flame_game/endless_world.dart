import 'dart:async';
import 'dart:math';

import 'package:endless_dog/flame_game/components/bomb.dart';
import 'package:endless_dog/flame_game/components/dog.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/experimental.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../application_controller.dart';
import 'components/bone.dart';
import 'components/volFire.dart';
import 'game_screen.dart';

class EndlessWorld extends World with HasGameReference,TapCallbacks{

  late final Dog dog;

  final Random _random=Random(10);
  final lifeNotifier = ValueNotifier(1);

  double baseSpeedFactory=1.0;
  DateTime currentTime=DateTime.now();

  late SpawnComponent boneSpawnComponent;
  late SpawnComponent bombSpawnComponent;
  late SpawnComponent volFireSpawnComponent;
  late TimerComponent timerComponent;

  late DateTime startTime;

  @override
  Future<void> onLoad() async{
    game.overlays.add(GameScreen.backButtonKey);
    dog=Dog(position: Vector2(0,-200));
    add(dog);

    boneSpawnComponent=SpawnComponent.periodRange(
      factory: (_) => Bone(),
      minPeriod: 0.1,
      maxPeriod: 6.0,
      area: Rectangle.fromLTRB(
          game.size.x,-220,game.size.x,-game.size.y+100
      ),
      random: _random,
    );
    add(boneSpawnComponent);

    bombSpawnComponent=SpawnComponent.periodRange(
      factory: (_) => Bomb(),
      minPeriod: 0.1,
      maxPeriod: 5.0,
      area: Rectangle.fromLTRB(
          game.size.x,-220,game.size.x,-game.size.y+100
      ),
      random: _random,
    );
    add(bombSpawnComponent);

    volFireSpawnComponent=SpawnComponent(
      factory: (_) => VolFire(),
      period: 6,
      area: Rectangle.fromLTRB(
          game.size.x,-150,game.size.x,-150
      ),
      random: _random,
    );
    add(volFireSpawnComponent);

    timerComponent=TimerComponent(period: 3,repeat: true,onTick: (){
      baseSpeedFactory=baseSpeedFactory+0.1;
      // print("bone  ${boneSpawnComponent.maxPeriod}");
      // print("bomb  ${bombSpawnComponent.maxPeriod}");
      // print("volFire  ${volFireSpawnComponent.period}");
      // print("baseSpeedFactory $baseSpeedFactory");
      if(baseSpeedFactory>6)timerComponent.removeFromParent();
      if(boneSpawnComponent.maxPeriod!=null){
        boneSpawnComponent.maxPeriod=6/baseSpeedFactory;
      }else{
        boneSpawnComponent.maxPeriod=6;
      }
      if(bombSpawnComponent.maxPeriod!=null){
        bombSpawnComponent.maxPeriod=5/baseSpeedFactory;
      }else{
        bombSpawnComponent.maxPeriod=5;
      }
      volFireSpawnComponent.period=volFireSpawnComponent.period>1.2?volFireSpawnComponent.period-0.1:1.2;
      boneSpawnComponent.minPeriod=0.1;
      bombSpawnComponent.minPeriod=0.1;
    });
    add(timerComponent);
  }

  @override
  void onMount() {
    // TODO: implement onMount
    super.onMount();
    startTime=DateTime.now();
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
      if(game.buildContext!=null){
        int? lastBestGrade=game.buildContext!.read<ApplicationController>().getBestGrade();
        DateTime endTime=DateTime.now();
        int currentGrade=endTime.difference(startTime).inSeconds;
        if(lastBestGrade==null||lastBestGrade<currentGrade){
          game.buildContext!.read<ApplicationController>().setBestGrade(currentGrade);
        }
        game.buildContext!.read<ApplicationController>().addStartEndTimeGradeRecordItem("${startTime.toString()}&&${endTime.toString()}&&$currentGrade");
      }
      game.overlays.add(GameScreen.dieDialogKey);
    }
  }

  @override
  void onTapDown(TapDownEvent event) {
    dog.jump();
  }

}
