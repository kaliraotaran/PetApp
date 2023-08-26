import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:pet_app/starterpage.dart';

class DogProfile extends StatefulWidget {
  const DogProfile(
      {super.key,
      required this.img,
      required this.homeTown,
      required this.name});
  final String img;
  final String homeTown;
  final String name;

  //static String routeName = '/dogprofile';

  @override
  State<DogProfile> createState() => _DogProfileState();
}

class _DogProfileState extends State<DogProfile> {
  late final String img1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              FeatherIcons.x,
            )),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        title: const Text(
          'Dog Profile',
          style: TextStyle(fontWeight: FontWeight.w300, letterSpacing: 1),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            ImageBox(
              img: widget.img,
            ),
            NameAndIcon(
              name: widget.name,
            ),
            specificationContainer(),
            info(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'ToDo List',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 1.4),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 30),
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200, shape: BoxShape.circle),
                  child: const Center(
                      child: Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  )),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const TODOlist(
              date: '15 Sep. 22',
              reminder: '15 Sep. 22 - 12:00 AM',
              title: 'Birthday Party',
            ),
            const TODOlist(
              date: '27 Sep. 22',
              reminder: '27 Sep. 22 - 10:00 AM',
              title: 'Buy Food',
            ),
            const TODOlist(
              date: '1 Oct. 22',
              reminder: '1 Oct. 22 - 2:00 PM',
              title: 'Go to the Vet',
            )
          ],
        ),
      ),
    );
  }

//---------------------------------------------------------------------

  Container specificationContainer() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 243, 242, 242),
          borderRadius: BorderRadius.circular(25)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          horiContainerTexts(
            top: 'Age',
            bottom: '9 months',
          ),
          straightline(),
          horiContainerTexts(top: 'Weight', bottom: '10 kg'),
          straightline(),
          horiContainerTexts(top: 'HomeTown', bottom: 'Dallas')
        ],
      ),
    );
  }

//---------------------------------------------------------------------

  Padding straightline() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Container(
        width: 2,
        height: double.infinity,
        decoration: BoxDecoration(color: Colors.grey.shade300),
      ),
    );
  }
}
//---------------------------------------------------------------------

class TODOlist extends StatelessWidget {
  const TODOlist({
    super.key,
    required this.title,
    required this.reminder,
    required this.date,
  });
  final String title;
  final String reminder;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(blurRadius: 4, color: Colors.grey.shade300)],
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey.shade100,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        letterSpacing: 1.2),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0),
                  child: Icon(
                    FeatherIcons.moreHorizontal,
                    size: 19,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Container(
                      width: 100,
                      height: 24,
                      decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(35)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            FeatherIcons.calendar,
                            size: 15,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 3.5,
                          ),
                          Text(
                            date,
                            style: const TextStyle(
                                fontSize: 12, color: Colors.white),
                          )
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Container(
                      width: 170,
                      height: 24,
                      decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(35)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            FeatherIcons.bell,
                            size: 15,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 3.5,
                          ),
                          Text(
                            reminder,
                            style: const TextStyle(
                                fontSize: 12, color: Colors.white),
                          )
                        ],
                      )),
                ),
              ],
            )
          ],
        ));
  }
}

//---------------------------------------------------------------------

class info extends StatelessWidget {
  const info({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        children: [
          const Text(
            'About Name',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w300, letterSpacing: 1.4),
          ),
          const SizedBox(
            height: 7,
          ),
          const Text(
            'The dog is intelligent and eager to please, which makes them easy to train. They can learn a variety of stuff and tricks, and they are always happy to show off their skills.',
            style: TextStyle(fontWeight: FontWeight.w200, fontSize: 14),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Container(
              width: double.infinity,
              height: 2,
              decoration: BoxDecoration(color: Colors.grey.shade200),
            ),
          )
        ],
      ),
    );
  }
}

//---------------------------------------------------------------------

class NameAndIcon extends StatelessWidget {
  const NameAndIcon({
    super.key,
    required this.name,
  });
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(19.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontSize: 27,
            ),
          ),
          const Icon(
            FeatherIcons.share,
            size: 22,
          )
        ],
      ),
    );
  }
}

//---------------------------------------------------------------------

class ImageBox extends StatelessWidget {
  const ImageBox({
    super.key,
    required this.img,
  });
  final String img;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        width: 400,
        height: 200,
        decoration: BoxDecoration(
            image: DecorationImage(fit: BoxFit.cover, image: AssetImage(img)),
            borderRadius: BorderRadius.circular(30)),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '143',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

//---------------------------------------------------------------------

class horiContainerTexts extends StatelessWidget {
  const horiContainerTexts({
    super.key,
    required this.top,
    required this.bottom,
  });
  final String top;
  final String bottom;

  @override
  Widget build(BuildContext context) {
    return Column(
      textBaseline: TextBaseline.alphabetic,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 20.0, top: 10, right: 25, bottom: 15),
          child: Text(
            top,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            bottom,
            style: TextStyle(
                color: primary, fontSize: 15, fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}
