import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class FeedDetails extends StatelessWidget {
  Map<String, dynamic> wppost;

  FeedDetails(this.wppost);

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFbd1017),
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
          
            onPressed: () => Navigator.of(context).pop()),
        elevation: 0.0,
        title: Text("Feed"),
        centerTitle: true,
      
      ),
      backgroundColor: Colors.black,
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(wppost['featured_image_src']),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Html(
                  data:wppost['title']['rendered'],
                  // style: TextStyle(
                  //   fontWeight: FontWeight.bold,
                  //   fontSize: 20
                  // ),
                ),
              ),
             
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Html(
                  data: wppost['content']['rendered'],
                  onLinkTap: (String url) {
                    _launchUrl(url);
                  }
                ),
              ),
            ],
          ),
        )
      ),
      );
    
  }
}

_launchUrl(String link) async {
  if (await canLaunch(link)) {
    await launch(link);
  } else {
    throw 'Cannot launch $link';
  }
}