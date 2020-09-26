import 'package:flutter/material.dart';
import 'package:tv24africa/pages/home_pageTabed.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1a1a1a),
      appBar: AppBar(
        backgroundColor: Color(0xFFcc0000),
        title: Text("About Us"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>HomePage()));
                }, child: Icon(Icons.home, color: Colors.white)),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/images/tony.png'),
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\nTv24Africa  is the flagship company owned by News Media Africa set up to tell the African stories in ways never told and to give the African people the chance for their views, voices, \nideas and perspectives to be heard globally.\nContact us: News@tv24africa.com\n\n Version 1.10\n@2020',
                    style: TextStyle(fontSize: 17, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
