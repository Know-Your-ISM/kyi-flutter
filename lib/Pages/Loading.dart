import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0XFF0C78D5),Color(0XFF0D93C1),Color(0XFF0EAFAD)], begin:Alignment.centerLeft,end: Alignment.centerRight),),
      child: Center(
        child: SpinKitFadingFour(
          color: Colors.black,
          size: 70.0,
        ),
      ),
    );
  }
}
