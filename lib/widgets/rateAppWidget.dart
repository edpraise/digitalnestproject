import 'package:flutter/material.dart';
import 'package:rate_my_app/rate_my_app.dart';

class RateApp extends StatefulWidget {
  @override
  _RateAppState createState() => _RateAppState();
}

class _RateAppState extends State<RateApp> {
   RateMyApp _rateMyApp = RateMyApp(
    preferencesPrefix: 'rateMyApp_',
    minDays: 1,
    minLaunches: 1,
    remindDays: 2,
    remindLaunches: 2,
  );
    @override
  void initState() {
    super.initState();
    _rateMyApp.init().then((_) {
      if (_rateMyApp.shouldOpenDialog) {
        _rateMyApp.showStarRateDialog(context,
            title: 'Enjoying Tv24?',
            message: 'please leave a rating to help us serve you better',
            onRatingChanged: (stars) {
          return [
            FlatButton(
                onPressed: () {
                  if (stars != null) {
                    _rateMyApp.doNotOpenAgain = true;
                    _rateMyApp.save().then((v) => Navigator.pop(context));

                    if (stars <= 3) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => RateApp()));
                    } else {}
                  } else {
                    Navigator.pop(context);
                  }
                },
                child: Text('Okay'))
          ];
        },
            dialogStyle: DialogStyle(
              titleAlign: TextAlign.center,
              messageAlign: TextAlign.center,
              messagePadding: EdgeInsets.only(bottom: 20),
            ),
            starRatingOptions: StarRatingOptions());
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child:RateApp()
    );
  }
}