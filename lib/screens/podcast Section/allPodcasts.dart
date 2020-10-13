import 'package:flutter/material.dart';
import 'package:tv24africa/screens/podcast%20Section/podcast.dart';

class AllPod extends StatefulWidget {
  @override
  _AllPodState createState() => _AllPodState();
}

class _AllPodState extends State<AllPod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
      ),
      backgroundColor: Colors.black45,
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
                  'All Podcasts', 
                  style: TextStyle(color: Colors.red, fontSize: 20),
                ),
                Divider(
                  color: Colors.white,
                ),
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
                                'assets/images/pd1.jpg',
                                fit: BoxFit.cover,
                              ),
                              ListTile(
                                title: Text('Matters of the Heart'),
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
                                'assets/images/p2.jpg',
                                fit: BoxFit.cover,
                              ),
                              ListTile(
                                title: Text(
                                    'Stimulating the Economy of Kogi State'),
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
                //   padding: const EdgeInsets.all(8.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text('News in Brief', style: TextStyle(color: Colors.red)),
                //       // Text('see All',style: TextStyle(color: Colors.red)),
                //     ],
                //   ),
                // ),
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
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text('Every day Matter',
                //           style: TextStyle(color: Colors.red)),
                //       // Text('see All', style: TextStyle(color: Colors.red))
                //     ],
                //   ),
                // ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
