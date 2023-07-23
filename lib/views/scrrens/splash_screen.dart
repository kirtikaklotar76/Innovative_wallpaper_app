import 'dart:async';

import 'package:flutter/material.dart';

import '../../modals/my_routes.dart';

class splash_Screen extends StatefulWidget {
  const splash_Screen({Key? key}) : super(key: key);

  @override
  State<splash_Screen> createState() => _splash_ScreenState();
}

class _splash_ScreenState extends State<splash_Screen> {
  void MySplash() {
    Timer.periodic(
      const Duration(seconds: 3),
      (tick) {
        Navigator.of(context).pushReplacementNamed(MyRoutes.HomePage);
        tick.cancel();
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    MySplash();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Spacer(),
            Image.asset(
              "assets/images/logo.png",
              height: 150,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Everything is you!!",
              style: const TextStyle(color: Colors.white),
            ),
            Spacer(),
            CircularProgressIndicator(),
            Spacer(),
          ],
        ),
      ),
      backgroundColor: Color(0XFF09324B),
    );
  }
}
