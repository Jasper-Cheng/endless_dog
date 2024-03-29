import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../router.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _switchSelected = false; //维护单选开关状态
  late StateSetter dialog_state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              "assets/images/home_background.jpg",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
            Positioned(
                left: 50,
                bottom: 120,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  child: const Row(
                    children: [
                      Text(
                        "Play",
                        style: TextStyle(
                          color: Colors.lightGreenAccent,
                          fontSize: 40,
                        ),
                      ),
                      Icon(
                        Icons.golf_course,
                        size: 36,
                        color: Colors.lightGreenAccent,
                      )
                    ],
                  ),
                  onTap: () {
                    GoRouter.of(context).push(RoutePath.game_screen);
                  },
                )),
            Positioned(
              top: 10,
              right: 20,
              child: GestureDetector(
                child: const Icon(
                  Icons.settings,
                  size: 50,
                ),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return StatefulBuilder(
                          builder: (context, state) {
                            dialog_state = state;
                            return Dialog(
                              insetPadding: const EdgeInsets.symmetric(
                                  horizontal: 320.0, vertical: 0),
                              child: Container(
                                height: 210,
                                width: 100,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6))),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text("速度"),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        CupertinoSwitch(
                                          value: _switchSelected,
                                          onChanged: (value) {
                                            dialog_state(() {
                                              _switchSelected = value;
                                            });
                                          },
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text("主题"),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        CupertinoSwitch(
                                          value: _switchSelected,
                                          onChanged: (value) {
                                            dialog_state(() {
                                              _switchSelected = value;
                                            });
                                          },
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text("音效"),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        CupertinoSwitch(
                                          value: _switchSelected,
                                          onChanged: (value) {
                                            dialog_state(() {
                                              _switchSelected = value;
                                            });
                                          },
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text("无敌"),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        CupertinoSwitch(
                                          value: _switchSelected,
                                          onChanged: (value) {
                                            dialog_state(() {
                                              _switchSelected = value;
                                            });
                                          },
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                            // return Dialog(
                            //   insetPadding: EdgeInsets.zero,
                            //   backgroundColor: Colors.transparent,
                            //   child: Container(
                            //     height: 210,
                            //     width: 210,
                            //     decoration: BoxDecoration(
                            //         color: Colors.white,
                            //         borderRadius: BorderRadius.all(Radius.circular(6))
                            //     ),
                            //     child: Column(
                            //       children: [
                            //         SizedBox(height: 10,),
                            //         Row(
                            //           children: [
                            //             Text("速度"),
                            //             SizedBox(width: 10,),
                            //             CupertinoSwitch(
                            //               value: _switchSelected,
                            //               onChanged: (value){
                            //                 print("value $value");
                            //                 dialog_state((){
                            //                   _switchSelected=value;
                            //                 });
                            //               },
                            //             )
                            //           ],
                            //         ),
                            //         SizedBox(height: 10,),
                            //         Row(
                            //           children: [
                            //             Text("速度"),
                            //             SizedBox(width: 10,),
                            //             CupertinoSwitch(
                            //               value: _switchSelected,
                            //               onChanged: (value){
                            //                 print("value $value");
                            //                 dialog_state((){
                            //                   _switchSelected=value;
                            //                 });
                            //               },
                            //             )
                            //           ],
                            //         ),
                            //         SizedBox(height: 10,),
                            //         Row(
                            //           children: [
                            //             Text("音效"),
                            //             SizedBox(width: 10,),
                            //             CupertinoSwitch(
                            //               value: _switchSelected,
                            //               onChanged: (value){
                            //                 print("value $value");
                            //                 dialog_state((){
                            //                   _switchSelected=value;
                            //                 });
                            //               },
                            //             )
                            //           ],
                            //         ),
                            //         SizedBox(height: 10,),
                            //         Row(
                            //           children: [
                            //             Text("无敌"),
                            //             SizedBox(width: 10,),
                            //             CupertinoSwitch(
                            //               value: _switchSelected,
                            //               onChanged: (value){
                            //                 print("value $value");
                            //                 dialog_state((){
                            //                   _switchSelected=value;
                            //                 });
                            //               },
                            //             )
                            //           ],
                            //         ),
                            //
                            //       ],
                            //     ),
                            //   ),
                            // );
                          },
                        );
                      });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
