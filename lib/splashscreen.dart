import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pts_rafyattala_rpl2/home.dart';
import 'package:pts_rafyattala_rpl2/main.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 20),
                  Image.asset('images/asset1.png', height: 250)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
