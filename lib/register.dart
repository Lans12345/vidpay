import 'package:flutter/material.dart';
import 'package:vidpay/gender.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  const Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  bool _sec = true;
  String pass = '';
  String confirmPass = '';
  String passwordError = '';
  String nameError = '';
  String numError = '';
  String name = '';
  String num = '';

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
                  const SizedBox(height: 40),
                  const Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Image(
                      height: 200,
                      image: AssetImage('lib/images/logo1.png'),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isNotEmpty) {
                          return null;
                        } else {
                          return 'Enter username';
                        }
                      },
                      onChanged: (myName) {
                        name = myName;
                      },
                      decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.account_circle),
                          labelText: 'Username',
                          labelStyle: TextStyle(
                            fontFamily: 'Quicksand',
                            color: Colors.grey,
                            fontSize: 12.0,
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isNotEmpty) {
                          return null;
                        } else {
                          return 'Enter phone number';
                        }
                      },
                      onChanged: (myNum) {
                        num = myNum;
                      },
                      decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.phone),
                          labelText: 'Phone number',
                          labelStyle: TextStyle(
                            fontFamily: 'Quicksand',
                            color: Colors.grey,
                            fontSize: 12.0,
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey))),
                      maxLength: 11,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isNotEmpty) {
                          return null;
                        } else if (_sec != _sec) {
                          return 'INVALID PASSWORD';
                        } else {
                          return 'Enter password';
                        }
                      },
                      onChanged: (myPass) {
                        pass = myPass;
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
                          errorText: passwordError,
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isNotEmpty) {
                          return null;
                        } else if (_sec != _sec) {
                          return 'INVALID PASSWORD';
                        } else {
                          return 'Enter password';
                        }
                      },
                      onChanged: (conPass) {
                        confirmPass = conPass;
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
                          errorText: passwordError,
                          labelText: 'Confirm Password',
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                    child: RaisedButton(
                      color: Colors.lightBlue,
                      onPressed: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setString('username', name);
                        prefs.setString('number', num);
                        prefs.setString('password', pass);

                        if (!_formKey.currentState.validate()) {
                          return;
                        }
                        if (pass != confirmPass || name == '' || num == '') {
                          String msg = 'INVALID';
                          passwordError = msg;
                          nameError = msg;
                          numError = msg;
                        } else {
                          passwordError = '';
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Gender()));
                        }
                      },
                      child: const Text(
                        'Sign Up',
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: RaisedButton(
                      color: Colors.lightGreen,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Go back',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
