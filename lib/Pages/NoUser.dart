import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(middle: Text("Know Your ISM",style: TextStyle(color: Colors.white,letterSpacing: 1.5,fontFamily: 'RobotoSlab'),),backgroundColor: Colors.deepPurple[700],),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: <Widget>[
              Text("404 Not Found ! .",style: TextStyle(color: Colors.black,fontSize: 25),),
              Text("No User found of those Credentials",style: TextStyle(color: Colors.black,fontSize: 25),),
            ],
          ),
        ),
      ),
    );
  }
}