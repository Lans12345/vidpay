import 'package:flutter/material.dart';
import 'package:vidpay/firstScreen.dart';
import 'package:vidpay/register.dart';
import 'package:vidpay/screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: FirstScreen()));
}

class Home extends StatefulWidget {
  String tech;
  String fashion;
  String automotive;
  String sports;
  String food;
  String gender;
  String name;
  String num;
  String pass;

  @override
  _HomeState createState() => _HomeState(
      tech, fashion, automotive, sports, food, gender, name, num, pass);
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();
  bool _sec = true;
  String tech;
  String fashion;
  String automotive;
  String sports;
  String food;
  String gender;
  String name;
  String num;
  String pass;
  String username;
  String userPassword;
  String confirmUserName;
  String confirmUserNumber;

  _HomeState(this.tech, this.fashion, this.automotive, this.sports, this.food,
      this.gender, this.name, this.num, this.pass);

  @override
  void initState() {
    getData();
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('username');
      pass = prefs.getString('password');
      num = prefs.getString('number');
    });
  }

  showToast() {
    return Fluttertoast.showToast(
        msg: 'No Internet Connection!',
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 14.0,
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_SHORT);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 100),
                  const Image(
                    height: 200,
                    image: AssetImage('lib/images/logo1.png'),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'ENTER USERNAME';
                        } else if (name == username && pass == userPassword) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoadingScreen()));
                        } else {
                          return 'INVALID';
                        }
                      },
                      onChanged: (myName) {
                        username = myName;
                      },
                      decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.account_circle),
                          labelText: 'User name',
                          labelStyle: TextStyle(
                            fontFamily: 'Quicksand',
                            color: Colors.grey,
                            fontSize: 12.0,
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey))),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'ENTER PASSWORD';
                        } else if (pass == userPassword && name == username) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoadingScreen()));
                        } else {
                          return 'INVALID';
                        }
                      },
                      onChanged: (password) {
                        userPassword = password;
                      },
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.remove_red_eye),
                            onPressed: () {
                              setState(() {
                                _sec = !_sec;
                              });
                            },
                          ),
                          labelText: 'Password',
                          labelStyle: const TextStyle(
                            fontFamily: 'Quicksand',
                            color: Colors.grey,
                            fontSize: 12.0,
                          ),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey))),
                      obscureText: _sec,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                    child: InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) => AlertDialog(
                                  title: TextFormField(
                                    decoration: const InputDecoration(
                                        suffixIcon: IconButton(
                                          icon: Icon(Icons.man_rounded),
                                        ),
                                        labelText: 'Enter your Username',
                                        labelStyle: TextStyle(
                                          fontFamily: 'Quicksand',
                                          color: Colors.grey,
                                          fontSize: 12.0,
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey))),
                                    onChanged: (userName) {
                                      confirmUserName = userName;
                                    },
                                  ),
                                  content: TextFormField(
                                    decoration: const InputDecoration(
                                        suffixIcon: IconButton(
                                          icon:
                                              Icon(Icons.phone_android_rounded),
                                        ),
                                        labelText: 'Enter your Mobile Number',
                                        labelStyle: TextStyle(
                                          fontFamily: 'Quicksand',
                                          color: Colors.grey,
                                          fontSize: 12.0,
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey))),
                                    onChanged: (mobileNum) {
                                      confirmUserNumber = mobileNum;
                                    },
                                    maxLength: 11,
                                    keyboardType: TextInputType.number,
                                  ),
                                  backgroundColor: Colors.grey[200],
                                  actions: [
                                    Center(
                                      child: RaisedButton(
                                        onPressed: () {
                                          if (name == confirmUserName &&
                                              num == confirmUserNumber) {
                                            AwesomeDialog(
                                              borderSide: BorderSide(
                                                  color: Colors.blue, width: 2),
                                              buttonsBorderRadius:
                                                  BorderRadius.all(
                                                      Radius.circular(2)),
                                              context: context,
                                              dialogType: DialogType.INFO,
                                              animType: AnimType.BOTTOMSLIDE,
                                              title: 'Password:',
                                              desc: '$pass',
                                              btnOkOnPress: () async {
                                                Navigator.of(context)
                                                    .pushReplacement(
                                                        MaterialPageRoute(
                                                            builder: (_) =>
                                                                Home()));
                                              },
                                            ).show();
                                          } else {
                                            AwesomeDialog(
                                              borderSide: BorderSide(
                                                  color: Colors.blue, width: 2),
                                              buttonsBorderRadius:
                                                  BorderRadius.all(
                                                      Radius.circular(2)),
                                              context: context,
                                              dialogType: DialogType.ERROR,
                                              animType: AnimType.BOTTOMSLIDE,
                                              title:
                                                  'Username and Number do not match!',
                                              desc: '',
                                              btnOkOnPress: () async {
                                                Navigator.of(context)
                                                    .pushReplacement(
                                                        MaterialPageRoute(
                                                            builder: (_) =>
                                                                Home()));
                                              },
                                            ).show();
                                          }
                                        },
                                        child: const Text('Continue',
                                            style: TextStyle(
                                              fontFamily: 'Quicksand',
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            )),
                                        color: Colors.amber[700],
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                      ),
                                    ),
                                  ],
                                ));
                      },
                      child: const Text(
                        'Forgot Password',
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.lightBlue,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: RaisedButton(
                      color: Colors.lightBlue,
                      onPressed: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setInt('login', 1);
                        prefs.setInt('refresh', 1);

                        bool result =
                            await InternetConnectionChecker().hasConnection;

                        if (result == true) {
                          if (!_formKey.currentState.validate()) {
                            return;
                          }
                          if (name == username && pass == userPassword) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => LoadingScreen()));
                          } else {
                            return null;
                          }
                        } else if (result == false) {
                          showToast();
                        }
                      },
                      child: const Text(
                        'Log in',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'New to Vidpay?',
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 12.0,
                        ),
                      ),
                      const SizedBox(width: 5),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Register()));
                        },
                        child: const Text(
                          'Register now',
                          style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlue,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 40),
                  const Center(
                      child: Text(
                    'Lance Tech 2022',
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 8.0,
                    ),
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
