import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

class TermsOfUse extends StatefulWidget {
  @override
  _TermsOfUseState createState() => _TermsOfUseState();
}

class _TermsOfUseState extends State<TermsOfUse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFbd1017),
        title: Image.asset(
          'assets/images/tony.png',
          fit: BoxFit.cover,
          height: 50,
        ),
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(
        //       Icons.settings,
        //       color: Colors.white,
        //     ),
        //     onPressed: () {
        //       Navigator.push(context,
        //           MaterialPageRoute(builder: (context) => SettingsScreen()));
        //     },
        //   )
        // ],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Center(child: Text('TERMS OF USE',style: TextStyle(fontSize: 25))),
              ),
            ),
            Container(
              height: 1,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xFFcc0000),
              ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('1.Terms'),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          child: Text(''''By accessing the website “www.tv24africa.com” or any if is subdomains, you are agreeing to be bound by these website Terms and Conditions of Use, all applicable laws, and regulations, and agree that you are responsible for compliance with any applicable local laws.

If you do not agree with any of these terms, you are prohibited from using or accessing this site. The materials contained in this website are protected by applicable copyright and trademark law.''''')),
                      )
                    ],
                  ),
                ),
              ),
              
            ],
        ),
      ),
    );
  }
}
