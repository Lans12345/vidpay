import 'package:flutter/material.dart';
import 'package:vidpay/category.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Gender extends StatefulWidget {
  String myGender = '';
  String name = '';
  String num = '';
  String pass = '';
  Gender({
    @required this.name,
    @required this.num,
    @required this.pass,
  });
  @override
  _GenderState createState() => _GenderState(name, num, pass);
}

class _GenderState extends State<Gender> {
  String myGender = '';
  String name = '';
  String num = '';
  String pass = '';

  _GenderState(this.name, this.num, this.pass);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 120),
            Material(
              borderRadius: BorderRadius.circular(30),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: InkWell(
                splashColor: Colors.grey,
                onTap: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();

                  myGender = 'Male';
                  prefs.setString('gender', myGender);
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Category()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Ink.image(
                          image: const AssetImage(
                            'lib/images/male.png',
                          ),
                          fit: BoxFit.cover,
                          height: 150,
                          width: 150,
                        ),
                        const SizedBox(height: 6),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50),
            Material(
              borderRadius: BorderRadius.circular(30),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: InkWell(
                splashColor: Colors.grey,
                onTap: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();

                  myGender = 'Female';
                  prefs.setString('gender', myGender);
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Category()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Ink.image(
                          image: const AssetImage(
                            'lib/images/female.png',
                          ),
                          fit: BoxFit.cover,
                          height: 150,
                          width: 150,
                        ),
                        const SizedBox(height: 6),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
