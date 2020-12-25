import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kyism/Model/Restaurant.dart';
import 'package:kyism/Pages/errorPage.dart';
import 'package:kyism/TabPages/Restaurants/Restaurants.dart';
import 'package:kyism/Pages/altLoading.dart';

class GetRestaurants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(builder: (BuildContext context, AsyncSnapshot<Restaurant> snapshot) {
      if( snapshot.connectionState==ConnectionState.waiting){
        return AltLoading();
      }else{
        if(snapshot.hasError){
          return ErrorPage(
            errors: snapshot.error.toString(),
          );
        }
        else{
          return Restaurants(restaurant: snapshot.data,);
        }
      }
    },
      future: getRestaurant(),
    );
  }
}


Future<Restaurant> getRestaurant() async {
  String url = "https://kyi.herokuapp.com/api/locations/restaurant?";
  var response = await http.get(url);
  if(response.statusCode==200){
    final String restaurant = response.body;
    return restaurantFromJson(restaurant);
  }else{
    return null;
  }
}