import 'package:blood_donate/AppTheme/styles.dart';
import 'package:blood_donate/app_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({Key? key}) : super(key: key);

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController ageController = new TextEditingController();
  final TextEditingController bloodGroupController =
      new TextEditingController();
  final TextEditingController addressController = new TextEditingController();
  final TextEditingController numberController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final nameField = TextFormField(
      style: TextStyle(color: Colors.white),
      autofocus: false,
      controller: nameController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("First Name Required");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter valid Name(Min. 3 Character)");
        }
      },
      onSaved: (value) {
        nameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.account_circle,
          color: Color.fromRGBO(139, 227, 216, 1.0),
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Name",
        hintStyle: const TextStyle(color: Colors.white, fontSize: 18.0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 2.0, color: Colors.white),
        ),
      ),
    );

    final emailField = TextFormField(
      obscureText: true,
      style: const TextStyle(color: Colors.white),
      autofocus: false,
      cursorColor: Colors.white,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.mail,
          color: Color.fromRGBO(139, 227, 216, 1.0),
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "E-mail",
        hintStyle: const TextStyle(color: Colors.white, fontSize: 18.0),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 2.0,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final ageField = TextFormField(
      style: TextStyle(color: Colors.white),
      autofocus: false,
      controller: ageController,
      keyboardType: TextInputType.number,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{1,}$');
        if (value!.isEmpty) {
          return ("Age Required");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter valid Age(Min. 1 Character)");
        }
      },
      onSaved: (value) {
        ageController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.man,
          color: Color.fromRGBO(139, 227, 216, 1.0),
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Age",
        hintStyle: const TextStyle(color: Colors.white, fontSize: 18.0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 2.0, color: Colors.white),
        ),
      ),
    );

    final bloodGroupField = TextFormField(
      style: TextStyle(color: Colors.white),
      autofocus: false,
      controller: bloodGroupController,
      keyboardType: TextInputType.text,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("Blood Group Required");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter valid Blood Group");
        }
      },
      onSaved: (value) {
        bloodGroupController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.medical_services,
          color: Color.fromRGBO(139, 227, 216, 1.0),
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Blood Group",
        hintStyle: const TextStyle(color: Colors.white, fontSize: 18.0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 2.0, color: Colors.white),
        ),
      ),
    );

    final addressField = TextFormField(
      style: TextStyle(color: Colors.white),
      autofocus: false,
      controller: addressController,
      keyboardType: TextInputType.streetAddress,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return (" Address Required");
        }
      },
      onSaved: (value) {
        addressController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.location_on,
          color: Color.fromRGBO(139, 227, 216, 1.0),
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Address",
        hintStyle: const TextStyle(color: Colors.white, fontSize: 18.0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 2.0, color: Colors.white),
        ),
      ),
    );

    final numberField = TextFormField(
      style: TextStyle(color: Colors.white),
      autofocus: false,
      controller: numberController,
      keyboardType: TextInputType.number,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{10,}$');
        if (value!.isEmpty) {
          return (" Phone Number Required");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter valid Number(Min. 10 Numbers)");
        }
      },
      onSaved: (value) {
        numberController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.phone,
          color: Color.fromRGBO(139, 227, 216, 1.0),
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Phone Number",
        hintStyle: const TextStyle(color: Colors.white, fontSize: 18.0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 2.0, color: Colors.white),
        ),
      ),
    );

    final ProceedButton = MaterialButton(
      // color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: const BorderSide(color: Colors.white, width: 2.0),
      ),
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
      minWidth: MediaQuery.of(context).size.width,
      onPressed: () {},
      child: const Text(
        "Proceed",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/backgrounds/personal_details_bg.png"),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: SafeArea(
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
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back),
                        color: Colors.white,
                        iconSize: 30.0,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Add a Donor \nCard',
                        style: appBarTitleText,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                          child: nameField,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                          child: emailField,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                          child: ageField,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                          child: bloodGroupField,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                          child: addressField,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                          child: numberField,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(35.0, 0, 35.0, 0),
                          child: ProceedButton,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
