import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vidpay/firstScreen.dart';
import 'dart:math';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:vidpay/main.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key key}) : super(key: key);

  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  String gender;
  String username;
  String number;
  double coins;
  double redeemdCoins;

  @override
  void initState() {
    super.initState();
    myGender();
  }

  myGender() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      gender = prefs.getString('gender');
      username = prefs.getString('username');
      number = prefs.getString('number');
      redeemdCoins = prefs.getDouble('redeemedCoins');
      coins = prefs.getDouble('partialCoins');
    });
  }

  Widget getGender() {
    if (gender == 'Male') {
      return const Image(
        height: 100,
        image: AssetImage('lib/images/male.png'),
      );
    } else {
      return const Image(
        height: 100,
        image: AssetImage('lib/images/female.png'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    redeemdCoins ??= 0.00;
    coins ??= 0.00;
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(200),
          bottomRight: Radius.circular(200),
        ),
      ),
      child: Column(children: [
        const SizedBox(
          height: 50,
        ),
        getGender(),
        const SizedBox(height: 10),
        const Text('Username',
            style: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 14.0,
                color: Colors.grey,
                fontWeight: FontWeight.bold)),
        Text(username,
            style: const TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 18.0,
                color: Colors.amber,
                fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        const Text('Gender',
            style: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 14.0,
                color: Colors.grey,
                fontWeight: FontWeight.bold)),
        Text(gender,
            style: const TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 18.0,
                color: Colors.amber,
                fontWeight: FontWeight.bold)),
        const SizedBox(
          height: 20,
        ),
        const Text('Mobile Number',
            style: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 14.0,
                color: Colors.grey,
                fontWeight: FontWeight.bold)),
        Text(number,
            style: const TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 18.0,
                color: Colors.amber,
                fontWeight: FontWeight.bold)),
        const SizedBox(
          height: 20,
        ),
        const Text('Coins',
            style: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 14.0,
                color: Colors.grey,
                fontWeight: FontWeight.bold)),
        Text(coins.toString() + ' coins',
            style: const TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 18.0,
                color: Colors.amber,
                fontWeight: FontWeight.bold)),
        const SizedBox(
          height: 20,
        ),
        const Text('Recently Redeemed Coins',
            style: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 14.0,
                color: Colors.grey,
                fontWeight: FontWeight.bold)),
        Text(redeemdCoins.toString() + ' coins',
            style: const TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 18.0,
                color: Colors.amber,
                fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
          child: RaisedButton(
            color: Colors.amber,
            onPressed: () {
              AwesomeDialog(
                borderSide: BorderSide(color: Colors.blue, width: 2),
                buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
                context: context,
                dialogType: DialogType.WARNING,
                animType: AnimType.BOTTOMSLIDE,
                title: 'Are you sure you want to Log out?',
                desc: '',
                btnCancelOnPress: () {
                  Navigator.of(context).pop();
                },
                btnOkOnPress: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setInt('login', 0);
                  prefs.setInt('refresh', 1);
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => FirstScreen()));
                },
              ).show();
            },
            child: const Text(
              'Log Out',
              style: TextStyle(
                  fontFamily: 'Quicksand',
                  letterSpacing: 2.0,
                  color: Colors.white),
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
            ),
          ),
        ),
        const SizedBox(
          height: 150,
        ),
        const Text('All Right Reserved.',
            style: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 8.0,
                color: Colors.grey,
                fontWeight: FontWeight.bold)),
      ]),
    );
  }
}
