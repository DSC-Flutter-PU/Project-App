import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Load extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: Center(
        child: SpinKitFadingCircle(
          color: Colors.blue,
          size: 50.0,
        )
        )
    );
  }
}

