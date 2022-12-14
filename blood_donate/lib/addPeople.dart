import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:blood_donate/AppTheme/styles.dart';
import 'package:blood_donate/app_widgets.dart';
import 'package:blood_donate/main/main_screen.dart';
import 'package:blood_donate/main/page_router.gr.dart';
import 'package:blood_donate/personal_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddPeople extends StatefulWidget {
  const AddPeople({
    Key? key,
  }) : super(key: key);
  @override
  State<AddPeople> createState() => _AddPeopleState();
}

class _AddPeopleState extends State<AddPeople> {
  int pageIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/backgrounds/home_background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          floatingActionButton: Container(
            width: 80,
            height: 80,
            child: FittedBox(
              child: FloatingActionButton(
                onPressed: () {
                  // AutoRouter.of(context).push(const PersonalDetailsRoute());
                  context.router.push(const PersonalDetailsRoute());
                },
                // shape: ,
                backgroundColor: darkGreen,
                child: const Icon(
                  Icons.add,
                  size: 30,
                  color: offWhite,
                ),
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          body: ResopnsiveWidget(
            landscape: Container(
              color: offWhite,
            ),
            mobile: Padding(
              padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
              child: SafeArea(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            size: IconSize,
                            color: offWhite,
                          ),
                          onPressed: () {
                            context.router.popUntilRoot();
                          },
                        ),
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
          ),
        ),
      ),
    );
  }
}
