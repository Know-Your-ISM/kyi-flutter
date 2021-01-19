import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kyism/TabPages/Restaurants/getRestaurants.dart';
import 'package:kyism/TabPages/AddLocations/Add.dart';
import 'package:kyism/TabPages/CampusLocations/getLocations.dart';


class Locations extends StatefulWidget {
  @override
  _LocationsState createState() => _LocationsState();
}

class _LocationsState extends State<Locations> {
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CupertinoTabScaffold(
        tabBuilder: (BuildContext context, int index) { CupertinoTabView returnValue;
        switch (index){
          case 0:
            returnValue = CupertinoTabView(builder: (context){
              return CupertinoPageScaffold(
                backgroundColor: CupertinoColors.white,
                navigationBar: CupertinoNavigationBar(
                  backgroundColor: CupertinoColors.extraLightBackgroundGray,
                  middle: Text("Campus Location",style: TextStyle(color: CupertinoColors.black,letterSpacing: 1.5,fontFamily: 'RobotoSlab'),),
                ),
                child: GetCampus(),
              );
            });
            break;
          case 1:
            returnValue = CupertinoTabView(builder: (context){
              return CupertinoPageScaffold(
                backgroundColor: CupertinoColors.white,
                  navigationBar: CupertinoNavigationBar(
                    backgroundColor: CupertinoColors.extraLightBackgroundGray,
                    middle: Text("Restaurants",style:TextStyle(color: CupertinoColors.black,letterSpacing: 1.5,fontFamily: 'RobotoSlab'),),
                  ),
                child: GetRestaurants(),
              );
            });
            break;
          case 2:
            returnValue = CupertinoTabView(builder: (context){
              return CupertinoPageScaffold(
                backgroundColor: CupertinoColors.white,
                  navigationBar: CupertinoNavigationBar(
                    backgroundColor: CupertinoColors.extraLightBackgroundGray,
                    middle: Text("Add Location",style: TextStyle(color: CupertinoColors.black,letterSpacing: 1.5,fontFamily: 'RobotoSlab'),),
                  ),
                child: AddLocations(),
              );
            });
            break;
        }
        return returnValue;
           },
        tabBar: CupertinoTabBar(
          activeColor:CupertinoColors.activeBlue ,
          inactiveColor: CupertinoColors.inactiveGray,
          backgroundColor: CupertinoColors.extraLightBackgroundGray,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.location_solid),backgroundColor: CupertinoColors.white),
            BottomNavigationBarItem(icon: Icon(Icons.restaurant_menu),backgroundColor: CupertinoColors.white),
            BottomNavigationBarItem(icon: Icon(Icons.add_location),backgroundColor: CupertinoColors.white),
          ],
          onTap: ontapIndex,
          currentIndex: selectedIndex,
        ),


      ),
    );
  }
  void ontapIndex(int index){
    setState((){
      selectedIndex= index;
    });
  }
}

