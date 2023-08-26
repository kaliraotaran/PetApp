import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pet_app/starterpage.dart';

import 'homepage.dart';

class Store extends StatefulWidget {
  const Store({super.key});

  @override
  State<Store> createState() => _StoreState();
}

enum _SelectedTab { home, favorite, search }

class _StoreState extends State<Store> {
  var _selectedtab = _SelectedTab.home;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedtab = _SelectedTab.values[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DotNavigationBar(
        margin: EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        paddingR: EdgeInsets.only(right: 20, left: 10, top: 5),
        unselectedItemColor: Colors.white,
        enableFloatingNavBar: true,
        borderRadius: 50,
        backgroundColor: Colors.black,
        dotIndicatorColor: Colors.black,
        currentIndex: _SelectedTab.values.indexOf(_selectedtab),
        onTap: _handleIndexChanged,
        items: [
          /// Home
          DotNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: Homepage(),
                        type: PageTransitionType.leftToRightWithFade));
              },
            ),
            selectedColor: primary,
          ),

          /// Likes
          DotNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {},
            ),
            selectedColor: primary,
          ),

          /// Search
          DotNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: Store(), type: PageTransitionType.rightToLeft));
              },
            ),
            selectedColor: primary,
          ),
        ],
      ),
    );
  }
}
