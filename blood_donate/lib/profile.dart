import 'package:blood_donate/AppTheme/styles.dart';
import 'package:blood_donate/app_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/backgrounds/home_background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: ResopnsiveWidget(
            landscape: Container(
              color: offWhite,
            ),
            mobile: Padding(
              padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
              child: SafeArea(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(
                          Icons.arrow_back,
                          size: IconSize,
                          color: offWhite,
                        ),
                        Icon(
                          Icons.group_add,
                          color: offWhite,
                          size: IconSize,
                        )
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          "People",
                          overflow: TextOverflow.ellipsis,
                          textWidthBasis: TextWidthBasis.longestLine,
                          softWrap: true,
                          textDirection: TextDirection.ltr,
                          style: appBarTitleText,
                        ),
                      ),
                    ),
                    Expanded(
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
                              name: "Chenna Reddy",
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
                              name: "Atharva Atoley",
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
                              name: "GBA",
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
            ),
          )),
    );
  }
}
