import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pet_app/dog_profile.dart';
import 'package:pet_app/starterpage.dart';
import 'package:pet_app/store.dart';
// import 'package:pet_app/starterpage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  static String routeName = '/homepage';

  @override
  State<Homepage> createState() => _HomepageState();
}

enum _SelectedTab { home, favorite, search, person }

class _HomepageState extends State<Homepage> {
  var _selectedtab = _SelectedTab.home;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedtab = _SelectedTab.values[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.grey.shade100,
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
      // NavigationBar(destinations: [Icon(Icons.abc), Icon(Icons.abc)]),
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const topbar(),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'My Pets',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const scrollaldogs(),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Veterinary',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 20),
                      ),
                      Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            shape: BoxShape.circle),
                        child: const Center(
                            child: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        )),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                doctorcard(
                  avail: true,
                  date: '12 August 23',
                  img: 'assets/doc.png',
                  name: 'Dante Smith',
                ),
                doctorcard(
                    name: 'Dr. Patel       ',
                    date: '17 August 23',
                    img: 'assets/doc2.png',
                    avail: false)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class doctorcard extends StatelessWidget {
  const doctorcard({
    super.key,
    required this.name,
    required this.date,
    required this.img,
    required this.avail,
  });
  final String name;
  final String date;
  final String img;
  final bool avail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Container(
                  height: 150,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(img),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        Icon(
                          FeatherIcons.moreHorizontal,
                          size: 18,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Dog physician specialist',
                      style:
                          TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 83,
                          height: 21,
                          decoration: BoxDecoration(
                              color: Colors.lightBlue,
                              borderRadius: BorderRadius.circular(35)),
                          child: Center(
                            child: Text(
                              date,
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            width: 83,
                            height: 21,
                            decoration: BoxDecoration(
                                color: avail ? Colors.amber : Colors.red,
                                borderRadius: BorderRadius.circular(35)),
                            child: const Center(
                              child: Text(
                                'Available',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class scrollaldogs extends StatelessWidget {
  const scrollaldogs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ImageContainer(
            img: 'assets/dog1.png',
            name: 'Alfred',
            textcolor: Colors.white,
          ),
          ImageContainer(
            img: 'assets/dog3.png',
            name: 'Joe',
            textcolor: Colors.white,
          ),
          ImageContainer(
            img: 'assets/dog4.png',
            name: 'Pepper',
            textcolor: Colors.white,
          ),
          ImageContainer(
            img: 'assets/dog5.png',
            name: 'James',
            textcolor: Colors.black,
          )
        ],
      ),
    );
  }
}

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    super.key,
    required this.img,
    required this.name,
    required this.textcolor,
  });
  final String img;
  final String name;
  final Color textcolor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
          height: 170,
          width: 180,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 6, right: 6, top: 6, bottom: 14),
                child: Container(
                  height: 110,
                  width: 170,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          fit: BoxFit.cover, image: AssetImage(img))),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 13),
                          child: Text(
                            name,
                            style: TextStyle(
                                color: textcolor, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, left: 15, bottom: 6, right: 9),
                                child: Icon(
                                  Icons.favorite_rounded,
                                  color: textcolor,
                                  size: 20,
                                )),
                          ),
                          Text(
                            '211',
                            style: TextStyle(color: textcolor, fontSize: 13),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: DogProfile(
                            homeTown: 'Chicago',
                            img: img,
                            name: name,
                          ),
                          type: PageTransitionType.bottomToTop));
                },
                child: Container(
                  width: 160,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.grey.shade300),
                  child: const Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      'Go To Profile',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}

class topbar extends StatelessWidget {
  const topbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              image: const DecorationImage(
                  fit: BoxFit.cover, image: AssetImage('assets/face.png'))),
        ),
        const Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            'Hi, Debbie',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
        ),
        const SizedBox(
          width: 120,
        ),
        const Icon(
          FeatherIcons.bell,
          size: 18,
        ),
        const SizedBox(
          width: 20,
        ),
        const Icon(
          FeatherIcons.shoppingBag,
          size: 18,
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }
}
