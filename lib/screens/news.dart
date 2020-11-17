import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tv24africa/services/wo_rest_api_singledata.dart';
import 'package:url_launcher/url_launcher.dart';
import '../services/wp_post_api.dart';

import 'new_details_screen.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  Future<void> _launchFacebook(String url) async {
    if (await canLaunch(url)) {
      final bool nativeAppLaunchSucceded =
          await launch(url, forceSafariVC: false, universalLinksOnly: true);
      if (!nativeAppLaunchSucceded) {
        await launch(url, forceSafariVC: true);
      }
    }
  }

  Future<void> _launchtweeter(String url) async {
    if (await canLaunch(url)) {
      final bool nativeAppLaunchSucceded =
          await launch(url, forceSafariVC: false, universalLinksOnly: true);
      if (!nativeAppLaunchSucceded) {
        await launch(url, forceSafariVC: true);
      }
    }
  }

  Future<void> _launchInstagram(String url) async {
    if (await canLaunch(url)) {
      final bool nativeAppLaunchSucceded =
          await launch(url, forceSafariVC: false, universalLinksOnly: true);
      if (!nativeAppLaunchSucceded) {
        await launch(url, forceSafariVC: true);
      }
    }
  }

  Future<void> _launchYouTube(String url) async {
    if (await canLaunch(url)) {
      final bool nativeAppLaunchSucceded =
          await launch(url, forceSafariVC: false, universalLinksOnly: true);
      if (!nativeAppLaunchSucceded) {
        await launch(url, forceSafariVC: true);
      }
    }
  }

  Future<void> _launchLinkedIn(String url) async {
    if (await canLaunch(url)) {
      final bool nativeAppLaunchSucceded =
          await launch(url, forceSafariVC: false, universalLinksOnly: true);
      if (!nativeAppLaunchSucceded) {
        await launch(url, forceSafariVC: true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(left:15.0, top: 15),
            //   child: Text('Latest',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            // ),
            Container(
              height: MediaQuery.of(context).size.height / 3,
              child: FutureBuilder(
                  future: fetchWpPostforTopPage(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      Map wppost = snapshot.data;
                      var imageUrl = wppost['featured_image_src'];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FeedDetails(wppost)));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Stack(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Image.network(imageUrl),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: FadeInImage.assetNetwork(
                                    placeholder: 'assets/images/load.gif',
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height / 3,
                                    image: imageUrl,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                // Expanded(child: Container()),

                                Container(
                                  alignment: Alignment.bottomCenter,
                                  // height: 100,
                                  // width: MediaQuery.of(context).size.width,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      wppost['title']['rendered'],
                                      softWrap: true,
                                      maxLines: 2,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25.5,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                    return Center(child: Container());
                  }),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left:15.0, top: 10),
            //   child: Text('Others',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            // ),
            Expanded(
              child: FutureBuilder(
                  future: fetchWpPost(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        //  physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          if (index == snapshot.data.length - 1) {
                            return Container(
                              child: Column(
                                children: [
                                  Text("We Are Social",
                                      style: TextStyle(
                                          color: Color(0xFFbd1017),
                                          fontSize: 13)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                icon: FaIcon(
                                                  FontAwesomeIcons.facebook,
                                                  color: Color(0xFFbd1017),
                                                ),
                                                onPressed: () {
                                                  _launchFacebook(
                                                      'https://web.facebook.com/TV24Africa?_rdc=1&_rdr');
                                                },
                                              ),
                                              IconButton(
                                                  icon: FaIcon(
                                                    FontAwesomeIcons.twitter,
                                                    color: Color(0xFFbd1017),
                                                  ),
                                                  onPressed: () {
                                                    _launchtweeter(
                                                        'https://twitter.com/TV24Africa');
                                                  }),
                                              IconButton(
                                                  icon: FaIcon(
                                                    FontAwesomeIcons.instagram,
                                                    color: Color(0xFFbd1017),
                                                  ),
                                                  onPressed: () {
                                                    _launchInstagram(
                                                        'https://www.instagram.com/tv24africa/');
                                                  }),
                                              IconButton(
                                                  icon: FaIcon(
                                                    FontAwesomeIcons.youtube,
                                                    color: Color(0xFFbd1017),
                                                  ),
                                                  onPressed: () {
                                                    _launchYouTube(
                                                        'https://www.youtube.com/channel/UCuBry0S8HC_vRVJHzKA7dyg');
                                                  }),
                                              IconButton(
                                                  icon: FaIcon(
                                                      FontAwesomeIcons
                                                          .linkedinIn,
                                                      color: Color(0xFFbd1017)),
                                                  onPressed: () {
                                                    _launchLinkedIn(
                                                        'https://www.linkedin.com/company/unavailable/');
                                                  }),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Center(
                                    child: Text("CopyRight @ Tv24Africa 2020",
                                        style: TextStyle(
                                            color: Color(0xFFbd1017),
                                            fontSize: 15)),
                                  )
                                ],
                              ),
                            );
                          }
                          Map wppost = snapshot.data[index];
                          var imageUrl = wppost["featured_image_src"];
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            FeedDetails(wppost)));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black87,
                                      )
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(2),
                                          child: Container(
                                            child: FadeInImage.assetNetwork(
                                              placeholder:
                                                  'assets/images/load.gif',
                                              image: imageUrl,
                                              fit: BoxFit.cover,
                                              width: 160,
                                              height: 90,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5.0),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              wppost['title']['rendered'],
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12.5,
                                                // fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return Center(
                        child: CircularProgressIndicator(
                      backgroundColor: Colors.redAccent[700],
                    ));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
