import 'package:flutter/material.dart';
import 'package:neumorphic_container/neumorphic_container.dart';
import 'package:vidpay/delete.dart';
import 'package:vidpay/post.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:vidpay/update.dart';

class VidPay extends StatefulWidget {
  const VidPay({Key key}) : super(key: key);

  @override
  _VidPayState createState() => _VidPayState();
}

class _VidPayState extends State<VidPay> {
  String deletePassword;
  String writePassword;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            'ABOUT VIDPAY',
            style: TextStyle(
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                color: Colors.black),
          ),
          centerTitle: true,
          bottom: const TabBar(
              labelColor: Colors.black,
              labelStyle: TextStyle(
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0),
              tabs: [
                Tab(
                  text: 'RUN AD',
                  icon: Image(
                    height: 30,
                    image: AssetImage('lib/images/ad.png'),
                  ),
                ),
                Tab(
                  text: 'CONTACT',
                  icon: Image(
                    height: 30,
                    image: AssetImage('lib/images/contact.png'),
                  ),
                ),
              ]),
        ),
        body: TabBarView(children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Center(
                  child: NeumorphicContainer(
                    height: 150,
                    width: 250,
                    borderRadius: 10,
                    primaryColor: Color(0xfff0f0f0),
                    curvature: Curvature.convex,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          const Text(
                            'HOW TO RUN AD ON VIDPAY?',
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: Column(children: const [
                              Text(
                                'Prepare a Video Ad with:',
                                style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  fontSize: 14.0,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Duration: 12-16 seconds',
                                style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  fontSize: 14.0,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                'Aspect Ratio: 16:9 (Landscape)',
                                style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  fontSize: 14.0,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                'Quality: Highest Quality',
                                style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  fontSize: 14.0,
                                  color: Colors.black,
                                ),
                              ),
                            ]),
                          ),
                        ]),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: NeumorphicContainer(
                    height: 150,
                    width: 250,
                    borderRadius: 10,
                    primaryColor: Color(0xfff0f0f0),
                    curvature: Curvature.convex,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          const Text(
                            'HOW MUCH IT WILL COST?',
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 30),
                          Center(
                            child: Column(children: const [
                              Text(
                                '1 view = 0.25php',
                                style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  fontSize: 18.0,
                                  color: Colors.black,
                                ),
                              ),
                            ]),
                          ),
                        ]),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: NeumorphicContainer(
                    height: 150,
                    width: 250,
                    borderRadius: 10,
                    primaryColor: Color(0xfff0f0f0),
                    curvature: Curvature.convex,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          const Text(
                            'WHERE TO SEND MY AD VIDEO?',
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: Column(children: const [
                              Text(
                                'Send your ad video to our \n      email address with:',
                                style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  fontSize: 14.0,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Title and Description',
                                style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  fontSize: 18.0,
                                  color: Colors.black,
                                ),
                              ),
                            ]),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) => AlertDialog(
                              title: TextFormField(
                                obscureText: true,
                                decoration: const InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: Icon(Icons.man_rounded),
                                    ),
                                    labelText: 'Enter password',
                                    labelStyle: TextStyle(
                                      fontFamily: 'Quicksand',
                                      color: Colors.grey,
                                      fontSize: 12.0,
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey))),
                                onChanged: (_deletePassword) {
                                  deletePassword = _deletePassword;
                                },
                              ),
                              backgroundColor: Colors.grey[200],
                              actions: [
                                Center(
                                  child: RaisedButton(
                                    onPressed: () {
                                      if (deletePassword == 'lilx999') {
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (_) => Update()));
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
                  child: const Image(
                    height: 200,
                    image: AssetImage('lib/images/logo1.png'),
                  ),
                ),
                const SizedBox(height: 30),
                const Text('BUSINESS EMAIL ADDRESS',
                    style:
                        TextStyle(fontFamily: 'Quicksand', color: Colors.grey)),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) => AlertDialog(
                              title: TextFormField(
                                obscureText: true,
                                decoration: const InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: Icon(Icons.man_rounded),
                                    ),
                                    labelText: 'Enter password',
                                    labelStyle: TextStyle(
                                      fontFamily: 'Quicksand',
                                      color: Colors.grey,
                                      fontSize: 12.0,
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey))),
                                onChanged: (_deletePassword) {
                                  deletePassword = _deletePassword;
                                },
                              ),
                              backgroundColor: Colors.grey[200],
                              actions: [
                                Center(
                                  child: RaisedButton(
                                    onPressed: () {
                                      if (deletePassword == 'lilx999') {
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (_) => Delete()));
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
                  child: const Text('vidpay123@gmail.com',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                      )),
                ),
                const SizedBox(height: 30),
                const Text('CONTACT NUMBER',
                    style:
                        TextStyle(fontFamily: 'Quicksand', color: Colors.grey)),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) => AlertDialog(
                              title: TextFormField(
                                obscureText: true,
                                decoration: const InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: Icon(Icons.man_rounded),
                                    ),
                                    labelText: 'Enter password',
                                    labelStyle: TextStyle(
                                      fontFamily: 'Quicksand',
                                      color: Colors.grey,
                                      fontSize: 12.0,
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey))),
                                onChanged: (_deletePassword) {
                                  deletePassword = _deletePassword;
                                },
                              ),
                              backgroundColor: Colors.grey[200],
                              actions: [
                                Center(
                                  child: RaisedButton(
                                    onPressed: () {
                                      if (deletePassword == 'lilx999') {
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (_) => Post()));
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
                  child: const Text('09090104355',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                      )),
                ),
                const SizedBox(height: 50),
                const Center(
                    child: Text(
                  'Lance Tech 2022',
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 8.0,
                  ),
                ))
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
