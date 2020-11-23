import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:tv24africa/screens/settinng.dart';

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

//  File _image;
//    final picker = ImagePicker();

// Future getImage() async {
// final pickedFile = await picker.getImage(source: ImageSource.camera);

// setState(() {
//     _image = File(pickedFile.path);
//   });
// }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          labelText: "Add a commment",
                          fillColor: Colors.white,
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
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text('Category'),
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
                          Text('Featured Image'),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                          ),
                          GestureDetector(
                            child: Container(
                                height: 30,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Color(0xFFbd1017),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                    child: Text('upload an image',
                                        style:
                                            TextStyle(color: Colors.white)))),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text('video (if any)'),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2.7,
                          ),
                          GestureDetector(
                            child: Container(
                                height: 30,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Color(0xFFbd1017),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                    child: Text('upload a video',
                                        style:
                                            TextStyle(color: Colors.white)))),
                          )
                        ],
                      ),
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
