import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color mainBackgroundColor = Colors.white;

  List<String> ImageList = [
    "assets/image/photo.jpeg",
    "assets/image/photo.jpeg",
    "assets/image/photo.jpeg",
    "assets/image/photo.jpeg",
  ];

  int InitialPage = 0;
  int _selectedIndex = 0;
  CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: mainBackgroundColor,
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedIconTheme:
                  IconThemeData(color: Color.fromRGBO(2, 122, 72, 1)),
              unselectedIconTheme: IconThemeData(color: Colors.grey),
              showUnselectedLabels: true,
              selectedLabelStyle:
                  TextStyle(color: Color.fromRGBO(2, 122, 72, 1), fontSize: 20),
              showSelectedLabels: true,
              selectedItemColor: Color.fromRGBO(2, 122, 72, 1),
              elevation: 0,
              currentIndex: _selectedIndex,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "·"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.near_me_outlined), label: ""),
                BottomNavigationBarItem(
                    icon: Icon(Icons.assessment_outlined), label: ""),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
              ]),
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            actions: [
              Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.notifications_none,
                        color: Colors.black, size: 30.0),
                    onPressed: () async {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => Notifications()));
                    },
                  ),
                  Positioned(
                    right: 15,
                    top: 12,
                    child: Container(
                      height: 7,
                      width: 7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        "Hello,",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        " Sara Rose",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    "How are you feeling today?",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      buildIconContainer("assets/icon/love.png", size, "Love"),
                      buildIconContainer("assets/icon/cool.png", size, "Cool"),
                      buildIconContainer(
                          "assets/icon/happy.png", size, "Happy"),
                      buildIconContainer("assets/icon/sad.png", size, "Sad"),
                    ],
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Feature",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "See more >",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 200,
                    child: Column(
                      children: [
                        CarouselSlider(
                            carouselController: _controller,
                            items: ImageList.map((ImageList) {
                              return Builder(builder: (BuildContext context) {
                                return Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      image: DecorationImage(
                                          image: AssetImage(ImageList),
                                          fit: BoxFit.cover)),
                                );
                              });
                            }).toList(),
                            options: CarouselOptions(
                              height: 150.0,
                              autoPlay: false,
                              enlargeCenterPage: true,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  InitialPage = index;
                                });
                              },
                            )),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: ImageList.asMap().entries.map((ImageList) {
                            return InkWell(
                              onTap: () {
                                _controller.jumpToPage(ImageList.key);
                                setState(() {});
                              },
                              child: Container(
                                margin: EdgeInsets.all(2),
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                  shape: InitialPage == ImageList.key
                                      ? BoxShape.circle
                                      : BoxShape.rectangle,
                                  color: InitialPage == ImageList.key
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                              ),
                            );
                          }).toList(),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      buildExerciseContainer(size),
                      SizedBox(height: 10),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  buildExerciseContainer(Size size) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Exercise",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              "See more >",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: (size.width - 80) / 2,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color.fromRGBO(249, 240, 255, 0.7),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 30,
                        //width: 25,
                        padding: EdgeInsets.only(left: 10),
                        child: Image.asset(
                          "assets/icon/relaxation.png",
                          //fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Relaxation",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: (size.width - 80) / 2,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color.fromRGBO(253, 242, 251, 1),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 30,
                        //width: 25,
                        padding: EdgeInsets.only(left: 10),
                        child: Image.asset(
                          "assets/icon/meditation.png",
                          //fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Meditation",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: (size.width - 80) / 2,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color.fromRGBO(246, 211, 173, 0.4),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 30,
                        //width: 25,
                        padding: EdgeInsets.only(left: 10),
                        child: Image.asset(
                          "assets/icon/beathing.png",
                          //fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Beathing",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: (size.width - 80) / 2,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color.fromRGBO(215, 240, 255, 0.45),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 30,
                        //width: 25,
                        padding: EdgeInsets.only(left: 10),
                        child: Image.asset(
                          "assets/icon/yoga.png",
                          //fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Yoga",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }

  buildIconContainer(String url, Size size, String text) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
              //margin:  EdgeInsets.only(right: 15,),
              height: (size.width - 100) / 4,
              width: (size.width - 100) / 4,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[300],
              ),
              child: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(url),
                //maxRadius: 20,
              )),
          Text(
            "${text}",
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget buildContainer(BuildContext context, String day, String text,
      String text2, String text3, String photoUrl) {
    double containerheight = 165;

    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width - 20,
      height: containerheight,
      margin: EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: (size.width - 20) * 3 / 5,
            padding: EdgeInsets.only(left: 20, top: 10),
            //decoration: BoxDecoration(color: Colors.grey[300]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  width: 70,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white60),
                  child: Center(
                      child: Text(
                    "${day}",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  )),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Container(
                    width: size.width - 250,
                    decoration: BoxDecoration(
                        //color: Colors.yellow,
                        ),
                    child: AutoSizeText("${text}",
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 60, fontWeight: FontWeight.bold)),
                  ),
                ),
                Container(
                  width: (size.width - 90),
                  decoration: BoxDecoration(
                      //color: Colors.green[300],
                      ),
                  margin: EdgeInsets.only(top: 10),
                  child: AutoSizeText("${text2}",
                      textAlign: TextAlign.justify,
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      )),
                ),
                Container(
                  width: (size.width - 90),
                  decoration: BoxDecoration(
                      //color: Colors.orange[300],
                      ),
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        color: Colors.black,
                        size: 15,
                      ),
                      SizedBox(width: 5),
                      AutoSizeText(
                        "${text3}",
                        textAlign: TextAlign.justify,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: (size.width - 20) * 2 / 7,
            decoration: BoxDecoration(
                // color: Colors.red,
                ),
            height: containerheight,
            child: Image.asset(
              "assets/image/${photoUrl}",
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
