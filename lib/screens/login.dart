import 'package:flutter/material.dart';
import 'package:samplehitch/constants/login_constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:samplehitch/constants/theme_constants.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';
import 'package:samplehitch/backend/userdata.dart';
import 'package:samplehitch/screens/start_page.dart';

class LoginScreen extends StatefulWidget {
  static final String id = 'login_screen_id';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  UserData globalUserData = UserData();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  String kloginErrorMessage = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/loginpage_bg1.jpg'),
                fit: BoxFit.fill,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Container(
                      color: Colors.black54,
                    ),
                    Column(
                      children: <Widget>[
                        const SizedBox(height: 50.0),
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Hero(
                                tag: 'hitchLogo',
                                child: Text(
                                  "Hitch",
                                  style: TextStyle(
                                    fontFamily: 'Spartan',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 80.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                width: 250.0,
                                child: khitchTagline,
                              ),
                              SizedBox(
                                height: 280.0,
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(20)),
                                      ),
                                      padding: const EdgeInsets.all(30.0),
                                      //color: Colors.white,
                                      child: KeyboardAvoider(
                                        autoScroll: true,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            SizedBox(height: 20.0),
                                            TextFormField(
                                              controller: _usernameController,
                                              decoration: InputDecoration(
                                                labelText: "Enter Username",
                                                fillColor: Colors.white,
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(25.0),
                                                  borderSide: new BorderSide(),
                                                ),
                                                //fillColor: Colors.green
                                              ),
                                              validator: (val) {
                                                if (val.length == 0) {
                                                  return "Username cannot be empty";
                                                } else {
                                                  return null;
                                                }
                                              },
                                              keyboardType: TextInputType.text,
                                              style: TextStyle(
                                                fontFamily: "Sanchez",
                                              ),
                                            ),
                                            SizedBox(height: 20.0),
                                            TextFormField(
                                              controller: _passwordController,
                                              obscureText: true,
                                              decoration: InputDecoration(
                                                hoverColor: Colors.black,
                                                labelText: "Enter Password",
                                                fillColor: Colors.white,
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(25.0),
                                                  borderSide: new BorderSide(),
                                                ),
                                                //fillColor: Colors.green
                                              ),
                                              validator: (val) {
                                                if (val.length == 0) {
                                                  return "Password cannot be empty";
                                                } else {
                                                  return null;
                                                }
                                              },
                                              keyboardType: TextInputType.text,
                                              style: TextStyle(
                                                fontFamily: "Sanchez",
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(
                                                kloginErrorMessage,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: kloginErrorMessage ==
                                                          'Welcome'
                                                      ? Colors.green
                                                      : Colors.red,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15.0,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ///////////////////////////

                        Row(
                          children: <Widget>[
                            Expanded(
                              child: RaisedButton(
                                child: Text('Signup'),
                                onPressed: () {},
                                color: kYellow,
                                textColor: Colors.black,
                                elevation: 3.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                            SizedBox(width: 10.0),
                            Expanded(
                              child: RaisedButton(
                                child: Text('Login'),
                                onPressed: () {
                                  setState(() {
                                    if (_formKey.currentState.validate()) {
                                      if (globalUserData
                                              .loginDB[_usernameController.text]
                                              ?.getPw() ==
                                          _passwordController.text) {
                                        print('validated');
                                        kloginErrorMessage = 'Welcome';
                                        Navigator.pushNamed(
                                            context, StartPage.id);
                                      } else {
                                        kloginErrorMessage =
                                            'Username and password do not match';
                                      }
                                    }
                                  });
                                },
                                color: Color(0xff682477),
                                textColor: Colors.black,
                                elevation: 3.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                        OutlineButton.icon(
                          onPressed: () {},
                          borderSide: BorderSide(color: kMaroon),
                          textColor: Colors.white,
                          icon: Icon(FontAwesomeIcons.google),
                          label: Text('SignUp'),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                        ),
                        SizedBox(height: 20.0),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
