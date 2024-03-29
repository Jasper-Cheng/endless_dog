import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import 'flame_game/game_screen.dart';
import 'flame_game/home.dart';

final router = GoRouter(
  initialLocation: RoutePath.home,
  routes: <RouteBase>[
    GoRoute(
      path: RoutePath.home,
      // builder: (context, state) => const Home(),
      pageBuilder: (context, state){
        return CustomTransitionPage(
            child: const Home(),
            transitionsBuilder:(context, animation, secondaryAnimation, child){
              return FadeTransition(opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,);
            }
        );
      }
    ),
    GoRoute(
      path: RoutePath.game_screen,
      // builder: (context, state) => const GameScreen(),
        pageBuilder: (context, state){
          return CustomTransitionPage(
              key: state.pageKey,
              child: const GameScreen(),
              transitionsBuilder:(context, animation, secondaryAnimation, child){
                return FadeTransition(opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                  child: child,);
              }
          );
        }
    )
  ],
);

class RoutePath{
  static const String home="/home";
  static const String game_screen="/game_screen";
}
