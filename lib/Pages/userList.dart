import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kyism/Model/User.dart';
import 'package:kyism/Pages/Showcase.dart';

class UserList extends StatefulWidget {
  final User allusers;
  UserList({this.allusers});
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: CupertinoPageScaffold(
          backgroundColor: Colors.white,
        navigationBar: CupertinoNavigationBar(middle: Text("Know Your ISM",style: TextStyle(color: Colors.white,letterSpacing: 1.5,fontFamily: 'RobotoSlab'),),backgroundColor: Colors.deepPurple[700],),
    child: ListView.builder(itemBuilder: (BuildContext context, int index) { return Showcase(
      student: widget.allusers.students[index],
    ); },
      itemCount: widget.allusers.count,
      primary: false,
      shrinkWrap: true,
    ),
    ),);
  }
}
