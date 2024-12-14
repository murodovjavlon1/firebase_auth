import 'dart:async';

import 'package:flutter/material.dart';
import 'package:name/page/signin_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    _initTimer();
    super.initState();
  }

  void _initTimer() {
    Timer(const Duration(seconds: 2), () {
      _callNextPage();
    });
  }

  _callNextPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const SigninPage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.deepPurple,
            Color.fromARGB(255, 157, 121, 219),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Text(
                  "Authentication 🔒",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
            ),
            Text(
              "All rights reserved",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
