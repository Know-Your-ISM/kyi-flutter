import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kyism/Model/Restaurant.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GetRestaurants extends StatefulWidget {
  @override
  _GetRestaurantsState createState() => _GetRestaurantsState();
}

class _GetRestaurantsState extends State<GetRestaurants> {

    Restaurant data;
Future<Restaurant> getRestaurant() async {
  String url = "https://kyi.herokuapp.com/api/locations/restaurant?";
  var response = await http.get(url);
  if(response.statusCode==200){
    final String cRestaurant = response.body;
    Restaurant initres= restaurantFromJson(cRestaurant);
    this.setState((){
        data=initres;
    });
    return data;
  }else{
    return null;
  }
}

  @override
  void initState(){
      super.initState();
    this.getRestaurant();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  PageView.builder(
        itemCount: data == null ? 0 : data.count,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index){
          return Locard(index:index,data:data);
        },
      ),
    );
  }
}

class Locard extends StatelessWidget {
    final int index;
    final Restaurant data;
    Locard({this.index,this.data});
  @override
  Widget build(BuildContext context) {
    return _buildRes(index,data);
  }
}

Widget _buildRes(int index,Restaurant data) {
    Future _mapFuture = Future.delayed(Duration(milliseconds: 1000), () => true);
    return FutureBuilder(
      future: _mapFuture,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container(
              child:Center(child: Text("Loading",textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color: CupertinoColors.black,fontFamily: "RobotoSlab",fontWeight: FontWeight.bold)), )
          );
        }
        return
        Card(elevation:2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          color: CupertinoColors.white,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: <Widget>[
                Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    elevation:10,
                    child: ClipRRect(borderRadius: BorderRadius.circular(16),
                        child:FadeInImage(image:NetworkImage(data.restaurantlocations[index].photo.medium), placeholder: AssetImage("assets/capture.png"),fit: BoxFit.cover,))),
                SizedBox(height: 6,),
                Text(data.restaurantlocations[index].name,textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color: CupertinoColors.black,fontFamily: "RobotoSlab",fontWeight: FontWeight.bold)),
                SizedBox(height: 6,),
                Text(data.restaurantlocations[index].propertyType,textAlign: TextAlign.center,style: TextStyle(fontSize: 12,color: CupertinoColors.darkBackgroundGray,)),
                SizedBox(height: 8,),
                Text(data.restaurantlocations[index].description,textAlign: TextAlign.center,style: TextStyle(fontSize: 14,color: CupertinoColors.systemGrey,fontStyle: FontStyle.italic)),
                SizedBox(height: 10,),
             Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*(1/3),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(16) ),
              child:ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: GoogleMap(
                  mapType: MapType.normal,
                  padding: EdgeInsets.all(20),
                  initialCameraPosition: CameraPosition(
                    target: LatLng(double.parse(data.restaurantlocations[index].coordinates.latitude),double.parse(data.restaurantlocations[index].coordinates.longitude)),
                    zoom: 17,
                  ),
                  compassEnabled: false,
                  scrollGesturesEnabled: false,
                  zoomGesturesEnabled: false,
                  myLocationEnabled: false,
                  myLocationButtonEnabled: false,
                  tiltGesturesEnabled: false,
                  rotateGesturesEnabled: false,
                  liteModeEnabled: true,
                  zoomControlsEnabled: false,
                  markers:Set.from([Marker(markerId: MarkerId(data.restaurantlocations[index].name), position:LatLng(double.parse(data.restaurantlocations[index].coordinates.latitude),double.parse(data.restaurantlocations[index].coordinates.longitude)), )]),
              ),
              ),
            ),
            SizedBox(height: 15,),
              ],
            ),
          )
);
}
    );
}