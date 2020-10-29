// import 'package:flutter/material.dart';
// import 'package:tv24africa/pages/home_pageTabed.dart';

// class ContactUs extends StatefulWidget {
//   @override
//   _ContactUsState createState() => _ContactUsState();
// }

// class _ContactUsState extends State<ContactUs> {
//   @override
//   Widget build(BuildContext context) {
//     final _formKey = GlobalKey<FormState>();
//     final firstNameController = TextEditingController();
//     final lastNameController = TextEditingController();
//     final emailController = TextEditingController();
//     final commentController = TextEditingController();
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Color(0xFFcc0000),
//         title: Text("Contact Us"),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: GestureDetector(
//                 onTap: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => HomePage()));
//                 },
//                 child: Icon(Icons.home, color: Colors.white)),
//           ),
//         ],
//       ),
//       body: Column(
    
//         children: [
//           // Container(height: 100,),
//           Text('Contact Us', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
//           Expanded(
//               child: ListView(
//             children: [
//               Padding(
//                 padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
//                 child: Form(
//                   key: _formKey,
//                   child: Column(
//                     children: [
//                       TextFormField(
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20)
//                           ),
//                             labelText: 'first name',
//                             labelStyle: TextStyle(fontSize: 15)),
//                         controller: firstNameController,
//                         validator: (value) {
//                           if (value.isEmpty) {
//                             return 'FirstName Cannot be null';
//                           }
//                           return null;
//                         },
//                       ),
//                       SizedBox(height:10),
//                       TextFormField(
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20)
//                           ),
//                             labelText: 'last name',
//                             labelStyle: TextStyle(fontSize: 15)),
//                         controller: lastNameController,
//                         validator: (value) {
//                           if (value.isEmpty) {
//                             return 'LastName Cannot be empty';
//                           }
//                           return null;
//                         },
//                       ),
//                       SizedBox(height:10),
//                       TextFormField(
//                         decoration: InputDecoration(
//                            border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20)
//                           ),
//                             labelText: 'Email',
//                             labelStyle: TextStyle(fontSize: 15)),
//                         controller: emailController,
//                         validator: (value) {
//                           if (value.isEmpty) {
//                             return 'Email Cannot be empty';
//                           }
//                           return null;
//                         },
//                       ),
//                       SizedBox(height: 20),
//                       TextFormField(
//                         decoration: InputDecoration(
//                             border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20)
//                           ),
//                           contentPadding: new EdgeInsets.symmetric(vertical: 65.0, horizontal: 50.0),
//                             labelText: 'Comments/Questions',
//                             labelStyle: TextStyle(fontSize: 15)),
//                         controller: commentController,
//                         validator: (value) {
//                           if (value.isEmpty) {
//                             return 'Comments/Questions Cannot be empty';
//                           }
//                           return null;
//                         },
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//              Container(  
//               margin: EdgeInsets.all(25),  
//               child: FlatButton(  
//                 height: 50,
//                 shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
//                 child: Text('Send a Comment', style: TextStyle(fontSize: 14.0),),  
//                 color: Colors.black,  
//                 textColor: Colors.white,  
//                 onPressed: () {
                  
//                 },  
//               ),  
//             ), 
//             ],
//           ))
//         ],
//       ),
//     );
//   }
// }





import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:tv24africa/pages/home_pageTabed.dart';

// import '../main.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(new ContactUs());
}

class ContactUs extends StatefulWidget {
  @override
  _NewsPaperSite createState() => new _NewsPaperSite();
}

class _NewsPaperSite extends State<ContactUs> {
  InAppWebViewController webView;
  String url = "";
  double progress = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
         backgroundColor: Colors.black,
        // appBar: AppBar(
        //    backgroundColor:Color(0xFFcc0000),
        //   leading: new IconButton(
        //       icon: new Icon(
        //         Icons.arrow_back,
        //         color: Colors.white,
        //       ),
        //       onPressed: () {
        //         Navigator.pop(context, true);
        //       }),
        //   // backgroundColor: Colors.white,
        //   title: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: <Widget>[
        //       Text(
        //         'ContactUs',
        //         style: TextStyle(
        //           color: Colors.white,
        //           fontSize: 20,
        //         ), // fontFamily: ,
        //       ),
        //     ],
        //   ),
        //   actions: <Widget>[
        //     Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: IconButton(
        //         icon: Icon(
        //           Icons.home,
        //           color: Colors.white,
        //           size: 29,
        //         ),
        //         onPressed: () {
        //           Navigator.of(context).pop();
        //           Navigator.push(context,
        //               MaterialPageRoute(builder: (context) => HomePage()));
        //         },
        //       ),
        //     )
        //   ],
        //   centerTitle: true,
        //   elevation: 0.0,
        // ),
        body: SafeArea(
            child: Column(children: <Widget>[
          Container(
              padding: EdgeInsets.all(1.0),
              child: progress < 1.0
                  ? LinearProgressIndicator(value: progress)
                  : Container()),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(1.0),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.white)),
              child: InAppWebView(
                initialUrl: "https://tv24africa.com/contact/",
                initialHeaders: {},
                initialOptions: InAppWebViewGroupOptions(
                    crossPlatform: InAppWebViewOptions(
                  debuggingEnabled: true,
                )),
                onWebViewCreated: (InAppWebViewController controller) {
                  webView = controller;
                },
                onLoadStart: (InAppWebViewController controller, String url) {
                  setState(() {
                    this.url = url;
                  });
                },
                onLoadStop:
                    (InAppWebViewController controller, String url) async {
                  setState(() {
                    this.url = url;
                  });
                },
                onProgressChanged:
                    (InAppWebViewController controller, int progress) {
                  setState(() {
                    this.progress = progress / 100;
                  });
                },
              ),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.white,
                child: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  if (webView != null) {
                    webView.goBack();
                  }
                },
              ),
              RaisedButton(
                color: Colors.white,
                child: Icon(Icons.refresh, color: Colors.black),
                onPressed: () {
                  if (webView != null) {
                    webView.reload();
                  }
                },
              ),
              RaisedButton(
                color: Colors.white,
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                ),
                onPressed: () {
                  if (webView != null) {
                    webView.goForward();
                  }
                },
              ),
            ],
          ),
        ])),
      ),
    );
  }
}