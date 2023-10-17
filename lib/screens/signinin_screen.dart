import 'dart:ui';

import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Stack(
        children: [
          Center(
            child: SizedBox(
                width: 350,
                height: 500,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: double.infinity,
                      child: const SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'PICSUM PICS',
                              style: TextStyle(
                                  color: Color(0xFF012A4A),
                                  fontSize: 30,
                                  fontWeight: FontWeight.normal),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Form(child: CustomForm()),
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
          ),
        ],
      )),
    );
  }
}
