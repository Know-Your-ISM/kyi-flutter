import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kyism/Model/Restaurant.dart';

import 'package:kyism/TabPages/Restaurants/RestaurantDetails.dart';
class ShowRestaurant extends StatefulWidget {
  final RestaurantLocation restaurantLocation;
  ShowRestaurant({this.restaurantLocation});
  @override
  _ShowRestaurantState createState() => _ShowRestaurantState();
}

class _ShowRestaurantState extends State<ShowRestaurant> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(CupertinoPageRoute(builder: (context) =>RestaurantDetail(details: widget.restaurantLocation,)));
      },
      child: Card(
          elevation:2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          color: CupertinoColors.white,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: <Widget>[
                Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    elevation:10,
                    child: ClipRRect(borderRadius: BorderRadius.circular(16),
                        child:FadeInImage(image:NetworkImage(widget.restaurantLocation.photo.medium), placeholder: AssetImage("assets/placeholder.jpg"),fit: BoxFit.cover,))),
                SizedBox(height: 6,),
                Text(widget.restaurantLocation.name,textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color: CupertinoColors.black,fontFamily: "RobotoSlab",fontWeight: FontWeight.bold)),
                SizedBox(height: 6,),
                Text(widget.restaurantLocation.propertyType,textAlign: TextAlign.center,style: TextStyle(fontSize: 12,color: CupertinoColors.darkBackgroundGray,)),
                SizedBox(height: 8,),
                Text(widget.restaurantLocation.description,textAlign: TextAlign.center,style: TextStyle(fontSize: 14,color: CupertinoColors.systemGrey,fontStyle: FontStyle.italic)),
                SizedBox(height: 10,),
              ],
            ),
          )
      ),
    );;
  }
}
