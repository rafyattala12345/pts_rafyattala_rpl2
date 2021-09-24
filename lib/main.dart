import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pts_rafyattala_rpl2/home.dart';
import 'package:pts_rafyattala_rpl2/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Home(),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 20),
                  Image.asset('images/asset1', height: 250),
                  Text(
                    'Football',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'All About Football',
                    textAlign: TextAlign.center,
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

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.ralewayTextTheme(
            Theme.of(context).textTheme,
          ),
          appBarTheme: AppBarTheme(
              textTheme: TextTheme(
                  headline6: GoogleFonts.raleway(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600))),
        ),
        home: LandingPage());
  }
}
