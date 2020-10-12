import 'package:flutter/material.dart';
import 'package:tv24africa/pages/home_pageTabed.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();
    final emailController = TextEditingController();
    final commentController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFcc0000),
        title: Text("Contact Us"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Icon(Icons.home, color: Colors.white)),
          ),
        ],
      ),
      body: Column(
    
        children: [
          // Container(height: 100,),
          Text('Contact Us', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          Expanded(
              child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                          ),
                            labelText: 'first name',
                            labelStyle: TextStyle(fontSize: 15)),
                        controller: firstNameController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'FirstName Cannot be null';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height:10),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                          ),
                            labelText: 'last name',
                            labelStyle: TextStyle(fontSize: 15)),
                        controller: lastNameController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'LastName Cannot be empty';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height:10),
                      TextFormField(
                        decoration: InputDecoration(
                           border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                          ),
                            labelText: 'Email',
                            labelStyle: TextStyle(fontSize: 15)),
                        controller: emailController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Email Cannot be empty';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                          ),
                          contentPadding: new EdgeInsets.symmetric(vertical: 65.0, horizontal: 50.0),
                            labelText: 'Comments/Questions',
                            labelStyle: TextStyle(fontSize: 15)),
                        controller: commentController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Comments/Questions Cannot be empty';
                          }
                          return null;
                        },
                      )
                    ],
                  ),
                ),
              ),
             Container(  
              margin: EdgeInsets.all(25),  
              child: FlatButton(  
                height: 50,
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                child: Text('Send a Comment', style: TextStyle(fontSize: 14.0),),  
                color: Colors.black,  
                textColor: Colors.white,  
                onPressed: () {
                  
                },  
              ),  
            ), 
            ],
          ))
        ],
      ),
    );
  }
}
