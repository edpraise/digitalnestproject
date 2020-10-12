import 'package:flutter/material.dart';

    class CustomD extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
        return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: dialogContent(context),
        );
    }

    Widget dialogContent(BuildContext context) {
        return Container(
        margin: EdgeInsets.only(left: 0.0,right: 0.0),
        child: Stack(
            children: <Widget>[
            Container(
                padding: EdgeInsets.only(
                top: 18.0,
                ),
                margin: EdgeInsets.only(top: 13.0,right: 8.0),
                decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 0.0,
                        offset: Offset(0.0, 0.0),
                    ),
                    ]),
                child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                    SizedBox(
                    height: 20.0,
                    ),
                     Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\nTv24Africa  is the flagship company owned by News Media Africa set up to tell the African stories in ways never told and to give the African people the chance for their views, voices, \nideas and perspectives to be heard globally.\nContact us: News@tv24africa.com\n\n Version 1.10\n@2020',
                    style: TextStyle(fontSize: 17, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                    // Center(
                    //     child: Padding(
                    //     padding: const EdgeInsets.all(10.0),
                    //     child: new Text("English \n your language has been set to english by default", style:TextStyle(fontSize: 15.0,color: Colors.white)),
                    //     )//
                    // ),
                    SizedBox(height: 24.0),
                    InkWell(
                    child: Container(
                        padding: EdgeInsets.only(top: 15.0,bottom:15.0),
                        decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16.0),
                            bottomRight: Radius.circular(16.0)),
                        ),
                        child:  Text(
                        "OK",
                        style: TextStyle(color: Colors.blue,fontSize: 20.0),
                        textAlign: TextAlign.center,
                        ),
                    ),
                    onTap:(){
                        Navigator.pop(context);
                    },
                    )
                ],
                ),
            ),
            Positioned(
                right: 0.0,
                child: GestureDetector(
                onTap: (){
                    Navigator.of(context).pop();
                },
                child: Align(
                    alignment: Alignment.topRight,
                    child: CircleAvatar(
                    radius: 14.0,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.close, color: Colors.red),
                    ),
                ),
                ),
            ),
            ],
        ),
        );
    }
    }