import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:birthday_app/pages/home.dart';
import 'package:birthday_app/pages/livingroom.dart';
import 'package:birthday_app/pages/gallery.dart';
//import 'package:birthday_app/pages/bedroom.dart';


void main() => runApp(MaterialApp(
  home: const HBD(),
  routes: {
    '/open': (context) => const HBD(),
    '/home': (context) => const Home(),
    '/livingroom': (context) => const LivingRoom(),
    '/gallery': (context) => const Gallery(),
  },
));


class HBD extends StatelessWidget {
  const HBD({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HBD',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Loading(),
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              AnimatedTextKit(
                isRepeatingAnimation: true,
                repeatForever: true,
                animatedTexts: [
                  ScaleAnimatedText(
                      "It's",
                      duration: const Duration(seconds: 1),
                      textStyle: const TextStyle(fontSize: 50,
                        fontFamily: 'Pina Colada',
                        color: Colors.white,)
                  ),
                  ScaleAnimatedText(
                      "Your",
                      duration: const Duration(seconds: 1),
                      textStyle: const TextStyle(fontSize: 50,
                        fontFamily: 'Pina Colada',
                        color: Colors.white,)
                  ),
                  ScaleAnimatedText(
                      "Birthday",
                      duration: const Duration(seconds: 1),
                      textStyle: const TextStyle(fontSize: 50,
                        fontFamily: 'Pina Colada',
                        color: Colors.white,)
                  ),
                ],
              ),
              //),
              const SizedBox(),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).push(_createRoute());
                },
                icon: const Icon (Icons.cake_rounded),
                label: const Text('Let us celebrate!'),
                style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(const TextStyle(
                      fontSize: 20,
                      fontFamily: 'Pina Colada'
                  )),
                  backgroundColor: MaterialStateProperty.all(const Color(0xFF940900)),
                ),
              )
            ]
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Home(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      final tween = Tween(begin: begin, end: end);
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: curve,
      );

      return SlideTransition(
        position: tween.animate(curvedAnimation),
        child: child,
      );
    },
  );
}

var curve = Curves.ease;
var curveTween = CurveTween(curve: curve);
