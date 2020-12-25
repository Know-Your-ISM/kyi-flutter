import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kyism/Model/grid.dart';
import 'dart:math' as math;

class Show extends StatelessWidget {
  final GridShow item;
  Show({this.item});
  @override

  Widget build(BuildContext context) {
    Color color= Color((math.Random().nextDouble() *0xFFFFFF).toInt()
    );
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: color.withOpacity(0.2),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap:()=>Navigator.of(context).push(CupertinoPageRoute(builder: (context) =>item.page)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(item.icon,size: 40,color: CupertinoColors.black,),
              Text(item.title,textAlign: TextAlign.center,style: TextStyle(color: CupertinoColors.black,fontStyle: FontStyle.italic,fontSize: 14,fontWeight: FontWeight.bold,fontFamily: "RobotoSlab"),)
            ],
          ),
        ),
      ),
    );
  }
}
