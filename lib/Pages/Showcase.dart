import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kyism/Model/User.dart';
import 'package:kyism/Pages/userDetails.dart';

class Showcase extends StatelessWidget {
  final Student student;
  Showcase({this.student});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          child: ListTile(
            leading: ClipOval(
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape:BoxShape.circle,
                  color: Colors.black
                ),
                child: student.sex=="F"?FadeInImage(placeholder: AssetImage("assets/images.png"), image: NetworkImage(student.avatarUrl),fit: BoxFit.cover,):FadeInImage(placeholder: AssetImage("assets/vector.jpg"), image: NetworkImage(student.avatarUrl),fit: BoxFit.cover,),
              ),
            ),title: Text(student.name,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 14,fontFamily: 'RobotoSlab'),),
            subtitle: Column(children: <Widget>[
              SizedBox(height: 5,),
              Row(children: <Widget>[
                Icon(Icons.bookmark,color: Colors.grey,size: 15,),
                SizedBox(width: 5,),
                Text(student.department!=""?student.department:"NA",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black,fontSize: 12),),
              ],),
              SizedBox(height: 2,),
              Row(children: <Widget>[
                Icon(CupertinoIcons.location_solid,color: Colors.grey,size: 15,),
                SizedBox(width: 5,),
            Text(student.city!=""?student.city+",":"NA",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black,fontSize: 12),),
                SizedBox(width: 5,),
                Text(student.state!=""?student.state:"NA",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black,fontSize: 12),)
              ],),
              SizedBox(height: 5,)
            ],),
            onTap: (){Navigator.push((context),CupertinoPageRoute(builder: (context) => ProfileSecond(student:student)));},
          ),
        ),
      ],
    );
  }
}
