import 'dart:async';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:vidpay/drawer.dart';
import 'package:vidpay/gcash.dart';
import 'package:vidpay/main.dart';
import 'package:vidpay/screen.dart';
import 'package:video_player/video_player.dart';
import 'dart:math' show Random;
import 'package:vidpay/vidpay.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:neumorphic_container/neumorphic_container.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

double coins;
String tech = '';
String fashion = '';
String automotive = '';
String sports = '';
String food = '';
String gender = '';
String name = '';
String num = '';
String pass = '';
double redeemedCoins;
double partialCoins;
String link;

List ads = [const Post1()];

int getIndex;
double toBeCollectedCoins;
int timesPlayed;
String sponsor;

getRandomIndex() async {
  var collection = FirebaseFirestore.instance.collection('Tools');
  var docSnapshot = await collection.doc('RandomIndex').get();
  if (docSnapshot.exists) {
    Map<String, dynamic> data = docSnapshot.data();
    var value = data['length'];

    return getIndex = value;
  }
}

showToast2() {
  return Fluttertoast.showToast(
      msg: 'No Internet Connection!',
      backgroundColor: Colors.amber,
      textColor: Colors.white,
      fontSize: 14.0,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_SHORT);
}

getCoinsToCollect() async {
  var collection = FirebaseFirestore.instance.collection('Tools');
  var docSnapshot = await collection.doc('coins').get();
  if (docSnapshot.exists) {
    Map<String, dynamic> data = docSnapshot.data();
    var value = data['coinsToBeCollected'];

    return toBeCollectedCoins = value;
  }
}

String randomNumber;

String getRandom() {
  int randomIndex = Random().nextInt(getIndex);

  if (randomIndex == 0) {
    randomIndex += 1;
    randomNumber = randomIndex.toString();
    return 'video' + randomNumber;
  } else {
    randomNumber = randomIndex.toString();
    return 'video' + randomNumber;
  }
}

getLink() async {
  var collection = FirebaseFirestore.instance.collection('VIDEOS');

  var docSnapshot = await collection.doc(getRandom()).get(); // Required
  if (docSnapshot.exists) {
    Map<String, dynamic> data = docSnapshot.data();
    var _link = data['id']; // video URL
    var _sponsor = data['sponsor'];

    link = _link;
    sponsor = _sponsor;
  }
}

getTimesPlayed() async {
  var collection = FirebaseFirestore.instance.collection('VIDEOS');
  var docSnapshot = await collection.doc(getRandom()).get(); // Required
  if (docSnapshot.exists) {
    Map<String, dynamic> data = docSnapshot.data();
    var _timesPlayed = data['timesPlayed'];

    timesPlayed = _timesPlayed;
  }
}

class HomePage extends StatefulWidget {
  String tech = '';
  String fashion = '';
  String automotive = '';
  String sports = '';
  String food = '';
  String gender = '';
  String name = '';
  String num = '';
  String pass = '';

  HomePage(
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
  _HomePageState createState() => _HomePageState(
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

class _HomePageState extends State<HomePage> {
  String tech;
  String fashion;
  String automotive;
  String sports;
  String food;
  String gender;
  String name;
  String num;
  String pass;
  double totalCoins;
  _HomePageState(this.tech, this.fashion, this.automotive, this.sports,
      this.food, this.gender, this.name, this.num, this.pass);

  String toStringAsFixed(int fractionDigits);

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      if (partialCoins != 0) {
        prefs.getDouble('partialCoins');
      }
      name = prefs.getString('username');
      coins = prefs.getDouble('partialCoins');

      partialCoins = coins;
      redeemedCoins = prefs.getDouble('redeemedCoins');
    });
  }

  bool box1 = false;
  bool box2 = false;
  bool box3 = false;

  Map data = {};

  final controller = PageController(initialPage: 0);

  int _value = 1;

  // List of Ad Videos

