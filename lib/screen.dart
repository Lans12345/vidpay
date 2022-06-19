import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:vidpay/home.dart';

class LoadingScreen extends StatefulWidget {
  String tech;
  String fashion;
  String automotive;
  String sports;
  String food;
  String gender;
  String name;
  String num;
  String pass;

  LoadingScreen(
      {@required this.tech,
      @required this.fashion,
      @required this.automotive,
      @required this.sports,
      @required this.food,
      @required this.gender,
      @required this.name,
      @required this.num,
      @required this.pass});

  @override
  _LoadingScreenState createState() => _LoadingScreenState(
        tech,
        fashion,
        automotive,
        sports,
        food,
        gender,
        name,
        num,
        pass,
      );
}

class _LoadingScreenState extends State<LoadingScreen> {
  String tech;
  String fashion;
  String automotive;
  String sports;
  String food;
  String gender;
  String name;
  String num;
  String pass;

  _LoadingScreenState(this.tech, this.fashion, this.automotive, this.sports,
      this.food, this.gender, this.name, this.num, this.pass);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 2), () {
      
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Image(
                height: 250,
                image: AssetImage('lib/images/logo1.png'),
              ),
              SizedBox(height: 15),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
              ),
            ]),
      ),
    );
  }
}
