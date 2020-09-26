// import 'package:flutter/material.dart';

// class NewsPaper extends StatefulWidget {
//   @override
//   _NewsPaperState createState() => _NewsPaperState();
// }

// class _NewsPaperState extends State<NewsPaper> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
      
//     );
//   }
// }


// import 'package:flutter/material.dart';

// class LiveTv extends StatefulWidget {
//   @override
//   _LiveTvState createState() => _LiveTvState();
// }

// class _LiveTvState extends State<LiveTv> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
      
//     );
//   }
// }

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:tv24africa/pages/home_pageTabed.dart';

// import '../main.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(new NewsPaperSite());
}

class NewsPaperSite extends StatefulWidget {
  @override
  _NewsPaperSite createState() => new _NewsPaperSite();
}

class _NewsPaperSite extends State<NewsPaperSite> {
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
         backgroundColor: Colors.white,
        appBar: AppBar(
           backgroundColor:Color(0xFFcc0000),
          leading: new IconButton(
              icon: new Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context, true);
              }),
          // backgroundColor: Colors.white,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'NewsPaperSite',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ), // fontFamily: ,
              ),
            ],
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 29,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
            )
          ],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Container(
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
                initialUrl: "https://tv24africa.com/watch-live/",
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