import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:vidpay/vidpay.dart';

class Post extends StatefulWidget {
  const Post({Key key}) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  String sponsor;
  String id;
  int timesPlayed;
  String docName;

  Future writeData() async {
    final docUser =
        FirebaseFirestore.instance.collection('VIDEOS').doc(docName);

    final json = {
      'sponsor': sponsor,
      'id': id,
      'timesPlayed': timesPlayed,
    };

    await docUser.set(json);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          const SizedBox(height: 150),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: TextFormField(
              onChanged: (_docName) {
                docName = _docName;
              },
              decoration: const InputDecoration(
                  labelText: 'Document Name (video + #) - String',
                  labelStyle: TextStyle(
                    fontFamily: 'Quicksand',
                    color: Colors.grey,
                    fontSize: 12.0,
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey))),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: TextFormField(
              onChanged: (_sponsor) {
                sponsor = _sponsor;
              },
              decoration: const InputDecoration(
                  labelText: 'Sponsor - String',
                  labelStyle: TextStyle(
                    fontFamily: 'Quicksand',
                    color: Colors.grey,
                    fontSize: 12.0,
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey))),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: TextFormField(
              onChanged: (_id) {
                id = _id;
              },
              decoration: const InputDecoration(
                  labelText: 'Video Link (ID) - String',
                  labelStyle: TextStyle(
                    fontFamily: 'Quicksand',
                    color: Colors.grey,
                    fontSize: 12.0,
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey))),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: TextFormField(
              onChanged: (_timesPlayed) {
                timesPlayed = int.parse(_timesPlayed);
              },
              decoration: const InputDecoration(
                  labelText: 'Timesplayed (0) - Number',
                  labelStyle: TextStyle(
                    fontFamily: 'Quicksand',
                    color: Colors.grey,
                    fontSize: 12.0,
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey))),
              keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
            child: RaisedButton(
              color: Colors.lightBlue,
              onPressed: () async {
                AwesomeDialog(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                  buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
                  context: context,
                  dialogType: DialogType.SUCCES,
                  animType: AnimType.BOTTOMSLIDE,
                  title: 'Document Write Succesfull!',
                  desc: 'Go to Firebase and Double check',
                  btnCancelOnPress: () {},
                  btnOkOnPress: () {
                    writeData();
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => VidPay()));
                  },
                ).show();
              },
              child: const Text(
                'Enter',
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
        ]),
      ),
    );
  }
}
