import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.teal.shade900,
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              height: screenSize.height / 1,
              alignment: Alignment.center,
              child: AnimatedTextKit(
                animatedTexts: [
                  RotateAnimatedText("Universe It Institute",
                      textStyle:
                          const TextStyle(fontSize: 30, color: Colors.white),
                      duration: const Duration(seconds: 5))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
