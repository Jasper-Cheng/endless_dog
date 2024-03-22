import 'package:go_router/go_router.dart';

import 'flame_game/game_screen.dart';

final router = GoRouter(
  initialLocation: RoutePath.game_screen,
  routes: <RouteBase>[
    GoRoute(
      path: RoutePath.game_screen,
      builder: (context, state) => const GameScreen(),
    )
  ],
);

class RoutePath{
  static const String game_screen="/game_screen";
}
