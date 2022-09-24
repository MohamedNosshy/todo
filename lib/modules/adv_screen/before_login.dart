/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../shared/componant/componant.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            Image(
              image: AssetImage("assets/12.png"),
              height: 400,
              width: 600,
            ),
            Text(
              "Get Things Done With TODo",
              maxLines: 1,
              style: GoogleFonts.playball(
                textStyle: Theme.of(context).textTheme.headline4,
                fontSize: 30,
                fontStyle: FontStyle.italic,
                color: Colors.blue.shade700,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Button(
              onPressed: () {
                Navigator.of(context).pushNamed('login');
              },
              textColor: Colors.white,
              bgColor: Colors.blue,
              text: "Login",
            ),
            SizedBox(
              height: 20,
            ),
            Button(
              onPressed: () {
                Navigator.of(context).pushNamed('signup');
              },
              textColor: Colors.white,
              bgColor: Colors.blue,
              text: "Create Account ",
            ),
          ],
        ),
      ),
    );
  }
}
*/