import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:tv24africa/screens/settinng.dart';
import 'package:video_player/video_player.dart';

class IReport extends StatefulWidget {
  @override
  _IReportState createState() => _IReportState();
}

class Company {
  int id;
  String name;
  Company(this.id, this.name);

  static List<Company> getCompanies() {
    return <Company>[
      Company(1, 'analysis'),
      Company(2, 'business'),
      Company(3, 'Entertainment'),
      Company(4, 'Environmnet'),
      Company(5, 'I-report'),
      Company(6, 'In-Pictures'),
      Company(7, 'International news'),
      Company(8, 'News Africa'),
      Company(9, 'Sport News'),
      Company(10, 'Politics'),
      Company(11, 'Sci-Tech'),
      Company(12, 'Sports'),
      Company(13, 'Uncategorized'),
    ];
  }
}

class _IReportState extends State<IReport> {
  VideoPlayerController _videoPlayerController;
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

  File _video;
  final vPicker = ImagePicker();

// This funcion will helps you to pick a Video File
  _pickVideo() async {
    PickedFile pickedFile = await picker.getVideo(source: ImageSource.gallery);
    _video = File(pickedFile.path);
    _videoPlayerController = VideoPlayerController.file(_video)
      ..initialize().then((_) {
        setState(() {});
        _videoPlayerController.play();
      });
  }

  GlobalKey _formState = GlobalKey<FormState>();

  TextEditingController firstName;
  TextEditingController lastName;
  TextEditingController email;
  TextEditingController comment;
  TextEditingController postTile;
  TextEditingController tag;

  List<Company> _companies = Company.getCompanies();
  List<DropdownMenuItem<Company>> _dropdownMenuItems;
  Company _selectedCompany;

  List<DropdownMenuItem<Company>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<Company>> items = List();
    for (Company company in companies) {
      items.add(
        DropdownMenuItem(
          value: company,
          child: Text(company.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Company selectedCompany) {
    setState(() {
      _selectedCompany = selectedCompany;
    });
  }

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
final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
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
            child: Column(children: [
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
                        'Submit your Report',
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
                          labelText: " first and Last Name",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                          //fillColor: Colors.green
                        ),
                        validator: (val) {
                          if (val.length == 0) {
                            return "first and Last Name cannot be empty";
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
                        decoration: new InputDecoration(
                          labelText: " Tag",
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
                        keyboardType: TextInputType.emailAddress,
                        style: new TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),
                      new Padding(padding: EdgeInsets.only(top: 20.0)),
                      new TextFormField(
                        minLines: 5,
                        maxLines: 500,
                        decoration: new InputDecoration(
                          labelText: "Post Content",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(15.0),
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
                        height: 30,
                      ),
                      Text('Selected Media',
                          style: TextStyle(
                            color: Colors.black,
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        // width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.6)),
                              height: 200,
                              width: 150,
                              child: Center(
                                  child: _image == null
                                      ? Text('No image selected.')
                                      : Image.file(_image, fit: BoxFit.cover)),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.6)),
                                height: 200,
                                width: 130,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    if (_video != null)
                                      _videoPlayerController.value.initialized
                                          ? AspectRatio(
                                              aspectRatio:
                                                  _videoPlayerController
                                                      .value.aspectRatio,
                                              child: VideoPlayer(
                                                _videoPlayerController,
                                              ),
                                            )
                                          : Container()
                                    else
                                      Center(
                                        child: Text(
                                          "No video selected",
                                          style: TextStyle(fontSize: 15.0),
                                        ),
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
                          children: [
                            Text('Category',style: TextStyle(color: Colors.black)),
                            SizedBox(
                                width: MediaQuery.of(context).size.width / 3),
                            DropdownButton(
                              value: _selectedCompany,
                              items: _dropdownMenuItems,
                              onChanged: onChangeDropdownItem,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 140.0),
                        child: Text('Selected: ${_selectedCompany.name}'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text('Featured Image',style: TextStyle(color: Colors.black)),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                          ),
                          GestureDetector(
                            onTap: () {
                              getImage();
                            },
                            child: Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Color(0xFFbd1017),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Text('upload ',
                                      style: TextStyle(color: Colors.black))),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text('video (if any)',style: TextStyle(color: Colors.black)),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2.7,
                          ),
                          GestureDetector(
                            onTap: () {
                              _pickVideo();
                            },
                            child: Container(
                                height: 40,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Color(0xFFbd1017),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                    child: Text('upload ',
                                        style:
                                            TextStyle(color: Colors.black))),
                          )
                          )],
                      ),
                      SizedBox(
                        height: 15,
                      ),
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
                                             Text('''I'm not a robit'''),
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
                    ],
                  ),
                ),
              )))
        ])),
      ),
    );
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
