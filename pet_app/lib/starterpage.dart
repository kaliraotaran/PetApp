import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:pet_app/homepage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_animate/flutter_animate.dart';

final Color primary = Colors.lightBlue;

class starterpage extends StatefulWidget {
  const starterpage({super.key});
  static String routeName = '/starter';

  @override
  State<starterpage> createState() => _starterpageState();
}

class _starterpageState extends State<starterpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('assets/splash.png'))),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Welcome to',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 5),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'The Clinik',
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 5),
              ).animate().fadeIn(duration: 500.ms).then(delay: 100.ms).slideX(),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                      child: Homepage(), type: PageTransitionType.bottomToTop),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 530, bottom: 35, left: 20, right: 20),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 27),
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                      color: primary, borderRadius: BorderRadius.circular(30)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Enter',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 2),
                      ),
                      Icon(
                        FeatherIcons.arrowRight,
                        size: 28,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
