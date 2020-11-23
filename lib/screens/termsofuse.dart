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
      body: SingleChildScrollView(
              child: Container(
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
                        Text('1.Terms',  style: TextStyle(fontWeight: FontWeight.bold)),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            child: Text(''''By accessing the website “www.tv24africa.com” or any if is subdomains, you are agreeing to be bound by these website Terms and Conditions of Use, all applicable laws, and regulations, and agree that you are responsible for compliance with any applicable local laws.

If you do not agree with any of these terms, you are prohibited from using or accessing this site. The materials contained in this website are protected by applicable copyright and trademark law.''''')),
                        ),
                        Text('2. Use Liscence',  style: TextStyle(fontWeight: FontWeight.bold)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('''Permission is granted to temporarily download one copy of the materials (information or software) on the website for personal, non-commercial transitory viewing only. This is the grant of a license, not a transfer of title, and under this license, you may not:

Modify or copy the materials;
1. Use the materials for any commercial purpose, or for any public display (commercial or non-commercial);
2. Attempt to decompile or reverse engineer any software contained on tv24africa.com website.
3. Remove any copyright or other proprietary notations from the materials; or
4. Transfer the materials to another person or “mirror” the materials on any other server.
5. This license shall automatically terminate if you violate any of these restrictions and may be terminated by tv24africa.com at any time. Upon terminating your viewing of these materials or upon the termination of this license, you must destroy any downloaded materials in your possession whether in electronic or printed format.'''),
                        ),
                        Text('3. The Feedback', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('''The “Feedback” means the message board or e-mail function offered as part of this Site. If you participate in the Feedback, you must not:

1.  Defame, abuse, harass or threaten others.
2.  Make any bigoted, hateful, or racially offensive statement that infringes human rights.
3.  Advocate illegal activity or discuss illegal activities with the intent to commit them.
4.  Post or distribute any material that infringes and/or violates any right of a third party or any law.
5.  Post or distribute any vulgar, obscene, discourteous, or indecent language or images that on Infringe authors’ right
6.  Advertise or sell to or solicit others
7.  Use the Feedback for commercial purposes of any kind
8.  Post or distribute any software or other materials that contain a virus or other harmful component.
9.  Post material or make statements that do not generally pertain to the designated topic or theme of any chat room or bulletin board
We reserve the right to remove or edit content from the Forum at any time and for any reason''')
                      ],
                    ),
                  ),
                ),
                
                
              ],
          ),
        ),
      ),
    );
  }
}
