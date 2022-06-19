import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:vidpay/updateCoins.dart';
import 'package:vidpay/updateIndex.dart';
import 'package:vidpay/vidpay.dart';

class Update extends StatefulWidget {
  const Update({Key key}) : super(key: key);

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 180),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => UpdateIndex()));
                },
                child: const Text(
                  'Random Index',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                )),
            const SizedBox(height: 30),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => UpdateCoins()));
                },
                child: const Text(
                  'Coins',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                )),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
