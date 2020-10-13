import 'package:flutter/material.dart';
import 'package:tv24africa/screens/podcast%20Section/allPodcasts.dart';
import 'package:tv24africa/screens/podcast%20Section/podcast.dart';

class PodcastList extends StatefulWidget {
  @override
  _PodcastListState createState() => _PodcastListState();
}

class _PodcastListState extends State<PodcastList> {
  final List podCast = [
    {'img': 'assets/images/pd1.jpg', 'title': 'Matters of the Heart'},
    {
      'img': 'assets/images/p2.jpg',
      'title': 'Stimulating the Economy of Kogi State'
    },
    {
      'img': 'assets/images/p4.jpg',
      'title': 'Focal Point: Diversifying the Economy of Kogi State'
    },
    {
      'img': 'assets/images/p3.jpg',
      'title': 'Turning Around the Internal Revenue Generation of Kogi State'
    },
    {
      'img': 'assets/images/pdc.jpg',
      'title':
          'What Nigerian Leader’s New Chief of Staff Said About Serving the...'
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Podcast()));
            },
            child: Column(
              children: [
                Text(
                  'Recent Podcasts',
                  style: TextStyle(color: Colors.red),
                ),
                Divider(
                  color: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 160,
                          child: Card(
                            child: Wrap(
                              children: [
                                Image.asset(
                                  'assets/images/pd1.jpg',
                                  fit: BoxFit.cover,
                                ),
                                ListTile(
                                  title: Text('Matters of the Heart'),
                                  trailing: Icon(Icons.music_note),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 160,
                        child: Card(
                          child: Wrap(
                            children: [
                              Image.asset(
                                'assets/images/p2.jpg',
                                fit: BoxFit.cover,
                              ),
                              ListTile(
                                title: Text(
                                    'Stimulating the Economy of Kogi State'),
                                    trailing: Icon(Icons.music_note),
                              ),
                              
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('News in Brief',
                          style: TextStyle(color: Colors.red)),
                      // Text('see All',style: TextStyle(color: Colors.red)),
                    ],
                  ),
                ),
                Divider(color: Colors.white),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 160,
                        child: Card(
                          child: Wrap(
                            children: [
                              Image.asset(
                                'assets/images/p3.jpg',
                                fit: BoxFit.cover,
                              ),
                              ListTile(
                                title: Text(
                                    'Turning Around the Internal Revenue Generation of Kogi State'),
                                    trailing: Icon(Icons.music_note),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 160,
                        child: Card(
                          child: Wrap(
                            children: [
                              Image.asset(
                                'assets/images/p4.jpg',
                                fit: BoxFit.cover,
                              ),
                              ListTile(
                                title: Text(
                                    'Focal Point: Diversifying the Economy of Kogi State'),
                                    trailing: Icon(Icons.music_note),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Every day Matter',
                          style: TextStyle(color: Colors.red)),
                      // Text('see All', style: TextStyle(color: Colors.red))
                    ],
                  ),
                ),
                Divider(color: Colors.white),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 160,
                        child: Card(
                          child: Wrap(
                            children: [
                              Image.asset(
                                'assets/images/p3.jpg',
                                fit: BoxFit.cover,
                              ),
                              ListTile(
                                title: Text(
                                    'Turning Around the Internal Revenue Generation of Kogi State'),
                                    trailing: Icon(Icons.music_note),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 160,
                        child: Card(
                          child: Wrap(
                            children: [
                              Image.asset(
                                'assets/images/p4.jpg',
                                fit: BoxFit.cover,
                              ),
                              ListTile(
                                title: Text(
                                    'Focal Point: Diversifying the Economy of Kogi State'),
                                    trailing: Icon(Icons.music_note),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Text('The Investigation', style: TextStyle(color: Colors.red)),
                //         Text('see All', style: TextStyle(color: Colors.red))
                //       ],
                //     ),
                //   ),
                // Divider(color: Colors.white),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 160,
                        child: Card(
                          child: Wrap(
                            children: [
                              Image.asset(
                                'assets/images/p3.jpg',
                                fit: BoxFit.cover,
                              ),
                              ListTile(
                                title: Text(
                                    'Turning Around the Internal Revenue Generation of Kogi State'),
                                    trailing: Icon(Icons.music_note),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 160,
                        child: Card(
                          child: Wrap(
                            children: [
                              Image.asset(
                                'assets/images/p4.jpg',
                                fit: BoxFit.cover,
                              ),
                              ListTile(
                                title: Text(
                                    'Focal Point: Diversifying the Economy of Kogi State'),
                                    trailing: Icon(Icons.music_note),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  height: 20,
                  width: 60,
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AllPod()));
                          },
                          child: Text('See All',
                              style: TextStyle(color: Colors.red, fontSize: 20))),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
