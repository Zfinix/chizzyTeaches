import 'package:flutter/material.dart';
import 'model.dart';

class Result extends StatelessWidget {
  Model model;

  Result({this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade900,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: <Widget>[
            Container(
              height: screenHeight(context, percent: 0.4),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Hi there,',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    model.username,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 30,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      'Username: ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      model.username,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight(context, percent: 0.1),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Password: ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      model.password,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: screenHeight(context, percent: 0.2),
            ),
            Container(
              height: 60,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  shape: StadiumBorder(),
                  color: Colors.purpleAccent,
                  child: new Text(
                    'Back',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

double screenHeight(BuildContext context, {double percent = 1}) =>
    MediaQuery.of(context).size.height * percent;

double screenWidth(BuildContext context, {double percent = 1}) =>
    MediaQuery.of(context).size.width * percent;
