import 'package:employeeapp/screens/register.dart';
import 'package:employeeapp/services/authentication.dart';
import 'package:employeeapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  Login({this.auth, this.loginCallback});

  final BaseAuth auth;
  final VoidCallback loginCallback;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool _rememberME = false;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  void auth(String email, String password) async {
    String userId = "";

    try {
      userId = await widget.auth.signIn(email, password);
      print('Signed in: $userId');

      if (userId.length > 0 && userId != null) {
        widget.loginCallback();
      }
    } catch (e) {
      print('Error: $e');

      scaffoldKey.currentState.showSnackBar(SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text(
          e.message,
          style: TextStyle(color: Colors.white),
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF73AEF5),
                    Color(0xFF61A4F1),
                    Color(0xFF478DE0),
                    Color(0xFF398AE5),
                  ],
                  stops: [0.1, 0.4, 0.7, 0.9],
                )),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    vertical: 120.0,
                    horizontal: 40.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Text(
                          'Sign In',
                          style: titleTextStyle,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Email', style: textFieldLabelStyle),
                          SizedBox(height: 10.0),
                          Container(
                            alignment: Alignment.centerLeft,
                            height: 60.0,
                            child: TextField(
                              controller: emailController,
                              onEditingComplete: () {
                                String email = emailController.text;
                                // todo perform checks
                              },
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.only(top: 14.0),
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Colors.white,
                                  ),
                                  hintText: 'Enter your Email',
                                  hintStyle: hintTextStyle),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Password',
                            style: textFieldLabelStyle,
                          ),
                          SizedBox(height: 10.0),
                          Container(
                            alignment: Alignment.centerLeft,
                            height: 60.0,
                            child: TextField(
                              controller: passwordController,
                              onEditingComplete: () {
                                String password = passwordController.text;
                                // todo perform checks
                              },
                              obscureText: true,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                contentPadding: EdgeInsets.only(top: 14.0),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.white,
                                ),
                                hintText: 'Enter your Password',
                                hintStyle: hintTextStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: FlatButton(
                          onPressed: () =>
                              print('Forgot Password Button Pressed'),
                          padding: EdgeInsets.only(right: 5.0),
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Theme(
                              data: ThemeData(
                                  unselectedWidgetColor: Colors.white),
                              child: Checkbox(
                                value: _rememberME,
                                checkColor: Colors.black,
                                activeColor: Colors.white,
                                onChanged: (value) {
                                  setState(() {
                                    _rememberME = value;
                                  });
                                },
                              ),
                            ),
                            Text(
                              'Remember me',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 25.0),
                        width: double.infinity,
                        child: RaisedButton(
                          elevation: 10.0,
                          onPressed: () {
                            String email = emailController.text.trim();
                            String password = passwordController.text;

                            auth(email, password);
                          },
                          padding: EdgeInsets.all(15.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          color: Colors.white,
                          child: Text(
                            'Log In',
                            style: TextStyle(
                              color: Colors.grey,
                              letterSpacing: 1.0,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 25.0),
                        width: double.infinity,
                        child: RaisedButton(
                          elevation: 10.0,
                          onPressed: () =>
                              print('Login with Google Button Pressed'),
                          padding: EdgeInsets.all(15.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          color: Colors.white,
                          child: Text(
                            'Log In with Google',
                            style: TextStyle(
                              color: Colors.grey,
                              letterSpacing: 1.0,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register(
                                        auth: widget.auth,
                                      )));
                        },
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: 'Don\'t have an Account? ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: 'SignUp',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
