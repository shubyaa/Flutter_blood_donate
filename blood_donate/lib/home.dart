import 'package:blood_donate/AppTheme/styles.dart';
import 'package:blood_donate/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: depend_on_referenced_packages

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double appbarHeight = height * 0.25;
    double bottomNavHeight = height * 0.115;

    const String url = "https://www.woolha.com/media/2020/03/eevee.png";
    return Scaffold(
      backgroundColor: darkGreen,
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
                color: darkGreen,
                height: appbarHeight,
                width: width,
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  textDirection: TextDirection.ltr,
                  children: [
                    Wrap(
                      direction: Axis.vertical,
                      alignment: WrapAlignment.spaceBetween,
                      children: [
                        Wrap(
                          // spacing: 0,
                          alignment: WrapAlignment.spaceEvenly,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: circularImage(),
                            ),
                            Text(
                              'Welcome, Amit Rao',
                              softWrap: true,
                              textDirection: TextDirection.ltr,
                              style: titleTextStyle,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: const Icon(
                                Icons.people,
                                size: 30,
                                color: Color.fromRGBO(239, 252, 250, 1),
                              ),
                            ),
                          ],
                        ),

                        // ignore: sized_box_for_whitespace
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Blood Group Donating',
                              textAlign: TextAlign.start,
                              textDirection: TextDirection.ltr,
                              style: smallText,
                            ),
                            Text(
                              'A+',
                              textAlign: TextAlign.start,
                              textDirection: TextDirection.ltr,
                              style: bloodGroupText,
                            ),
                            Text(
                              'Availability',
                              textAlign: TextAlign.start,
                              textDirection: TextDirection.ltr,
                              style: smallText,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: width,
                height: height - appbarHeight - bottomNavHeight,
                color: offWhite,
                padding: const EdgeInsets.fromLTRB(5, 18, 5, 0),
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
            ],
          ),
        ),
      ),

      bottomNavigationBar: bottomNavigationBar(),
    );
  }
}
