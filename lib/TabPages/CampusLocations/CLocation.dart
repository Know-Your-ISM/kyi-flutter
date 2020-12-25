import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kyism/Model/Campus.dart';
import 'package:kyism/TabPages/CampusLocations/showcaseCampus.dart';

class CampusLocation extends StatefulWidget {
  final Campus campus;
  CampusLocation({this.campus});
  @override
  _CampusLocationState createState() => _CampusLocationState();
}

class _CampusLocationState extends State<CampusLocation> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (BuildContext context, int index) { return ShowCampus(
      campusLocation: widget.campus.locations[index],
    ); },itemCount: widget.campus.count,
      primary: false,
      shrinkWrap: true,
    padding: EdgeInsets.all(8),
      cacheExtent: 15,
      addAutomaticKeepAlives: true,
    );
  }
}
