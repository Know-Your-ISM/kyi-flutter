import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kyism/Model/Restaurant.dart';
import 'package:kyism/TabPages/Restaurants/showRestaurants.dart';

class Restaurants extends StatefulWidget {
  final Restaurant restaurant;
  Restaurants({this.restaurant});
  @override
  _RestaurantsState createState() => _RestaurantsState();
}

class _RestaurantsState extends State<Restaurants> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (BuildContext context, int index) { return ShowRestaurant(
      restaurantLocation: widget.restaurant.restaurantlocations[index],
    ); },itemCount: widget.restaurant.count,
      primary: false,
      shrinkWrap: true,
      padding: EdgeInsets.all(8),
      cacheExtent: 10,
      addAutomaticKeepAlives: true,
    );
  }
}