  @override
  Widget build(BuildContext context) {
    int randomIndex = Random().nextInt(ads.length);
    name ??= 'My Account';
    partialCoins ??= 0;
    redeemedCoins ??= 1;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          actions: [
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => VidPay()));
              },
              child: const Image(
                height: 20,
                width: 25,
                image: AssetImage('lib/images/about.png'),
              ),
            ),
            const SizedBox(width: 20),
          ],
          iconTheme: const IconThemeData(color: Colors.black),
          title: InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => VidPay()));
            },
            child: const Padding(
              padding: EdgeInsets.only(top: 30),
              child: Text(
                'VIDPAY',
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          centerTitle: true,
          bottom: const TabBar(
            labelColor: Colors.black,
            labelStyle: TextStyle(
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
            ),
            tabs: [
              Tab(
                text: 'Watch',
                icon: Image(
                  height: 30,
                  image: AssetImage('lib/images/watch.png'),
                ),
              ),
              Tab(
                text: 'Earnings',
                icon: Image(
                  height: 30,
                  image: AssetImage('lib/images/earn.png'),
                ),
              )
            ],
          ),
        ),
        drawer: const NavigationDrawer(),
        body: TabBarView(children: [
          Center(
            child: PageView(
              controller: controller,
              scrollDirection: Axis.vertical,
              children: [
                ads[randomIndex],
              ],
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Remainders before redeeming:",
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0)),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: DropdownButton(
                        isExpanded: true,
                        value: _value,
                        items: [
                          DropdownMenuItem(
                            child: Center(
                                child: Row(children: const [
                              Icon(Icons.check_circle),
                              SizedBox(width: 30),
                              Text("GCASH account is needed",
                                  style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontWeight: FontWeight.bold,
                                  ))
                            ])),
                            value: 1,
                          ),
                          DropdownMenuItem(
                            child: Center(
                                child: Row(children: const [
                              Icon(Icons.check_circle),
                              SizedBox(width: 30),
                              Text("1 COIN = 1 PESO",
                                  style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontWeight: FontWeight.bold,
                                  ))
                            ])),
                            value: 2,
                          ),
                          DropdownMenuItem(
                            child: Center(
                                child: Row(children: const [
                              Icon(Icons.check_circle),
                              SizedBox(width: 30),
                              Text("3,000 coins and above to continue",
                                  style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontWeight: FontWeight.bold,
                                  ))
                            ])),
                            value: 3,
                          ),
                          DropdownMenuItem(
                            child: Center(
                                child: Row(children: const [
                              Icon(Icons.check_circle),
                              SizedBox(width: 30),
                              Text("Transaction will take 3-14 days",
                                  style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontWeight: FontWeight.bold,
                                  ))
                            ])),
                            value: 4,
                          ),
                          DropdownMenuItem(
                            child: Center(
                                child: Row(children: const [
                              Icon(Icons.check_circle),
                              SizedBox(width: 30),
                              Text("Coins will be DEDUCTED BY 20%",
                                  style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontWeight: FontWeight.bold,
                                  ))
                            ])),
                            value: 5,
                          ),
                        ],
                        onChanged: (int value) {
                          setState(() {
                            _value = 1;
                          });
                        },
                        hint: const Text("Remainders before Redeeming")),
                  ),
                  const SizedBox(height: 10),
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
                              'Total Coins',
                              style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 30),
                            Center(
                              child: Text(
                                partialCoins.toStringAsFixed(2) + ' coins',
                                style: const TextStyle(
                                  fontFamily: 'Quicksand',
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber,
                                ),
                              ),
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
                              'Recently Redeemed Coins',
                              style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 30),
                            Center(
                              child: Text(
                                redeemedCoins.toString() + ' coins',
                                style: const TextStyle(
                                  fontFamily: 'Quicksand',
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber,
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  Padding(
                    padding: const EdgeInsets.only(right: 80, left: 80),
                    child: NeumorphicButton(
                      onPressed: () async {
                        bool result =
                            await InternetConnectionChecker().hasConnection;

                        if (result == true) {
                          if (partialCoins > 2999) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => GCash(coins: coins)));
                          } else {
                            AwesomeDialog(
                              closeIcon: Icon(Icons.close, color: Colors.white),
                              btnOkColor: Colors.blue,
                              context: context,
                              dialogType: DialogType.ERROR,
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2),
                              buttonsBorderRadius:
                                  BorderRadius.all(Radius.circular(2)),
                              headerAnimationLoop: false,
                              animType: AnimType.BOTTOMSLIDE,
                              title: 'Cannot Procceed!',
                              desc: 'Insufficient coins',
                              showCloseIcon: true,
                              btnOkOnPress: () {},
                            ).show();
                          }
                        } else if (result == false) {
                          showToast2();
                        }
                      },
                      style: NeumorphicStyle(
                          shape: NeumorphicShape.convex,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(8)),
                          color: Color(0xfff0f0f0)),
                      padding: const EdgeInsets.all(12.0),
                      child: const Center(
                        child: Text(
                          'Redeem coins',
                          style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.bold,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

// New Ad
class Post1 extends StatefulWidget {
  const Post1({Key key}) : super(key: key);

  @override
  _Post1State createState() => _Post1State();
}

class _Post1State extends State<Post1> {
  // Required

  int duration = 16;
  FlickManager flickManager;
  bool isVisible = false;
  Timer timer;

  String videoUrl;
  String firebaseCollection;

  int getIndex;

  YoutubePlayerController _controller;

  showToast() {
    return Fluttertoast.showToast(
        msg: 'Coins ready to be Collected!',
        backgroundColor: Colors.amber,
        textColor: Colors.white,
        fontSize: 14.0,
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_SHORT);
  }

  showToast1() {
    return Fluttertoast.showToast(
        msg: 'Click the Refresh Button if the Video doesnt load',
        backgroundColor: Colors.amber,
        textColor: Colors.white,
        fontSize: 14.0,
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_LONG);
  }

  @override
  void initState() {
    super.initState();
    getRandomIndex();

    getTimesPlayed();
    getCoinsToCollect();
    getLink();

    print(link);

    String videoId;
    videoId = YoutubePlayer.convertUrlToId('$link');

    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        loop: true,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
  }

  bool hide() {
    if (duration == 0) {
      showToast();
      return isVisible = !isVisible;
    } else {
      return isVisible = isVisible;
    }
  }

  @override
  Widget build(BuildContext context) {
    toBeCollectedCoins ??= 0.00;
    link ??= 'None';
    getIndex ??= 0;
    timesPlayed ??= 0;
    sponsor ??= '';

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 30),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Image(
                      height: 25,
                      image: AssetImage('lib/images/timer.png'),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      '$duration sec',
                      style: const TextStyle(
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 60),
                const Center(
                  child: Image(
                    height: 25,
                    image: AssetImage('lib/images/coins.png'),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      '$toBeCollectedCoins coins',
                      style: const TextStyle(
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Divider(
                height: 20,
                thickness: 2,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: YoutubePlayerBuilder(
                player: YoutubePlayer(
                  aspectRatio: 16 / 12,
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.amber,
                  progressColors: ProgressBarColors(
                    playedColor: Colors.amber,
                    handleColor: Colors.amberAccent,
                  ),
                  onReady: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    if (prefs.getInt('refresh') == 1) {
                      String username = prefs.getString('username');
                      AwesomeDialog(
                        closeIcon: Icon(Icons.close, color: Colors.white),
                        btnOkColor: Colors.blue,
                        dismissOnTouchOutside: false,
                        context: context,
                        dialogType: DialogType.SUCCES,
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                        buttonsBorderRadius:
                            BorderRadius.all(Radius.circular(2)),
                        headerAnimationLoop: false,
                        animType: AnimType.BOTTOMSLIDE,
                        title: 'WELCOME TO VIDPAY',
                        desc: 'Earn coins by watching videos',
                        showCloseIcon: true,
                        btnOkOnPress: () {
                          prefs.setInt('refresh', 0);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomePage()));
                        },
                      ).show();
                    }

                    showToast1();

                    _controller.play();

                    duration = 16;

                    timer = Timer.periodic(Duration(seconds: 1), (timer) {
                      if (duration > 0) {
                        if (mounted) {
                          setState(() {
                            duration--;
                          });
                        }
                      } else {
                        timer.cancel();
                      }
                    });
                  },
                ),
                builder: (context, player) => player,
              ),
            ),
            const SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: const Image(
                    height: 30,
                    image: AssetImage('lib/images/skip.png'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30, left: 30),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: const Image(
                    height: 20,
                    image: AssetImage('lib/images/refresh.png'),
                  ),
                ),
              ),
            ]),

            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Divider(
                thickness: 2,
              ),
            ), // VIDEO
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Center(
                child: Center(
                  child: Text(
                    _controller.value.metaData.title,
                    style: const TextStyle(
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),

      // Disable Enable
      floatingActionButton: Visibility(
        visible: hide(),
        child: IconButton(
          iconSize: 60,
          onPressed: () async {
            bool result = await InternetConnectionChecker().hasConnection;
            if (result == true) {
              Navigator.of(context).pop();
              showDialog(
                  barrierColor: Colors.white,
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) => AlertDialog(
                        content: const Text(
                          '    Coins Collected Succesfully!',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        backgroundColor: Colors.grey[200],
                        actions: [
                          Center(
                            child: RaisedButton(
                              onPressed: () async {
                                FirebaseFirestore.instance
                                    .collection('VIDEOS')
                                    .doc(getRandom())
                                    .update({'timesPlayed': 1 + timesPlayed});

                                coins ??= 0;

                                toBeCollectedCoins ??= 0;
                                partialCoins = coins + toBeCollectedCoins;

                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setDouble('partialCoins', partialCoins);
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => LoadingScreen(
                                        tech: tech,
                                        fashion: fashion,
                                        automotive: automotive,
                                        sports: sports,
                                        food: food,
                                        gender: gender,
                                        name: name,
                                        num: num,
                                        pass: pass)));
                              },
                              child: const Text('Continue',
                                  style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  )),
                              color: Colors.amber[700],
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                            ),
                          ),
                        ],
                      ));
            } else if (result == false) {
              showToast2();
            }
          },
          icon: const Image(
            height: 200,
            width: 200,
            image: AssetImage('lib/images/collectcoin.png'),
          ),
        ),
      ),
    );
  }
}
