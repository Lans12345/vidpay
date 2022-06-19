import 'dart:convert';
import 'package:mailer/mailer.dart';
import 'package:flutter/material.dart';
import 'package:vidpay/screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:mailer/smtp_server.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class GCash extends StatefulWidget {
  double coins;
  GCash({this.coins});
  @override
  _GCashState createState() => _GCashState(coins);
}

class _GCashState extends State<GCash> {
  final _formKey = GlobalKey<FormState>();
  double coins;
  String gcashNumber;
  double redeemedCoins;
  _GCashState(this.coins);
  String name;

  double partial;

  @override
  void initState() {
    getData();
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!mounted) return;
    setState(() {
      name = prefs.getString('username');
      partial = prefs.getDouble('partialCoins');
    });
  }

  sendMail() async {
    String username = 'olanalans12345@gmail.com';
    String password = '123moviestf';

    final smtpServer = gmail(username, password);
    final message = Message()
      ..from = Address(username)
      ..recipients.add('vidpay123@gmail.com')
//      ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
//      ..bccRecipients.add(Address('bccAddress@example.com'))
      ..subject = 'REDEEM'
      ..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html =
          "<h1>Username: $name --- GCASH: $gcashNumber --- Coins to Redeem: $redeemedCoins</h1>";

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print(e);
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('REDEEM',
            style: TextStyle(
              fontFamily: 'LuxuriousRoman',
              fontWeight: FontWeight.bold,
              wordSpacing: 2.0,
              color: Colors.white,
            )),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  const Image(
                    image: AssetImage('lib/images/gcash.png'),
                    height: 200,
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(75, 0, 75, 0),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isNotEmpty) {
                          return null;
                        } else {
                          return 'Enter gcash number';
                        }
                      },
                      onChanged: (myGCashNumber) {
                        gcashNumber = myGCashNumber;
                      },
                      decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.phone_android_rounded,
                              color: Colors.amber),
                          labelText: 'GCASH Number',
                          labelStyle: TextStyle(
                            fontFamily: 'LuxuriousRoman',
                            color: Colors.black,
                            fontSize: 12.0,
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey))),
                      maxLength: 11,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isNotEmpty) {
                          return null;
                        } else {
                          return 'Enter coins';
                        }
                      },
                      onChanged: (toRedeem) {
                        double redeem = double.parse(toRedeem);
                        redeemedCoins = redeem;
                      },
                      decoration: const InputDecoration(
                          suffixIcon: Icon(
                            Icons.attach_money_rounded,
                            color: Colors.amber,
                          ),
                          labelText: 'Number of Coins to Redeem',
                          labelStyle: TextStyle(
                            fontFamily: 'LuxuriousRoman',
                            color: Colors.black,
                            fontSize: 12.0,
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey))),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: RaisedButton(
                      color: Colors.amber[700],
                      onPressed: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();

                        prefs.setString('gcashNum', gcashNumber);
                        prefs.setDouble('redeemedCoins', redeemedCoins);

                        prefs.setDouble(
                            'partialCoins', partial - redeemedCoins);

                        if (!_formKey.currentState.validate()) {
                          return;
                        }
                        if (redeemedCoins < coins) {
                          AwesomeDialog(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2),
                            buttonsBorderRadius:
                                BorderRadius.all(Radius.circular(2)),
                            context: context,
                            dialogType: DialogType.SUCCES,
                            animType: AnimType.BOTTOMSLIDE,
                            title: 'REQUEST SENT SUCCESFULLY!',
                            desc: 'Wait for confirmation',
                            btnOkOnPress: () async {
                              sendMail();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => LoadingScreen()));
                            },
                          ).show();
                        } else {
                          AwesomeDialog(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2),
                            buttonsBorderRadius:
                                BorderRadius.all(Radius.circular(2)),
                            context: context,
                            dialogType: DialogType.ERROR,
                            animType: AnimType.BOTTOMSLIDE,
                            title: 'CANNOT PROCEED!',
                            desc: 'To be Redeemed Coins > Total Coins',
                            btnOkOnPress: () async {
                              sendMail();
                              Navigator.of(context).pop();
                            },
                          ).show();
                        }
                      },
                      child: const Text(
                        'Continue',
                        style: TextStyle(
                            fontFamily: 'LuxuriousRoman',
                            letterSpacing: 2.0,
                            color: Colors.white),
                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
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
