import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Beta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(middle: Text("Work in Progress"),),
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.not_interested,size:60,),
              SizedBox(height: 10,),
              Center(child: Text("Locked for Beta Version!",style: TextStyle(color: Colors.black,fontSize: 30,fontFamily: "Pacifico",fontWeight: FontWeight.bold),textAlign: TextAlign.center))
            ],
          ),
        ),
      ),
    );
  }
}
