import 'package:blood_donate/AppTheme/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/backgrounds/profile_background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: ResopnsiveWidget(
            landscape: Text("This is landscape"),
            mobile: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.topCenter,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                  IconButton(
                                    icon: Icon(
                                      Icons.share,
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
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                              child: Stack(
                                children: [
                                  const CircleAvatar(
                                    backgroundColor: Colors.white,
                                    maxRadius: 100,
                                    child: CircleAvatar(
                                      radius: 95,
                                      backgroundColor: Colors.yellow,
                                      backgroundImage: NetworkImage(
                                          "https://www.woolha.com/media/2020/03/eevee.png"),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 1,
                                    right: 1,
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      child: FittedBox(
                                        child: FloatingActionButton(
                                          onPressed: () {},
                                          mini: true,
                                          backgroundColor: midGreen,
                                          child: Icon(Icons.add),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                "Shubham Pednekar",
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: usernameTitle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        color: offWhite,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 105, 20, 20),
                          child: SettingsList(
                            childCard: [
                              "Personal Details",
                              "Donor Cards",
                              "My History",
                              "Logout",
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.4,
                      right: 20.0,
                      left: 20.0,
                    ),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: Colors.white,
                        elevation: 1.0,
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("Donated", style: settingsText),
                                  Text(
                                    "12",
                                    style: number,
                                  ),
                                ],
                              ),
                              // VerticalDivider(
                              //   color: darkGreen,
                              //   thickness: 7,
                              // ),
                              Container(
                                width: 2,
                                decoration: BoxDecoration(
                                    color: darkGreen,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Reuested",
                                    style: settingsText,
                                  ),
                                  Text(
                                    "25",
                                    style: number,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
