
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  )
                ),
            ),
            Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.0,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Email',
                            style: TextStyle(
                              color: Colors.white,),
                          ),
                          SizedBox(height: 10.0,),
                          Container(
                            alignment: Alignment.centerLeft,
                            
                            height: 60.0,
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(
                                color: Colors.white,),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14.0),
                                  prefixIcon: Icon(Icons.email,
                                  color: Colors.white,
                                  ),
                                  hintText: 'Enter your Email',
                                  hintStyle: TextStyle(
                                    color: Colors.white,)
                                  ), 
                              ) ,
                              ),
                        ],
                        ),
                        SizedBox(height: 30.0,),
                        Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Password',
                            style: TextStyle(
                              color: Colors.white),
                          ),
                          SizedBox(height: 10.0,),
                          Container(
                            alignment: Alignment.centerLeft,
                            
                            height: 60.0,
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(
                                color: Colors.white,),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14.0),
                                  prefixIcon: Icon(Icons.lock,
                                  color: Colors.white,
                                  ),
                                  hintText: 'Enter your Password',
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                  )
                                  ),                              
                              ) ,
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                child: FlatButton(
                                  onPressed: () => print('Forgot Password Button Pressed'),
                                  padding: EdgeInsets.only(right:0.0),
                                  child: Text(
                                    'Forgot Password',
                                    style: TextStyle(
                                      color: Colors.white,
                                      ),
                                  ),
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Theme(data: ThemeData(unselectedWidgetColor: Colors.white),
                                      child: Checkbox(
                                        value: _rememberMe, 
                                        checkColor: Colors.black, 
                                        activeColor: Colors.white,
                                        onChanged: (value) {
                                          setState(() {
                                            _rememberMe = value;
                                          });
                                        },
                                        ),
                                      ),
                                      Text(
                                        'Remember Me',
                                        style: TextStyle(
                                          color: Colors.white,),
                                      ),
                                    ],
                                  ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 25.0),
                                    width: double.infinity,
                                    child: RaisedButton(
                                      elevation: 5.0,
                                      onPressed: () => print('Login Button Pressed'),
                                      padding: EdgeInsets.all(15.0),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),
                                      ),
                                      color: Colors.white,
                                      child: Text(
                                        'Login',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          letterSpacing: 1.0,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                           ),
                                      ),
                                    ),
                                    ),
                                    GestureDetector(
                                      onTap: () => print('Sign Up Button Pressed'),
                                        child: RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Don\'t have an Account?',
                                              style: TextStyle(
                                                
                                                color: Colors.white,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                             TextSpan(
                                              text: 'Login',
                                              style: TextStyle(
                                                
                                                color: Colors.white,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                        ],
                        ),

                    ],
                    ),
                ),
            )
    ],
    ),
              ),
      ),
    );
  }
}
