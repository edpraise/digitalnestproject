import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:tv24africa/screens/settinng.dart';

class Rating extends StatefulWidget {
  @override
  _RatingState createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  var myFeedbackText = "COULD BE BETTER";
  var sliderValue = 0.0;
  IconData myFeedback = FontAwesomeIcons.sadTear;
  Color myFeedbackColor = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xffE5E5E5),
        child: Column(
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height / 4),
            Container(
              child: Align(
                child: Material(
                  color: Colors.white,
                  elevation: 14.0,
                  borderRadius: BorderRadius.circular(24.0),
                  shadowColor: Color(0x802196F3),
                  child: Container(
                      width: 350.0,
                      height: 400.0,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                                child: Text(
                              myFeedbackText,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 22.0),
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                child: Icon(
                              myFeedback,
                              color: myFeedbackColor,
                              size: 100.0,
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Slider(
                                min: 0.0,
                                max: 5.0,
                                divisions: 5,
                                value: sliderValue,
                                activeColor: Color(0xFFbd1017),
                                inactiveColor: Colors.blueGrey,
                                onChanged: (newValue) {
                                  setState(() {
                                    sliderValue = newValue;
                                    if (sliderValue >= 0.0 &&
                                        sliderValue <= 1.0) {
                                      myFeedback = FontAwesomeIcons.sadTear;
                                      myFeedbackColor = Colors.red;
                                      myFeedbackText = "COULD BE BETTER?";
                                    }
                                    if (sliderValue >= 1.1 &&
                                        sliderValue <= 2.0) {
                                      myFeedback = FontAwesomeIcons.frown;
                                      myFeedbackColor = Colors.yellow;
                                      myFeedbackText = "BELOW AVERAGE?";
                                    }
                                    if (sliderValue >= 2.1 &&
                                        sliderValue <= 3.0) {
                                      myFeedback = FontAwesomeIcons.meh;
                                      myFeedbackColor = Colors.amber;
                                      myFeedbackText = "NORMAL?";
                                    }
                                    if (sliderValue >= 3.1 &&
                                        sliderValue <= 4.0) {
                                      myFeedback = FontAwesomeIcons.smile;
                                      myFeedbackColor = Colors.green;
                                      myFeedbackText = "GOOD?";
                                    }
                                    if (sliderValue >= 4.1 &&
                                        sliderValue <= 5.0) {
                                      myFeedback = FontAwesomeIcons.laugh;
                                      myFeedbackColor = Color(0xffff520d);
                                      myFeedbackText = "EXCELLENT?";
                                    }
                                  });
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                                child: Text(
                              "Your Rating: $sliderValue",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                child: Align(
                              alignment: Alignment.bottomCenter,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0)),
                                color: Color(0xffff520d),
                                child: Text(
                                  'Submit',
                                  style: TextStyle(color: Color(0xffffffff)),
                                ),
                                onPressed: () {
                                 
                                },
                              ),
                            )),
                          ),
                        ],
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    
  }
}
