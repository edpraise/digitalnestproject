// import 'package:flutter/material.dart';
// import 'package:tv24africa/pages/home_pageTabed.dart';
// import 'package:url_launcher/url_launcher.dart';

// class Tip extends StatefulWidget {
//   @override
//   _TipState createState() => _TipState();
// }

// class _TipState extends State<Tip> {
//   List submitTipTopics = [
//     {
//       'imgUrl': 'assets/images/cr.jpg',
//       'title': 'Citizens Reporter',
//       'url': 'https://tv24africa.com/citizen-reporters/',
//       'desc':
//           'Please note that this platform is not for Press releases or Opinion Articles submission. It is strictly for citizens reporting.'
//     },
//     {
//       'imgUrl': 'assets/images/iv.jpg',
//       'title': 'Investigative Journalism',
//       'url': 'https://news.tv24africa.com/investigative-journalists/',
//       'desc':
//           'To provide information regarding your investigative story or news tip,  please click below',
//     },
//     {
//       'imgUrl': 'assets/images/tc.jpg',
//       'title': 'Tv Content Provider',
//       'url': 'https://news.tv24africa.com/investigative-journalists/',
//       'desc':
//           'To provide information regarding your programme or content ideas, please click below'
//     }
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Color(0xFF1a1a1a),
//         appBar: AppBar(
//           backgroundColor: Color(0xFFcc0000),
//           title: Text("Submit Your Tip"),
//           actions: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: GestureDetector(
//                   onTap: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => HomePage()));
//                   },
//                   child: Icon(Icons.home, color: Colors.white)),
//             ),
//           ],
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: ListView.builder(
//               itemCount: submitTipTopics.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return TipSubmission(
//                   title: submitTipTopics[index]['title'],
//                   imgUrl: submitTipTopics[index]['imgUrl'],
//                   desc: submitTipTopics[index]['desc'],
//                   onPressed: () {
//                     _launchURL(submitTipTopics[index]['url']);
//                   },
//                 );
//               }),
//         )
//         );
//   }
// }

// // ignore: must_be_immutable
// class TipSubmission extends StatelessWidget {
//   Function onPressed;
//   String title;
//   String imgUrl;
//   String desc;
//   TipSubmission({this.desc, this.imgUrl, this.title, this.onPressed});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           height: 10,
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         Divider(
//           color: Colors.redAccent[700],
//         ),
//         Text(title, style: TextStyle(color: Colors.white, fontSize: 15)),
//         Card(
//           child: Row(
//             children: <Widget>[
//               Expanded(
//                 flex: 2,
//                 child: Image.asset(imgUrl,
//                     fit: BoxFit.cover, height: 100, width: 100),
//               ),
//               SizedBox(width: 10),
//               Expanded(
//                 flex: 5,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[Text(desc)],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Container(
//               height: 35,
//               width: 80,
//               decoration: BoxDecoration(
//                   color: Colors.redAccent[700],
//                   borderRadius: BorderRadius.circular(10)),
//               child: Center(
//                   child: Padding(
//                 padding: const EdgeInsets.only(left: 8.0, right: 8),
//                 child: GestureDetector(
//                   onTap: onPressed,
//                   child: Text(
//                     'Click Here',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ))),
//         )
//       ],
//     );
//   }
// }

// _launchURL(String url) async {
//   if (await canLaunch(url)) {
//     await launch(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }


import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../settinng.dart';

class Tip extends StatefulWidget {
  @override
  _TipState createState() => _TipState();
}

class Category {
  int id;
  String name;
  Category(this.id, this.name);

  static List<Category> getCompanies() {
    return <Category>[
      Category(1, 'Innvestigation'),
      Category(2, 'Documentary'),
      Category(3, 'Factual Stories'),
      Category(4, 'Series'),
      Category(5, 'Others'),
      
    ];
  }
}

class _TipState extends State<Tip> {

  bool yetoCommenceVal = false;
bool ongoingVal = false;
bool completedVal = false;

  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
  GlobalKey _formState = GlobalKey<FormState>();

  TextEditingController firstName;
  TextEditingController lastName;
  TextEditingController email;
  TextEditingController comment;
  TextEditingController postTile;
  TextEditingController tag;


  List<Category> _companies = Category.getCompanies();
  List<DropdownMenuItem<Category>> _dropdownMenuItems;
  Category _selectedCompany;

  List<DropdownMenuItem<Category>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<Category>> items = List();
    for (Category company in companies) {
      items.add(
        DropdownMenuItem(
          value: company,
          child: Text(company.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Category selectedCompany) {
    setState(() {
      _selectedCompany = selectedCompany;
    });
  }

final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
     _dropdownMenuItems = buildDropdownMenuItems(_companies);
    _selectedCompany = _dropdownMenuItems[0].value;
    firstName = TextEditingController();
    lastName = TextEditingController();
    email = TextEditingController();
    comment = TextEditingController();
    postTile = TextEditingController();
    tag = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFbd1017),
        title: Image.asset(
          'assets/images/tony.png',
          fit: BoxFit.cover,
          height: 50,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()));
            },
          )
        ],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
          new Container(
              padding: const EdgeInsets.all(5.0),
              color: Colors.white,
              child: new Container(
                  child: new Center(
                child: Form(
                  key: _formState,
                  child: new Column(
                    children: [
                      new Padding(padding: EdgeInsets.only(top: 10.0)),
                      new Text(
                        'Submit A Pitch',
                        style: new TextStyle(color: Colors.red, fontSize: 25.0),
                      ),
                      new Padding(padding: EdgeInsets.only(top: 20.0)),
                      new TextFormField(
                        decoration: new InputDecoration(
                          labelText: " Name",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                          //fillColor: Colors.green
                        ),
                        validator: (val) {
                          if (val.length == 0) {
                            return "Name cannot be empty";
                          } else {
                            return null;
                          }
                        },
                        // keyboardType: TextInputType.emailAddress,/
                        //
                        style: new TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),
                      
                      new Padding(padding: EdgeInsets.only(top: 20.0)),
                      new TextFormField(
                        decoration: new InputDecoration(
                          labelText: "Email Address",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                          //fillColor: Colors.green
                        ),
                        validator: (val) {
                          if (val.length == 0) {
                            return "Email cannot be empty";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.emailAddress,
                        style: new TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),
                      new Padding(padding: EdgeInsets.only(top: 20.0)),
                      new TextFormField(
                            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
    FilteringTextInputFormatter.digitsOnly
],
                        decoration: new InputDecoration(
                          labelText: " Phone Number",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                          //fillColor: Colors.green
                        ),
                        validator: (val) {
                          if (val.length == 0) {
                            return "tag field cannot be empty";
                          } else {
                            return null;
                          }
                        },
                        // keyboardType: TextInputType.emailAddress,
                        style: new TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),
                      new Padding(padding: EdgeInsets.only(top: 20.0)),
                      new TextFormField(
                        minLines: 5,
                        maxLines: 500,
                        decoration: new InputDecoration(
                          labelText: "Program Description",
                          fillColor: Colors.black,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                          //fillColor: Colors.green
                        ),
                        validator: (val) {
                          if (val.length == 0) {
                            return " please add a comment";
                          } else {
                            return null;
                          }
                        },
                        // keyboardType: TextInputType.emailAddress,
                        style: new TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),
                      
                      
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text('Program genre', style: TextStyle(color: Colors.black)),
                            SizedBox(
                                width: MediaQuery.of(context).size.width / 4),
                            DropdownButton(
                              style: TextStyle(color: Colors.black),
                              value: _selectedCompany,
                              items: _dropdownMenuItems,
                              onChanged: onChangeDropdownItem,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 120.0),
                        child: Text('Selected: ${_selectedCompany.name}', style: TextStyle(color: Colors.black)),
                      ),
                       SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                         
                        ),
                        child: new TextFormField(
                        decoration: new InputDecoration(
                          labelText: " Evidence or links to previous works",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                          //fillColor: Colors.green
                        ),
                        validator: (val) {
                          if (val.length == 0) {
                            return "Email cannot be empty";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.url,
                        style: new TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),
                      ),
                      // Row(
                      //   children: [
                      //     Text('Featured Image',style: TextStyle(color: Colors.black)),
                      //     SizedBox(
                      //       width: MediaQuery.of(context).size.width / 3,
                      //     ),
                      //     GestureDetector(
                      //       onTap: (){
                      //          getImage();
                      //       },
                      //       child: Container(
                      //           height: 30,
                      //           width: 100,
                      //           decoration: BoxDecoration(
                      //               color: Color(0xFFbd1017),
                      //               borderRadius: BorderRadius.circular(10)),
                      //           child: Center(
                      //               child: Text('Insert Image',
                      //                   style:
                      //                       TextStyle(color: Colors.black)))),
                      //     )
                      //   ],
                      // ),
                      SizedBox(
                        height: 20,
                      ),
                     
                     
                    ],
                  ),
                ),
              ))),
              SizedBox(
                        height: 10,
                      ),
                      // Text('Selected Media',
                      //     style: TextStyle(
                      //       color: Colors.black,
                      //         fontWeight: FontWeight.bold, fontSize: 20)),
                      SizedBox(
                        height: 20,
                      ),
        //               Container(
        //                 // width: MediaQuery.of(context).size.width,
        //                 child: Row(
        //                   mainAxisAlignment: MainAxisAlignment.center,
        //                   children: [
        //                     Container(
        //                       decoration: BoxDecoration(
        //                           color: Colors.black.withOpacity(0.6)),
        //                       height: 100,
        //                       width:100,
        //                       child: Center(
        //                           child: _image == null
        //                               ? Padding(
        //                                 padding: const EdgeInsets.all(15.0),
        //                                 child: Text('No image selected.', style: TextStyle(color: Colors.black)),
        //                               )
        //                               : Image.file(_image,  width: MediaQuery.of(context).size.width)),
        //                     ),
                            
        // ]),
        // ),
        SizedBox(height:20),

        Text('Stage of Program',style: TextStyle(fontSize:20,color: Colors.black)),
        Padding(
          padding: const EdgeInsets.only(left:15.0,),
          child: Column(
            children: [
              Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Yet  to commence",style: TextStyle(color: Colors.black)),
                    SizedBox(width: 10,),
                    Checkbox(
                      value: yetoCommenceVal,
                      onChanged: (bool value) {
                        setState(() {
                         yetoCommenceVal = value;
                        });
                      },
                    ),
                  ],
                ),
                  Row(
                  // mainAxisAlignment: MainAxisAlignment.,
                  children: <Widget>[
                    Text("Ongoing",style: TextStyle(color: Colors.black)),
                    SizedBox(width: 62,),
                    Checkbox(
                      value: ongoingVal,
                      onChanged: (bool value) {
                        setState(() {
                         ongoingVal = value;
                        });
                      },
                    ),
                  ],
                ),
                 Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("Complete",style: TextStyle(color: Colors.black)),
                    SizedBox(width: 55,),
                    Checkbox(
                      value: completedVal,
                      onChanged: (bool value) {
                        setState(() {
                         completedVal = value;
                        });
                      },
                    ),
                  ],
                )

            ],
          ),
        ),
        SizedBox(height:20),
                   Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 1.4,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.6)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                         var snackBar = SnackBar(content: Row(
                                           children: [
                                             Text('''I am not a robot'''),
                                             Icon(Icons.person_pin_circle)
                                           ],
                                         ));
            _scaffoldKey.currentState.showSnackBar(snackBar);
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration:
                                        BoxDecoration(color: Colors.white),
                                    child: Icon(Icons.touch_app),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    height: 40,
                                    width: 40,
                                    child: Image(
                                        height: 40,
                                        image: AssetImage(
                                            'assets/images/rc.jpg'))),
                              )
                            ],
                          )),
         GestureDetector(
                        onTap: () {
                          _submit(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                colors: <Color>[
                                  Color(0xFFbd1017),
                                  Color(0xFFbd1017),
                                  Colors.black,
                                ],
                              ),
                            ),
                            child: Center(
                                child: Text('Submit',
                                    style: TextStyle(color: Colors.white))),
                          ),
                        ),
                      ),
            ]),
    )));
  }

  _showCupertinoDialog() {
    showDialog(
        context: context,
        builder: (_) => new CupertinoAlertDialog(
              title: new Text("Status Reort"),
              content: new Text(
                  "Your comment has been sent and will be reviewed soon!"),
              actions: <Widget>[
                FlatButton(
                  child: Text('Close me!'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }

  _submit(BuildContext context) {
    FormState form = _formState.currentState;
    if (form.validate()) {
      form.save();
      _showCupertinoDialog();
    }
  }
}

  
