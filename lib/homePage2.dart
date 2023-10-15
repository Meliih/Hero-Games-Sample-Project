import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedIconTheme:
                  IconThemeData(color: Color.fromRGBO(54, 63, 114, 1)),
              unselectedIconTheme: IconThemeData(color: Colors.grey),
              showUnselectedLabels: true,
              selectedLabelStyle:
                  TextStyle(color: Color.fromRGBO(54, 63, 114, 1), fontSize: 20),
              showSelectedLabels: true,
              selectedItemColor: Color.fromRGBO(54, 63, 114, 1),
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
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              buildAppBar(),
              SizedBox(
                height: 20,
              ),
              buildBanner(size),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Workout Programs",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                //constraints: BoxConstraints.expand(height: 50),
                width: size.width - 20,
                child: TabBar(
                    indicatorColor: Color.fromRGBO(88, 96, 138, 1),
                    unselectedLabelColor: Colors.grey,
                    labelColor: Color.fromRGBO(88, 96, 138, 1),
                    tabs: [
                      Tab(
                        child: AutoSizeText(
                          "All Type",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                        ),
                      ),
                      Tab(
                        child: AutoSizeText(
                          "Full Body",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                        ),
                      ),
                      Tab(
                        child: AutoSizeText(
                          "Upper",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                        ),
                      ),
                      Tab(
                        child: AutoSizeText(
                          "Lower",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ]),
              ),
              Expanded(
                child: Container(
                  width: size.width - 20,
                  height: 250,
                  decoration: BoxDecoration(
                      //color: Colors.red,
      
                      ),
                  child: TabBarView(children: [
                    Container(
                      width: size.width - 40,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        // color: Colors.red,
                      ),
                      child: Column(
                        children: [
                          buildContainer(context, "7 days", "Morning Yoga",
                              "Improve mental focus", "30 mins", "yoga.png"),
                          buildContainer(
                              context,
                              "3 days",
                              "Plank Exercise",
                              "Improve posture and stability",
                              "30 mins",
                              "plank.png"),
                          Container(
                            width: size.width - 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Text("Articles Body"),
                    ),
                    Container(
                      child: Text("User Body"),
                    ),
                    Container(
                      child: Text("User Body"),
                    ),
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  buildAppBar() {
    return Row(
      children: [
        SizedBox(
          width: 20,
        ),
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage("assets/image/melih.png"),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello, Jade",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Ready to workout?",
              style: Theme.of(context).textTheme.bodyText2,
            )
          ],
        ),
        Expanded(child: Container()),
        Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              // color: Colors.grey.shade300,
            ),
            child: Center(
              child: Stack(
                children: [
                  Icon(
                    Icons.notifications_none_outlined,
                    color: Colors.black,
                    size: 30.0,
                  ),
                  Positioned(
                    top: 4,
                    right: 7,
                    child: Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ))
      ],
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
            width: (size.width - 20) * 2 / 5,
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

  buildBanner(Size size) {
    return Container(
      width: size.width - 40,
      height: 60,
      child: Row(
        children: [
          Expanded(
            child: Container(
                color: Colors.grey[200],
                height: double.infinity,
                width: double.infinity,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite_border_outlined,
                          size: 15,
                          color: Color.fromRGBO(121, 130, 192, 1),
                        ),
                        Text(
                          "Heart Rate",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "81 BPM",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                )),
          ),
          VerticalDivider(
            color: Colors.grey,
            width: 2,
          ),
          Expanded(
            child: Container(
                color: Colors.grey[200],
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.list,
                          size: 15,
                          color: Color.fromRGBO(121, 130, 192, 1),
                        ),
                        Text(
                          "To - do",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "32,5%",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                )),
          ),
          VerticalDivider(
            color: Colors.grey,
            width: 2,
          ),
          Expanded(
            child: Container(
                color: Colors.grey[200],
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.water_drop_outlined,
                          size: 15,
                          color: Color.fromRGBO(121, 130, 192, 1),
                        ),
                        Text(
                          "Calo",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "1000 Cal",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
