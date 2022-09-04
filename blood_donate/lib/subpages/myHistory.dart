import 'package:blood_donate/AppTheme/styles.dart';
import 'package:flutter/material.dart';
import 'package:blood_donate/app_widgets.dart';
import 'package:flutter_switch/flutter_switch.dart';

bool values_ = true;

class myHistoryPage extends StatefulWidget {
  myHistoryPage({Key? key}) : super(key: key);

  @override
  State<myHistoryPage> createState() => _myHistoryPageState();
}

class _myHistoryPageState extends State<myHistoryPage> {
  bool switch_bool = false;
  Color donatedBoxColor = darkGreen_;
  TextStyle donatedTextColor = myHistoryDonatedTextLite;

  Color requestedBoxColor = offWhite;
  TextStyle requestedTextColor = myHistoryDonatedTextDark;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/backgrounds/history_background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: ResopnsiveWidget(
              landscape: Text("This is landscape"),
              mobile: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            size: 30,
                            color: offWhite,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'My History',
                        overflow: TextOverflow.ellipsis,
                        textWidthBasis: TextWidthBasis.longestLine,
                        softWrap: true,
                        textDirection: TextDirection.ltr,
                        style: appBarTitleText,
                      ),
                    ),
                  ),

                  // Expanded(child: toggleHistoryWidget)
                  // const toggleHistoryWidget(),

                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Ink(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            if (values_) {
                              values_ = false;
                            } else {
                              values_ = true;
                            }
                            print(values_);
                          });
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.06,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: AnimatedContainer(
                                  curve: Curves.easeIn,
                                  duration: Duration(milliseconds: 300),
                                  alignment: Alignment.center,
                                  height: double.maxFinite,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: values_
                                        ? donatedBoxColor
                                        : requestedBoxColor,
                                  ),
                                  child: Text(
                                    "Donated",
                                    style: values_
                                        ? myHistoryDonatedTextLite
                                        : myHistoryDonatedTextDark,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: AnimatedContainer(
                                  curve: Curves.easeIn,
                                  duration: Duration(milliseconds: 200),
                                  alignment: Alignment.center,
                                  height: double.maxFinite,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: values_
                                        ? requestedBoxColor
                                        : donatedBoxColor,
                                  ),
                                  child: Text(
                                    "Requested",
                                    style: values_
                                        ? myHistoryDonatedTextDark
                                        : myHistoryDonatedTextLite,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        Visibility(
                          maintainAnimation: true,
                          maintainState: true,
                          maintainSize: true,
                          visible: values_,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                DonorCard(
                                  icon: Icon(
                                    Icons.person,
                                    color: darkGreen,
                                    size: 30,
                                  ),
                                  name: "Shubham Pednekar",
                                  age: 35.toString(),
                                  sex: "Male",
                                  blood: "A+",
                                ),
                                DonorCard(
                                  icon: Icon(
                                    Icons.person,
                                    color: darkGreen,
                                    size: 30,
                                  ),
                                  name: "Shubham Pednekar",
                                  age: 35.toString(),
                                  sex: "Male",
                                  blood: "A+",
                                ),
                                DonorCard(
                                  icon: Icon(
                                    Icons.person,
                                    color: darkGreen,
                                    size: 30,
                                  ),
                                  name: "Shubham Pednekar",
                                  age: 35.toString(),
                                  sex: "Male",
                                  blood: "A+",
                                ),
                                DonorCard(
                                  icon: Icon(
                                    Icons.person,
                                    color: darkGreen,
                                    size: 30,
                                  ),
                                  name: "Prasad Bhale",
                                  age: 35.toString(),
                                  sex: "Male",
                                  blood: "A+",
                                ),
                                DonorCard(
                                  icon: Icon(
                                    Icons.person,
                                    color: darkGreen,
                                    size: 30,
                                  ),
                                  name: "Shubham Pednekar",
                                  age: 35.toString(),
                                  sex: "Male",
                                  blood: "A+",
                                ),
                                DonorCard(
                                  icon: Icon(
                                    Icons.person,
                                    color: darkGreen,
                                    size: 30,
                                  ),
                                  name: "Prasad Bhale",
                                  age: 35.toString(),
                                  sex: "Male",
                                  blood: "A+",
                                ),
                              ],
                            ),
                          ),
                        ),
                        Visibility(
                          maintainAnimation: true,
                          maintainState: true,
                          maintainSize: true,
                          visible: !values_,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                DonorCard(
                                  icon: Icon(
                                    Icons.person,
                                    color: darkGreen,
                                    size: 30,
                                  ),
                                  name: "REQ Pednekar",
                                  age: 35.toString(),
                                  sex: "Male",
                                  blood: "A+",
                                ),
                                DonorCard(
                                  icon: Icon(
                                    Icons.person,
                                    color: darkGreen,
                                    size: 30,
                                  ),
                                  name: "REQ Pednekar",
                                  age: 35.toString(),
                                  sex: "Male",
                                  blood: "A+",
                                ),
                                DonorCard(
                                  icon: Icon(
                                    Icons.person,
                                    color: darkGreen,
                                    size: 30,
                                  ),
                                  name: "REQ Pednekar",
                                  age: 35.toString(),
                                  sex: "Male",
                                  blood: "A+",
                                ),
                                DonorCard(
                                  icon: Icon(
                                    Icons.person,
                                    color: darkGreen,
                                    size: 30,
                                  ),
                                  name: "REQ Pednekar",
                                  age: 35.toString(),
                                  sex: "Male",
                                  blood: "A+",
                                ),
                                DonorCard(
                                  icon: Icon(
                                    Icons.person,
                                    color: darkGreen,
                                    size: 30,
                                  ),
                                  name: "REQ Pednekar",
                                  age: 35.toString(),
                                  sex: "Male",
                                  blood: "A+",
                                ),
                                DonorCard(
                                  icon: Icon(
                                    Icons.person,
                                    color: darkGreen,
                                    size: 30,
                                  ),
                                  name: "REQ Pednekar",
                                  age: 35.toString(),
                                  sex: "Male",
                                  blood: "A+",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
