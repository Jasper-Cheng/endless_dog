import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../router.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              "assets/images/background.jpg"
            )
        )
      ),
      child: Center(
        child: GestureDetector(
          child: Text(
            "Play",
            style: TextStyle(
                fontSize: 30
            ),
          ),
          onTap: (){
            GoRouter.of(context).push(RoutePath.game_screen);
          },
        )
      ),
    );
  }
}
