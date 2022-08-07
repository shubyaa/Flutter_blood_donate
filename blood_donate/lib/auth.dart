import 'package:blood_donate/AppTheme/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color green = const Color.fromRGBO(0, 109, 95, 1);

    const String url = "https://www.woolha.com/media/2020/03/eevee.png";

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: green,
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: CircleAvatar(
                maxRadius: 100,
                backgroundColor: Color.fromRGBO(239, 252, 250, 1),
                child: CircleAvatar(
                  radius: 120,
                  backgroundColor: Colors.yellow,
                  backgroundImage: NetworkImage(url),
                ),
              ),
            ),
            const SizedBox(
              height: 200,
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    // Color.fromRGBO(239, 252, 250, 1),
                    Colors.black,
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: TextButton(
                style: outlineWhite,
                onPressed: () {},
                child: const Text(
                  "Register",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
