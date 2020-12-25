import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AltLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: LinearGradient(colors: [CupertinoColors.extraLightBackgroundGray,CupertinoColors.inactiveGray], begin:Alignment.centerLeft,end: Alignment.centerRight),),
      child: Center(
        child: SpinKitFadingFour(
          color: CupertinoColors.activeBlue,
          size: 70.0,
        ),
      ),
    );
  }
}