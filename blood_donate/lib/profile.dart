import 'package:auto_size_text/auto_size_text.dart';
import 'package:blood_donate/AppTheme/styles.dart';
import 'package:blood_donate/app_functions.dart';
import 'package:blood_donate/main/page_router.gr.dart';
import 'package:flutter/material.dart';
import 'app_widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  XFile? _imgXFile;
  final ImagePicker imagePicker = ImagePicker();

  getImageFromGalary() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imgXFile = pickedFile;
    });
  }

  getImageFromCamera() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _imgXFile = pickedFile;
    });
  }

  Widget bottomSheet(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Choose Profile Photo",
            style: TextStyle(fontSize: 20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton.icon(
                onPressed: () {
                  getImageFromCamera();
                },
                icon: const Icon(
                  Icons.camera,
                  color: Colors.black,
                ),
                label:
                    const Text("Camera", style: TextStyle(color: Colors.black)),
              ),
              TextButton.icon(
                onPressed: () {
                  getImageFromGalary();
                },
                icon: const Icon(
                  Icons.photo,
                  color: Colors.black,
                ),
                label: const Text(
                  "Galary",
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

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
            mobile: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.arrow_back,
                                  size: 30,
                                  color: offWhite,
                                ),
                                onPressed: () {
                                  Navigator.of(context).popAndPushNamed(
                                      const HomePageRouter().path);
                                },
                              ),
                              const IconButton(
                                icon: Icon(
                                  Icons.share,
                                  size: 30,
                                  color: offWhite,
                                ),
                                onPressed: shareFile,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Stack(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                maxRadius: 70,
                                child: CircleAvatar(
                                  radius: 65,
                                  backgroundColor: Colors.yellow,
                                  backgroundImage: _imgXFile == null
                                      ? NetworkImage(
                                          "https://www.woolha.com/media/2020/03/eevee.png")
                                      : FileImage(File(_imgXFile!.path))
                                          as ImageProvider,
                                ),
                              ),
                              Positioned(
                                bottom: 1,
                                right: 1,
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  child: FittedBox(
                                    child: FloatingActionButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: ((Builder) =>
                                              bottomSheet(context)),
                                        );
                                      },
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
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.4,
                    color: Colors.transparent,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Expanded(
                          child: Container(
                            color: offWhite,
                            padding: const EdgeInsets.fromLTRB(0, 70, 0, 10),
                            child: const SettingsList(
                              childCard: [
                                "Personal Details",
                                "Donor Cards",
                                "My History",
                                "Logout",
                              ],
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(0, -60),
                          child: Container(
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.height * 0.15,
                            width: MediaQuery.of(context).size.width * 0.95,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              color: Colors.white,
                              elevation: 1.0,
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                                    Container(
                                      width: 2,
                                      decoration: BoxDecoration(
                                        color: darkGreen,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        AutoSizeText(
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
                      ],
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

mixin _MainScreenState on StatelessWidget {
  static Future<bool> onWillPop() {
    return Future.value(false);
  }
}
