import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tv24africa/services/category_api_calls/business_api_call.dart';
import '../services/wo_rest_api_singledata.dart';
import 'category  details/business_cat.dart';
import 'new_details_screen.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, children: [
          Text('LATEST NEWS',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            child: FutureBuilder(
                future: fetchWpPostforTopPage(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        Map wppost = snapshot.data[index];
                        var imageUrl = wppost["featured_image_src"];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          FeedDetails(wppost)));
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: 100,
                                  width: 109,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: FadeInImage.assetNetwork(
                                        placeholder: 'assets/images/load.gif',
                                        image: imageUrl,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 100,
                                    width: MediaQuery.of(context).size.width,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          wppost['title']['rendered'],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                }),
          ),
          Divider(
            color: Colors.red,
          ),
          Container(
            child: Column(
              children: [
                Text('Business'),
               
              ],
            ),
          ),
          Divider(
            color: Colors.redAccent[700],
          ),
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.facebook),
                  onPressed: () {},
                ),
                IconButton(
                    icon: FaIcon(FontAwesomeIcons.twitter), onPressed: () {}),
                IconButton(
                    icon: FaIcon(FontAwesomeIcons.instagram), onPressed: () {}),
              ],
            ),
          ),
          Container(
              child: Text(
            "CopyRight by Tv24Africa @ 2020",
            style: TextStyle(color: Colors.redAccent[700]),
          ))
        ]),
      )),
    ));
  }
}
