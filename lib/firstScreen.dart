import 'dart:async';
import 'package:flutter/material.dart';
import 'package:vidpay/home.dart';
import 'package:vidpay/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setInt('refresh', 1);

      if (prefs.getInt('login') == 0) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Home()));
      } else if (prefs.getInt('login') == 1) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomePage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VIDPAY',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Image(
                      height: 300,
                      image: AssetImage('lib/images/logo1.png'),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
