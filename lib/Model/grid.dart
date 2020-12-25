import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kyism/Pages/HomePage.dart';
import 'package:kyism/Pages/Locations.dart';
import 'package:kyism/Pages/beta.dart';
class GridShow{
  GridShow({
    this.title,
    this.icon,
    this.page,
});
  String title;
  IconData icon;
  Widget page;
}


List<GridShow> grids = [
  GridShow(title: "Student Spy",icon: Icons.search,page: HomePage()),
  //GridShow(title: "Restaurants",icon:Icons.restaurant ,page:Beta()),
  //GridShow(title: "Clubs",icon: CupertinoIcons.group,page:Beta()),
  GridShow(title: "Pexels",icon: Icons.camera,page:Beta()),
  GridShow(title: "Locations",icon: Icons.location_on,page:Locations()),
GridShow(title: 'Update',icon: Icons.update,page:Beta()),
 // GridShow(title: "FAQ",icon: Icons.info_outline,page:Beta()),

];