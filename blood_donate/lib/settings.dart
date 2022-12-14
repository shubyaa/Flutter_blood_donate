import 'package:auto_route/auto_route.dart';
import 'package:blood_donate/AppTheme/styles.dart';
import 'package:blood_donate/main/page_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_widgets.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double appbarHeight = MediaQuery.of(context).size.height * 0.25;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/backgrounds/settings_background.png"),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          left: false,
          right: false,
          child: ResopnsiveWidget(
            landscape: Container(
              alignment: Alignment.center,
              color: Colors.red,
            ),
            mobile: Padding(
              padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          // Navigator.of(context).pushReplacement(HomeRouter())
                          // var _context = AutoRouter.of(context);
                          // AutoRouter.of(context).pop();
                          context.router.popUntilRoot();
                        },
                        icon: const Icon(Icons.arrow_back),
                        color: Colors.white,
                        iconSize: 30.0,
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'Settings',
                        overflow: TextOverflow.ellipsis,
                        textWidthBasis: TextWidthBasis.longestLine,
                        softWrap: true,
                        textDirection: TextDirection.ltr,
                        style: appBarTitleText,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: offWhite),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                'Account',
                                style: settingsTextTitle,
                              ),
                            ),
                            SettingsList(
                              childCard: [
                                "Profile",
                                "Personal Details",
                                "Location"
                              ],
                              context_: context,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text('Network', style: settingsTextTitle),
                            ),
                            SettingsList(
                              childCard: ["Use when Wi-Fi", "Navigation"],
                              context_: context,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                'Security',
                                style: settingsTextTitle,
                              ),
                            ),
                            SettingsList(
                              childCard: ["Availability"],
                              context_: context,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                'Logout',
                                style: settingsTextTitle,
                              ),
                            ),
                            SettingsList(
                              childCard: ["Logout"],
                              context_: context,
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
      ),
    );
  }
}
