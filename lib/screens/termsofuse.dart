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
      backgroundColor: Colors.black,
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
                        Container(
                height: 1,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFcc0000),
                ),
                ),
                SizedBox(height: 10,),
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
                        Container(
                height: 1,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFcc0000),
                ),
                ),
                SizedBox(height: 10),
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
                Container(
                height: 1,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFcc0000),
                ),
                ),
                SizedBox(height: 10,),
                Text(' Disclaimer', style: TextStyle(fontWeight: FontWeight.bold),),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('''''''''1.   The materials on TV24africa website are provided “as is”. TV24africa makes no warranties, expressed or implied, and hereby disclaims and negates all other warranties, including without limitation, implied warranties or conditions of merchantability, fitness for a particular purpose, or non-infringement of intellectual property or other violation of rights.
2.   Further, TV24Africa does not warrant or make any representations concerning the accuracy, likely results, or reliability of the use of the materials on its Internet website or otherwise relating to such materials or on any sites linked to this site.'''''''''),
                ),
                Container(
                height: 1,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFcc0000),
                ),
                ),
                SizedBox(height: 10),
                Text('Limitations', style: TextStyle(fontWeight: FontWeight.bold),),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('''''''''1. In no event shall TV24Africa or its suppliers be liable for any damages (including, without limitation, damages for loss of data or profit, or due to business interruption,) arising out of the use or inability to use the materials on TV24Africa Internet site, even if TV24Africa or a TV24Africa authorized representative has been notified orally or in writing of the possibility of such damage. Because some jurisdictions do not allow limitations on implied warranties, or limitations of liability for consequential or incidental damages, these limitations may not apply to you.
2.TV24Africa suggests watching over children when they use the website. TV 24 Africa news is not responsible for the consequences of children’s access to the website.'''''''''),
                ),
                SizedBox(height: 10),
                Container(
                height: 1,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFcc0000),
                ),
                ),
                SizedBox(height: 10),
                Text('Revisons and Errata', style: TextStyle(fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(''''''''''The materials appearing on TV24Africa website could include technical, typographical, or photographic errors. TV24Africa does not warrant that any of the materials on its website are accurate, complete, or current. TV24Africa may make changes to the materials contained on its web site at any time without notice. TV24Africa does not, however, make any commitment to update the materials.'''''''''),
                ),
                Text('Links', style: TextStyle(fontWeight: FontWeight.bold,)),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('''''''''''''TV24Africa has not reviewed all of the sites linked to its Internet website and is not responsible for the contents of any such linked site. The inclusion of any link does not imply endorsement by TV24Africa of the site. Use of any such linked website is at the user’s own risk.'''''''''''''),
                ),
                Text('Site Terms of Use Modifications', style: TextStyle(fontWeight: FontWeight.bold),),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('''''''''1. TV24Africa may revise these terms of use for its website at any time without notice. Please check these terms periodically for changes. Your continued use of this website following the posting of changes to these terms will mean you accept those changes.

2. Your access to the Site may be terminated immediately without notice from us if in our sole discretion you fail to comply with any term or provision of these terms. Upon termination, you must cease use of the Site and destroy all materials obtained from such site and all copies thereof, whether made under these terms or otherwise.

'''''''''''''''),
                ),
                Text('Governing Law', style: TextStyle(fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('''''''Any claim relating to the TV24Africa website shall be governed by the laws of Nigeria without regard to its conflict of law provisions.'''''''),
                )
                
                
              ],
          ),
        ),
      ),
    );
  }
}
