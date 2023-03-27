import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:plant_species/action_card.dart';
import 'package:plant_species/navigation.dart';
import 'package:plant_species/dashboard.dart';
import 'dart:io';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File? imageFile;

  @override
  void initState() {
    Timer(
        const Duration(
          seconds: 4,
        ),
        () => Navigator.push(
            context, MaterialPageRoute(builder: ((context) => Navigation()))));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          opacity: 0.8,
          image: AssetImage("images/b1.jpeg"),
          fit: BoxFit.cover,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                CircleAvatar(
                  radius: 0, // Image radius
                  backgroundColor: Colors.lightGreen,
                  backgroundImage: AssetImage("images/logo copy.png"),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FutureBuilder(
                          future:
                              Future.delayed(const Duration(seconds: 1), () {}),
                          builder: (c, s) => s.connectionState ==
                                  ConnectionState.done
                              ? Column(
                                  children: [
                                    ActionCard(
                                        width: double.infinity,
                                        height: 250,
                                        title: '',
                                        anim: 'plant',
                                        voidCallback: () {},
                                        animOnly: true),
                                    TextLiquidFill(
                                      text: 'Botani Cam',
                                      textAlign: TextAlign.center,
                                      waveColor: Colors.lightGreen,
                                      boxBackgroundColor: Colors.white,
                                      loadDuration: const Duration(seconds: 1),
                                      textStyle: const TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      boxHeight: 200.0,
                                    ),
                                  ],
                                )
                              : const Text("")),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
