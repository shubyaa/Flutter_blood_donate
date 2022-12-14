// ignore_for_file: depend_on_referenced_packages
import 'package:blood_donate/app_functions.dart';
import 'package:blood_donate/login.dart';
import 'package:blood_donate/addPeople.dart';
import 'package:blood_donate/maps.dart';
import 'package:blood_donate/subpages/myHistory.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:blood_donate/AppTheme/styles.dart';

// import 'package:url_launcher/url_launcher.dart';

import 'package:blood_donate/main/page_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';

// import 'package:google_fonts/google_fonts.dart';

// params

double cardTitleHeight = 20;

TextStyle titleStyle = GoogleFonts.lato(
  color: const Color.fromARGB(190, 15, 56, 49),
  fontSize: cardTitleHeight,
  fontWeight: FontWeight.normal,
);

const textStyle = TextStyle(
  color: Color.fromRGBO(0, 109, 95, 1),
  fontSize: 12,
  fontWeight: FontWeight.normal,
);

const leftBarColor = Color.fromRGBO(0, 109, 95, 1);
const rightBarColor = Color.fromARGB(255, 232, 0, 0);
double width = 7;

int touchedGroupIndex = -1;

List<Color> gradientColors = [
  const Color.fromRGBO(90, 206, 188, 1),
  Colors.white,
];

final barGroup1 = makeGroupData(0, 5, 12);
final barGroup2 = makeGroupData(1, 16, 12);
final barGroup3 = makeGroupData(2, 18, 5);
final barGroup4 = makeGroupData(3, 20, 16);
final barGroup5 = makeGroupData(4, 17, 6);
final barGroup6 = makeGroupData(5, 19, 1.5);
final barGroup7 = makeGroupData(6, 10, 1.5);

final items = [
  barGroup1,
  barGroup2,
  barGroup3,
  barGroup4,
  barGroup5,
  barGroup6,
  barGroup7,
];

List<BarChartGroupData> rawBarGroups = items;

List<BarChartGroupData> showingBarGroups = rawBarGroups;

// CHARTS
class LineCharts extends StatelessWidget {
  const LineCharts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const cuttoffValue = 0.0;

    return Container(
      // width: 400,
      height: 250,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(15),
      child: LineChart(
        LineChartData(
          borderData: FlBorderData(
            show: false,
          ),
          gridData: FlGridData(
            show: false,
          ),
          lineTouchData: LineTouchData(enabled: true),
          lineBarsData: [
            LineChartBarData(
              spots: [
                const FlSpot(1, 1),
                const FlSpot(2, 4),
                const FlSpot(3, 2),
                const FlSpot(4, 5),
                const FlSpot(5, 3),
              ],
              isCurved: true,
              barWidth: 4,
              color: const Color.fromRGBO(0, 109, 95, 1),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: gradientColors,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                cutOffY: cuttoffValue,
                applyCutOffY: true,
              ),
              dotData: FlDotData(
                show: false,
              ),
            ),
          ],
          minY: 0,
          titlesData: FlTitlesData(
            show: true,
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                getTitlesWidget: bottomTitleWidgets,
                interval: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BarGraphs extends StatelessWidget {
  const BarGraphs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                makeTransactionsIcon(),
              ],
            ),
            const SizedBox(
              height: 38,
            ),
            Expanded(
              child: BarChart(
                BarChartData(
                  maxY: 20,
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      tooltipBgColor: Colors.grey,
                      getTooltipItem: (_a, _b, _c, _d) => null,
                    ),
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: bottomTitles,
                        reservedSize: 42,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                        reservedSize: 28,
                        interval: 1,
                        getTitlesWidget: leftTitles,
                      ),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  barGroups: showingBarGroups,
                  gridData: FlGridData(show: false),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget makeTransactionsIcon() {
  const width = 4.5;
  const space = 3.5;
  return Row(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Container(
        width: width,
        height: 10,
        color: Colors.white.withOpacity(0.4),
      ),
      const SizedBox(
        width: space,
      ),
      Container(
        width: width,
        height: 28,
        color: Colors.white.withOpacity(0.8),
      ),
      const SizedBox(
        width: space,
      ),
      Container(
        width: width,
        height: 42,
        color: Colors.white.withOpacity(1),
      ),
      const SizedBox(
        width: space,
      ),
      Container(
        width: width,
        height: 28,
        color: Colors.white.withOpacity(0.8),
      ),
      const SizedBox(
        width: space,
      ),
      Container(
        width: width,
        height: 10,
        color: Colors.white.withOpacity(0.4),
      ),
    ],
  );
}

Widget leftTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Color(0xff7589a2),
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  String text;
  if (value == 0) {
    text = '1K';
  } else if (value == 10) {
    text = '5K';
  } else if (value == 19) {
    text = '10K';
  } else {
    return Container();
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 0,
    child: Text(text, style: style),
  );
}

BarChartGroupData makeGroupData(int x, double y1, double y2) {
  return BarChartGroupData(barsSpace: 4, x: x, barRods: [
    BarChartRodData(
      toY: y1,
      color: leftBarColor,
      width: width,
    ),
    BarChartRodData(
      toY: y2,
      color: rightBarColor,
      width: width,
    ),
  ]);
}

Widget bottomTitles(double value, TitleMeta meta) {
  List<String> titles = ["O+", "O-", "AB+", "AB-", "A+", "A-", "B+"];

  Widget text = Text(
    titles[value.toInt()],
    style: const TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
  );

  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 16, //margin top
    child: text,
  );
}

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  Widget text;
  switch (value.toInt()) {
    case 1:
      text = const Text('Jan', style: textStyle);
      break;
    case 2:
      text = const Text('Feb', style: textStyle);
      break;
    case 3:
      text = const Text('Mar', style: textStyle);
      break;
    case 4:
      text = const Text('Apr', style: textStyle);
      break;
    case 5:
      text = const Text('May', style: textStyle);
      break;
    default:
      text = const Text('', style: textStyle);
      break;
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 8.0,
    child: text,
  );
}

