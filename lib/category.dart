import 'package:flutter/material.dart';
import 'package:vidpay/drawer.dart';
import 'package:vidpay/firstScreen.dart';
import 'package:vidpay/main.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class Category extends StatefulWidget {
  String gender;
  String name;
  String num;
  String pass;
  Category(
      {@required this.gender,
      @required this.name,
      @required this.num,
      @required this.pass});
  @override
  _CategoryState createState() => _CategoryState(gender, name, num, pass);
}

class _CategoryState extends State<Category> {
  String gender;
  String name;
  String num;
  String pass;
  _CategoryState(this.gender, this.name, this.num, this.pass);
  @override
  String tech = 'no';
  String fashion = 'no';
  String automotive = 'no';
  String sports = 'no';
  String food = 'no';
  String art = 'no';
  String entertainment = 'no';
  String games = 'no';

  bool _art = false;
  bool _books = false;
  bool _business = false;
  bool _car = false;
  bool _education = false;
  bool _entertainment = false;
  bool _finance = false;
  bool _food = false;
  bool _health = false;
  bool _house = false;
  bool _lifestyle = false;
  bool _photography = false;
  bool _shopping = false;
  bool _sports = false;
  bool _travel = false;
  bool _medical = false;

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 120,
                color: Colors.red[800],
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
                  child: Center(
                    child: CheckboxListTile(
                        tileColor: Colors.white,
                        title: const Text(
                          'Arts and Design',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0,
                              fontSize: 24.0,
                              color: Colors.white),
                        ),
                        secondary: const Image(
                          height: 200,
                          image: AssetImage('lib/images/art.png'),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: _art,
                        onChanged: (value) {
                          setState(() {
                            _art = value;
                          });
                        }),
                  ),
                ),
              ),
              Container(
                height: 120,
                color: Colors.green[800],
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
                  child: Center(
                    child: CheckboxListTile(
                        tileColor: Colors.white,
                        title: const Text(
                          'Auto and Vehicles',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0,
                              fontSize: 24.0,
                              color: Colors.white),
                        ),
                        secondary: const Image(
                          height: 200,
                          image: AssetImage('lib/images/car.png'),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: _car,
                        onChanged: (value) {
                          setState(() {
                            _car = value;
                          });
                        }),
                  ),
                ),
              ),
              Container(
                height: 120,
                color: Colors.yellow[800],
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
                  child: Center(
                    child: CheckboxListTile(
                        tileColor: Colors.white,
                        title: const Text(
                          'Books and Reference',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0,
                              fontSize: 24.0,
                              color: Colors.white),
                        ),
                        secondary: const Image(
                          height: 200,
                          image: AssetImage('lib/images/books.png'),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: _books,
                        onChanged: (value) {
                          setState(() {
                            _books = value;
                          });
                        }),
                  ),
                ),
              ),
              Container(
                height: 120,
                color: Colors.blue[800],
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
                  child: Center(
                    child: CheckboxListTile(
                        tileColor: Colors.white,
                        title: const Text(
                          'Business',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0,
                              fontSize: 24.0,
                              color: Colors.white),
                        ),
                        secondary: const Image(
                          height: 200,
                          image: AssetImage('lib/images/business.png'),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: _business,
                        onChanged: (value) {
                          setState(() {
                            _business = value;
                          });
                        }),
                  ),
                ),
              ),
              Container(
                height: 120,
                color: Colors.deepPurple[800],
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
                  child: Center(
                    child: CheckboxListTile(
                        tileColor: Colors.white,
                        title: const Text(
                          'Education',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0,
                              fontSize: 24.0,
                              color: Colors.white),
                        ),
                        secondary: const Image(
                          height: 200,
                          image: AssetImage('lib/images/education.png'),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: _education,
                        onChanged: (value) {
                          setState(() {
                            _education = value;
                          });
                        }),
                  ),
                ),
              ),
              Container(
                height: 120,
                color: Colors.pink[800],
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
                  child: Center(
                    child: CheckboxListTile(
                        tileColor: Colors.white,
                        title: const Text(
                          'Entertainment',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0,
                              fontSize: 24.0,
                              color: Colors.white),
                        ),
                        secondary: const Image(
                          height: 200,
                          image: AssetImage('lib/images/entertainment.png'),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: _entertainment,
                        onChanged: (value) {
                          setState(() {
                            _entertainment = value;
                          });
                        }),
                  ),
                ),
              ),
              Container(
                height: 120,
                color: Colors.amber[800],
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
                  child: Center(
                    child: CheckboxListTile(
                        tileColor: Colors.white,
                        title: const Text(
                          'Finance',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0,
                              fontSize: 24.0,
                              color: Colors.white),
                        ),
                        secondary: const Image(
                          height: 200,
                          image: AssetImage('lib/images/finance.png'),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: _finance,
                        onChanged: (value) {
                          setState(() {
                            _finance = value;
                          });
                        }),
                  ),
                ),
              ),
              Container(
                height: 120,
                color: Colors.lightGreen[800],
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
                  child: Center(
                    child: CheckboxListTile(
                        tileColor: Colors.white,
                        title: const Text(
                          'Food and Drink',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0,
                              fontSize: 24.0,
                              color: Colors.white),
                        ),
                        secondary: const Image(
                          height: 200,
                          image: AssetImage('lib/images/foods.png'),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: _food,
                        onChanged: (value) {
                          setState(() {
                            _food = value;
                          });
                        }),
                  ),
                ),
              ),
              Container(
                height: 120,
                color: Colors.red[800],
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
                  child: Center(
                    child: CheckboxListTile(
                        tileColor: Colors.white,
                        title: const Text(
                          'Health and Fitness',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0,
                              fontSize: 24.0,
                              color: Colors.white),
                        ),
                        secondary: const Image(
                          height: 200,
                          image: AssetImage('lib/images/health.png'),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: _health,
                        onChanged: (value) {
                          setState(() {
                            _health = value;
                          });
                        }),
                  ),
                ),
              ),
              Container(
                height: 120,
                color: Colors.brown[800],
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
                  child: Center(
                    child: CheckboxListTile(
                        tileColor: Colors.white,
                        title: const Text(
                          'Houses and Home',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0,
                              fontSize: 24.0,
                              color: Colors.white),
                        ),
                        secondary: const Image(
                          height: 200,
                          image: AssetImage('lib/images/house.png'),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: _house,
                        onChanged: (value) {
                          setState(() {
                            _house = value;
                          });
                        }),
                  ),
                ),
              ),
              Container(
                height: 120,
                color: Colors.pink[500],
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
                  child: Center(
                    child: CheckboxListTile(
                        tileColor: Colors.white,
                        title: const Text(
                          'Lifestyle',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0,
                              fontSize: 24.0,
                              color: Colors.white),
                        ),
                        secondary: const Image(
                          height: 200,
                          image: AssetImage('lib/images/lifestyle.png'),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: _lifestyle,
                        onChanged: (value) {
                          setState(() {
                            _lifestyle = value;
                          });
                        }),
                  ),
                ),
              ),
              Container(
                height: 120,
                color: Colors.blue[800],
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
                  child: Center(
                    child: CheckboxListTile(
                        tileColor: Colors.white,
                        title: const Text(
                          'Medical',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0,
                              fontSize: 24.0,
                              color: Colors.white),
                        ),
                        secondary: const Image(
                          height: 200,
                          image: AssetImage('lib/images/medical.png'),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: _medical,
                        onChanged: (value) {
                          setState(() {
                            _medical = value;
                          });
                        }),
                  ),
                ),
              ),
              Container(
                height: 120,
                color: Colors.teal[800],
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
                  child: Center(
                    child: CheckboxListTile(
                        tileColor: Colors.white,
                        title: const Text(
                          'Photography',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0,
                              fontSize: 24.0,
                              color: Colors.white),
                        ),
                        secondary: const Image(
                          height: 200,
                          image: AssetImage('lib/images/photography.png'),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: _photography,
                        onChanged: (value) {
                          setState(() {
                            _photography = value;
                          });
                        }),
                  ),
                ),
              ),
              Container(
                height: 120,
                color: Colors.yellow[800],
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
                  child: Center(
                    child: CheckboxListTile(
                        tileColor: Colors.white,
                        title: const Text(
                          'Shopping',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0,
                              fontSize: 24.0,
                              color: Colors.white),
                        ),
                        secondary: const Image(
                          height: 200,
                          image: AssetImage('lib/images/shopping.png'),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: _shopping,
                        onChanged: (value) {
                          setState(() {
                            _shopping = value;
                          });
                        }),
                  ),
                ),
              ),
              Container(
                height: 120,
                color: Colors.orange[800],
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
                  child: Center(
                    child: CheckboxListTile(
                        tileColor: Colors.white,
                        title: const Text(
                          'Sports',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0,
                              fontSize: 24.0,
                              color: Colors.white),
                        ),
                        secondary: const Image(
                          height: 200,
                          image: AssetImage('lib/images/sports.png'),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: _sports,
                        onChanged: (value) {
                          setState(() {
                            _sports = value;
                          });
                        }),
                  ),
                ),
              ),
              Container(
                height: 120,
                color: Colors.green[800],
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
                  child: Center(
                    child: CheckboxListTile(
                        tileColor: Colors.white,
                        title: const Text(
                          'Travel',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0,
                              fontSize: 24.0,
                              color: Colors.white),
                        ),
                        secondary: const Image(
                          height: 200,
                          image: AssetImage('lib/images/travel.png'),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: _travel,
                        onChanged: (value) {
                          setState(() {
                            _travel = value;
                          });
                        }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: const Icon(Icons.check_rounded, size: 30.0, color: Colors.white),
        onPressed: () {
          AwesomeDialog(
            borderSide: BorderSide(color: Colors.blue, width: 2),
            buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
            context: context,
            dialogType: DialogType.SUCCES,
            animType: AnimType.BOTTOMSLIDE,
            title: 'Account Succesfully Created',
            desc: 'Dont forget the details of your account!',
            btnOkOnPress: () async {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => FirstScreen()));
            },
          ).show();
        },
      ),
    );
  }
}
