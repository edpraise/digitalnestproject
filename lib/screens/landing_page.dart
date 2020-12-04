import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tv24africa/pages/home_pageTabed.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
          context, MaterialPageRoute(builder: (context) => HomePage()),
           (Route<dynamic> route) => false,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFbd1017),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(child: Image.asset('assets/images/tony.png', height: 150, width: 150,)),
                         
                        SizedBox(
                          height: 10,
                        ),
                        // Center(
                        //   child: CircularProgressIndicator(
                        //      valueColor: new AlwaysStoppedAnimation<Color>(Colors.white)
                        //   ),
                        // )
                      ],
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
