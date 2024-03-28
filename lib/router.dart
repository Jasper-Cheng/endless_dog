import 'package:go_router/go_router.dart';

import 'flame_game/game_screen.dart';
import 'flame_game/home.dart';

final router = GoRouter(
  initialLocation: RoutePath.home,
  routes: <RouteBase>[
    GoRoute(
      path: RoutePath.home,
      builder: (context, state) => const Home(),
    ),
    GoRoute(
      path: RoutePath.game_screen,
      builder: (context, state) => const GameScreen(),
    )
  ],
);

class RoutePath{
  static const String home="/home";
  static const String game_screen="/game_screen";
}
