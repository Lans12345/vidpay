import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:vidpay/vidpay.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Delete extends StatefulWidget {
  const Delete({Key key}) : super(key: key);

  @override
  State<Delete> createState() => _DeleteState();
}

class _DeleteState extends State<Delete> {
  String docName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 200),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: TextFormField(
              onChanged: (_docName) {
                docName = _docName;
              },
              decoration: const InputDecoration(
                  labelText: 'Document Name to Delete',
                  labelStyle: TextStyle(
                    fontFamily: 'Quicksand',
                    color: Colors.grey,
                    fontSize: 12.0,
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey))),
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
                  title: 'Document Deletion Succesfull!',
                  desc: 'Go to Firebase and Double check',
                  btnCancelOnPress: () {},
                  btnOkOnPress: () {
                    FirebaseFirestore.instance
                        .collection('VIDEOS')
                        .doc(docName)
                        .delete();
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => VidPay()));
                  },
                ).show();
              },
              child: const Text(
                'Delete',
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
    );
  }
}
