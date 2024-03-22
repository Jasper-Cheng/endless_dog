import 'package:endless_dog/router.dart';
import 'package:endless_dog/style/palette.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.setLandscape();
  await Flame.device.fullScreen();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => Palette()),
        // ChangeNotifierProvider(create: (context) => PlayerProgress()),
      ],
      child: Builder(builder: (context) {
        return MaterialApp.router(
          title: 'Endless Dog',
          theme: ThemeData(
            brightness: Brightness.light,
          ),
          routerConfig: router,
        );
      }),
    );
  }
}