// CARD TITLE
Widget cardTitle(String text) {
  return Row(
    children: [
      SvgPicture.asset(
        'assets/icons/title_head.svg',
        height: cardTitleHeight + 10,
      ),
      const SizedBox(
        width: 10,
      ),
      Text(
        text,
        style: titleStyle,
      ),
    ],
  );
}

// Circular Image
Widget circularImage() {
  return const CircleAvatar(
    backgroundColor: Colors.white,
    maxRadius: 40,
    child: CircleAvatar(
      radius: 38,
      backgroundColor: Colors.yellow,
      backgroundImage:
          NetworkImage("https://www.woolha.com/media/2020/03/eevee.png"),
    ),
  );
}

// List Card Widget

class DonorCard extends StatefulWidget {
  final Icon icon;
  final String name;
  final String age;
  final String sex;
  final String blood;

  const DonorCard(
      {Key? key,
      required this.icon,
      required this.name,
      required this.age,
      required this.sex,
      required this.blood})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => DonorCardView();
}

class DonorCardView extends State<DonorCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: offWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.all(10),
      elevation: 10,
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.person,
                        color: darkGreen_,
                        size: 100,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Name: ${widget.name}",
                          style: donorCardText,
                        ),
                        Text(
                          "Sex: ${widget.sex}",
                          style: donorCardText,
                        ),
                        Text(
                          "Age: ${widget.age}",
                          style: donorCardText,
                        ),
                        Text(
                          "Blood Group: ${widget.blood}",
                          style: donorCardText,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListCard extends StatefulWidget {
  final String title;
  final Widget content;

  const ListCard({Key? key, required this.title, required this.content})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => ListCardView();
}

class ListCardView extends State<ListCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.all(10),
      elevation: 15,
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Column(
              children: [
                cardTitle(widget.title),
                widget.content,
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget mapsCard(
    BuildContext context, SwipeableCardSectionController controller) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    elevation: 2.0,
    color: Colors.white,
    child: Container(
      padding: const EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height * 0.45,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              cardTitle('Request for Donor'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name',
                            style: smallMapsText,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Ashish Bhosle',
                                style: largeMapsText,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Blood Group',
                            style: smallMapsText,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'A+',
                                style: largeMapsText,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Gender/Age',
                            style: smallMapsText,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Male/ 35',
                                style: largeMapsText,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Contact No.',
                            style: smallMapsText,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                '+91 9619065372',
                                style: largeMapsText,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Text('data')
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: TextButton(
                    style: greenFill,
                    onPressed: () {
                      requestCall('9619065372');
                    },
                    // onPressed: () async {
                    //   var uri = Uri.parse('tel:9619065372');
                    //   if (await canLaunchUrl(uri)) {
                    //     await launchUrl(uri);
                    //   } else {
                    //     throw "Unable to call 9619065372";
                    //   }
                    // }, //Function
                    child: Text(
                      'Request',
                      style: boldWhite,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: TextButton(
                    style: outlineRed,
                    onPressed: () {
                      controller.triggerSwipeRight();
                    },
                    child: Text(
                      'Cancel',
                      style: boldRed,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

class SettingsList extends StatelessWidget {
  final List childCard;
  final BuildContext context_;

  const SettingsList(
      {Key? key, required this.childCard, required this.context_})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Card(
        elevation: 3.0,
        shadowColor: Colors.grey[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
            children: childCard
                .map((e) => ListTile(
                      title: Text(
                        e.toString(),
                        style: settingsText,
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        onItemClick(context_, e.toString());
                      },
                    ))
                .toList()),
      ),
    );
  }
}

void onItemClick(BuildContext context, String title) {
  if (title == "Profile") {
    context.tabsRouter.setActiveIndex(3);
  } else if (title == "Location") {
    context.tabsRouter.setActiveIndex(1);
  } else if (title == "My History") {
    context.router.push(MyHistoryRoute());
  } else if (title == "Personal Details") {
    context.router.push(PersonalDetailsRoute());
  } else if (title == "Donor Cards") {
    // context.tabsRouter.setActiveIndex(0);
    context.router.push(AddPeopleRoute());
  }
  // switch (title) {
  //   case "Profile":
  //     // return context.router.push(ProfileRouter());
  //     print(context.tabsRouter.activeIndex);
  //     return () => context.tabsRouter.setActiveIndex(3);

  //   case "My History":
  //     return context.router.push(MyHistoryRoute());
  //   case "Personal Details":
  //     // return Navigator.push(
  //     //     context, MaterialPageRoute(builder: (context) => myHistoryPage()));
  //     print(context.routeData.toString());

  //     return context.router.push(PersonalDetailsRoute());

  //   case "Donor Cards":
  //     // return Navigator.push(
  //     //     context, MaterialPageRoute(builder: (context) => AddPeople()));
  //     print(AddPeopleRoute().path);

  //     return context.router.push(AddPeopleRoute());
  //   // return Navigator.push(
  //   //     context, MaterialPageRoute(builder: (context) => LoginPage()));

  //   default:
  //     return Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => LoginPage()));
  // }
}

// Responsive Widget

class ResopnsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget landscape;

  const ResopnsiveWidget(
      {Key? key, required this.mobile, required this.landscape})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 768) {
        return mobile;
      } else {
        return landscape;
      }

      // return mobile;
    });
  }
}
