import 'package:flutter/material.dart';
import 'package:validators/validators.dart' as validator;
import 'model.dart';
import 'result.dart';
import 'signupmodel.dart';
import 'signupresult.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Design(),
    );
  }
}

class Design extends StatefulWidget {
  @override
  _DesignState createState() => _DesignState();
}

class _DesignState extends State<Design> {
  final _formKey = GlobalKey<FormState>();
  Model model = Model();
  SignUpModel signUpModel = SignUpModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade900,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: <Widget>[
            Container(
              height: screenHeight(context, percent: 0.3),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Good Morning!',
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
                    'Welcome back.',
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
            SizedBox(
              height: 10,
              width: double.infinity,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  UsernameRow(
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Enter your UserName';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (String value) {
                      model.username = value;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  PasswordRow(
                    isPassword: true,
                    validator: (String value) {
                      if (value.length < 7) {
                        return 'Password should be a minimum of 7 characters';
                      } else {
                        _formKey.currentState.save();
                        return null;
                      }
                    },
                    onSaved: (String value) {
                      model.password = value;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(top: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'Forgot password or username?',
                          style: TextStyle(
                            color: Colors.white38,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                  ),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                  height: 50,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
                    child: RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Result(
                                model: this.model,
                              ),
                            ),
                          );
                        }
                      },
                      shape: StadiumBorder(),
                      color: Colors.purpleAccent,
                      child: new Text(
                        'Login',
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
            SizedBox(
              height: 20,
              width: double.infinity,
            ),
            Container(
              height: 60,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SignUpResult(signUpModel: this.signUpModel)));
                  },
                  shape: StadiumBorder(),
                  child: new Text(
                    'Sign Up',
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

class PasswordRow extends StatelessWidget {
  final Function validator;
  final Function onSaved;
  final bool isPassword;

  PasswordRow({
    this.validator,
    this.onSaved,
    this.isPassword = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsetsDirectional.only(top: 24),
          child: Icon(
            Icons.lock,
            color: Colors.white38,
            size: 22,
          ),
        ),
        SizedBox(width: 10),
        Flexible(
          child: TextFormField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white38)),
              focusedBorder: new UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              contentPadding: EdgeInsetsDirectional.only(top: 24),
              suffixIcon: Padding(
                padding: const EdgeInsetsDirectional.only(top: 24),
                child: Icon(
                  Icons.remove_red_eye,
                  color: Colors.white38,
                  size: 22,
                ),
              ),
              hintText: 'Password',
              hintStyle: TextStyle(
                fontSize: 15,
                color: Colors.white38,
              ),
            ),
            obscureText: isPassword ? true : false,
            validator: validator,
            onSaved: onSaved,
          ),
        ),
      ],
    );
  }
}

class UsernameRow extends StatelessWidget {
  final Function validator;
  final Function onSaved;

  UsernameRow({
    this.validator,
    this.onSaved,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsetsDirectional.only(top: 24),
          child: Icon(
            Icons.person,
            color: Colors.white38,
            size: 23,
          ),
        ),
        SizedBox(width: 10),
        Flexible(
          child: TextFormField(
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white38)),
              focusedBorder: new UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              contentPadding: EdgeInsetsDirectional.only(top: 24),
              hintText: 'Username',
              hintStyle: TextStyle(
                fontSize: 15,
                color: Colors.white38,
              ),
            ),
            validator: validator,
            onSaved: onSaved,
          ),
        ),
      ],
    );
  }
}
