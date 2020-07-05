import 'package:flutter/material.dart';
import 'signupmodel.dart';
import 'package:validators/validators.dart' as validator;

class SignUpResult extends StatelessWidget {
  SignUpModel signUpModel;

  SignUpResult({this.signUpModel});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      body: Padding(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  MyTextFormField(
                    hintText: 'First Name',
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Enter your First Name';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      signUpModel.firstName = value;
                    },
                  ),
                  MyTextFormField(
                    hintText: 'Last Name',
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Enter your Last Name';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      signUpModel.lastName = value;
                    },
                  ),
                  MyTextFormField(
                    hintText: 'Email',
                    isEmail: true,
                    validator: (String value) {
                      if (!validator.isEmail(value)) {
                        return 'Enter a valid Email Address';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      signUpModel.email = value;
                    },
                  ),
                  MyTextFormField(
                    hintText: 'Create Password',
                    isPassword: true,
                    validator: (String value) {
                      if (value.length < 7) {
                        return 'Password must be a minimum of 7 characters';
                      }
                      _formKey.currentState.save();
                      return null;
                    },
                    onSaved: (String value) {
                      signUpModel.password = value;
                    },
                  ),
                  MyTextFormField(
                    hintText: 'Confirm Password',
                    isPassword: true,
                    validator: (String value) {
                      if (value.length < 7) {
                        return 'Password must be a minimum of 7 characters';
                      } else if (signUpModel.password != null &&
                          value != signUpModel.password) {
                        return 'Passwords do not match';
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 60,
                    width: double.infinity,
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
                      child: FlatButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            Navigator.pop(context);
                          }
                        },
                        shape: StadiumBorder(),
                        color: Colors.purple.shade700,
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
          ],
        ),
      ),
    );
  }
}

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final Function validator;
  final Function onSaved;
  final bool isPassword;
  final bool isEmail;

  MyTextFormField({
    this.hintText,
    this.validator,
    this.onSaved,
    this.isPassword = false,
    this.isEmail = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white38)),
          focusedBorder: new UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          contentPadding: EdgeInsetsDirectional.only(top: 24),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 15,
            color: Colors.white38,
          ),
        ),
        obscureText: isPassword ? true : false,
        validator: validator,
        onSaved: onSaved,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      ),
    );
  }
}
