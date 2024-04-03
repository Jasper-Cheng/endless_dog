import 'dart:async';

import 'package:endless_dog/router.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'application_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.setLandscape();
  await Flame.device.fullScreen();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ApplicationController())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: Provider.of<ApplicationController>(context).init(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot){
        if(snapshot.hasData){
          return MaterialApp.router(
            title: 'Endless Dog',
            theme: ThemeData(
              brightness: Brightness.light,
            ),
            routerConfig: router,
          );
        }else{
          return Container();
        }
      },
    );
  }
}