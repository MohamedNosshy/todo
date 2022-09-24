import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:iti_project/shared/bloc_observer.dart';
import 'package:sizer/sizer.dart';
import 'modules/login_screen/login_screen.dart';
import 'modules/signup_screen/register_screen.dart';
import 'modules/welcome_screen/welcome.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color.fromRGBO(101, 131, 97, 1),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Color(0xfff2f9fe),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(100),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(100),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
        home: Logo_screen(),
        routes: {
          'login': (context) => LoginScreen(),
          'signup': (context) => RegisterScreen(),
          //'welcome': (context) => WelcomeScreen()
          // 'home' :(context) => Home(),
        },
      );}
    );
  }
}
