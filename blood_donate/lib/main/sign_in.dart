import 'package:blood_donate/AppTheme/styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:blood_donate/app_widgets.dart';

final _auth = FirebaseAuth.instance;
final _formKey = GlobalKey<FormState>();

class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController confirmPasswordController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final nameField = TextFormField(
      key: _formKey,
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
          borderSide: const BorderSide(width: 2.0),
        ),
      ),
    );

    final emailField = TextFormField(
      key: _formKey,
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
          borderSide: const BorderSide(width: 2.0),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final passwordField = TextFormField(
      key: _formKey,
      style: const TextStyle(color: Colors.white),
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password Required");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter valid Password(Min. 6 Character)");
        }
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.lock,
          color: Color.fromRGBO(139, 227, 216, 1.0),
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        hintStyle: const TextStyle(color: Colors.white, fontSize: 18.0),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2.0),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final confirmPasswordField = TextFormField(
      autofocus: false,
      controller: confirmPasswordController,
      obscureText: true,
      validator: (value) {
        if (confirmPasswordController.text != passwordController.text) {
          return ("Passwords Don't Match");
        }
        return null;
      },
      onSaved: (value) {
        confirmPasswordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.lock,
            color: Color.fromRGBO(139, 227, 216, 1.0),
          ),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Confirm Password",
          hintStyle: const TextStyle(color: Colors.white, fontSize: 18.0),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2.0),
            borderRadius: BorderRadius.circular(10),
          )),
    );

    final RegisterButton = Material(
      elevation: 5,
      color: const Color.fromRGBO(139, 227, 216, 1.0),
      borderRadius: BorderRadius.circular(15),
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {},
        child: const Text(
          "Register",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/backgrounds/login_background.png"),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back),
                        color: Colors.white,
                        iconSize: 30.0,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: Align(
                      child: circularImage(),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(15.0, 0, 15.0, 20.0),
                            child: nameField,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(15.0, 0, 15.0, 20.0),
                            child: emailField,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(15.0, 0, 15.0, 20.0),
                            child: passwordField,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(15.0, 0, 15.0, 20.0),
                            child: confirmPasswordField,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(35.0, 0, 35.0, 20.0),
                            child: RegisterButton,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Image.asset("assets/backgrounds/Google.png"),
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
    );
  }
}

void signIn(String email, String password) async {
  if (_formKey.currentState!.validate()) {
    await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => {
              print("SignUp Successful"),

              // Navigate to login page
            })
        .catchError((e) {
      print(e.toString());
    });
  }
}
