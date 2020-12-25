import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String errors;
  ErrorPage({this.errors});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(middle: Text("Know Your ISM",style: TextStyle(color: Colors.white,letterSpacing: 1.5,fontFamily: 'RobotoSlab'),),backgroundColor: Colors.deepPurple[700],),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: <Widget>[
              Text("Error occurred,\nsorry for the inconvenience .",style: TextStyle(color: Colors.black,fontSize: 25),),
              Text("Following error Occurred :- .",style: TextStyle(color: Colors.black,fontSize: 25),),
              Text(errors,style: TextStyle(color: Colors.black,fontSize: 25),),
            ],
          ),
        ),
      ),
    );
  }
}
