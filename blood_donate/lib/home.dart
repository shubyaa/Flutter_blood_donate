import 'package:blood_donate/AppTheme/styles.dart';
import 'package:blood_donate/app_widgets.dart';
// import 'package:blood_donate/addPeople.dart';
import 'package:blood_donate/main.dart';
import 'package:blood_donate/main/main_screen.dart';
import 'package:blood_donate/main/page_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_route/auto_route.dart';
import 'package:blood_donate/main/page_router.dart';

// ignore: depend_on_referenced_packages

var screenHeight;
// var navHeight;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool switch_bool = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    screenHeight = height;

    double appbarHeight = height * 0.25;

    const String url = "https://www.woolha.com/media/2020/03/eevee.png";
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/backgrounds/home_background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBody: true,
        // ignore: avoid_unnecessary_containers
        body: SafeArea(
          left: false,
          right: false,
          child: ResopnsiveWidget(
            landscape: Container(
              alignment: Alignment.center,
              color: Colors.red,
            ),
            mobile: Column(
              children: [
                Container(
                  height: appbarHeight,
                  width: width,
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                  child: Column(
                    textDirection: TextDirection.ltr,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              // spacing: 0,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                circularImage(),
                                Text(
                                  'Welcome, RAJ',
                                  overflow: TextOverflow.ellipsis,
                                  textWidthBasis: TextWidthBasis.longestLine,
                                  softWrap: true,
                                  textDirection: TextDirection.ltr,
                                  style: titleTextStyle,
                                ),
                                IconButton(
                                  onPressed: () => context.router.push(
                                    AddPeopleRoute(),
                                  ),
                                  icon: Icon(
                                    Icons.people,
                                    size: 30,
                                    color: Color.fromRGBO(239, 252, 250, 1),
                                  ),
                                ),
                              ],
                            ),

                            // ignore: sized_box_for_whitespace
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Blood Group Donating',
                                      textAlign: TextAlign.center,
                                      textDirection: TextDirection.ltr,
                                      style: smallText,
                                    ),
                                    Text(
                                      'A+',
                                      textAlign: TextAlign.center,
                                      textDirection: TextDirection.ltr,
                                      style: bloodGroupText,
                                    ),
                                    Text(
                                      'Availability',
                                      textAlign: TextAlign.center,
                                      textDirection: TextDirection.ltr,
                                      style: smallText,
                                    ),
                                  ],
                                ),
                                FlutterSwitch(
                                  height: 28,
                                  width: 55,
                                  activeColor: offWhite,
                                  inactiveColor: darkGreen,
                                  inactiveToggleColor: offWhite,
                                  toggleColor: darkGreen,
                                  value: switch_bool,
                                  onToggle: ((value) {
                                    setState(() {
                                      switch_bool = value;
                                    });
                                  }),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    color: offWhite,
                    padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                    width: width,
                    // height: listHeight,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ListCard(
                            title: 'Total Donors Donated',
                            content: LineCharts(),
                          ),
                          ListCard(
                            title: "Blood Donors Available",
                            content: BarGraphs(),
                          ),
                          ListCard(
                            title: "Emergency Request",
                            content: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: 150,
                                    child: TextButton(
                                      style: outlineRed,
                                      onPressed: () {},
                                      child: Text(
                                        'Request',
                                        style: boldRed,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 150,
                                    child: TextButton(
                                      style: greenFill,
                                      onPressed: () {}, //Function
                                      child: Text(
                                        'Be a donor',
                                        style: boldWhite,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
