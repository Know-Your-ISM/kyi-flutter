import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kyism/Model/Restaurant.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class RestaurantDetail extends StatefulWidget {
  final RestaurantLocation details;
  RestaurantDetail({this.details});
  @override
  _RestaurantDetailState createState() => _RestaurantDetailState();
}

class _RestaurantDetailState extends State<RestaurantDetail> {
  Completer<GoogleMapController> _controller = Completer();
  @override
  Widget build(BuildContext context) {
    return  Container(
      color:  CupertinoColors.white,
        child: SafeArea(
          child: CupertinoPageScaffold(
            backgroundColor: CupertinoColors.white,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children:<Widget>[
                  Center(child: Text(widget.details.name)),
                  Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      elevation:10,
                      child: ClipRRect(borderRadius: BorderRadius.circular(16),
                          child:FadeInImage(image:NetworkImage(widget.details.photo.medium), placeholder: AssetImage("assets/placeholder.jpg"),fit: BoxFit.cover,))),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      elevation: 8,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height*(1/3.5),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16) ),
                        child:ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: GoogleMap(
                            onMapCreated: (GoogleMapController controller) {_controller.complete(controller);},
                            mapType: MapType.normal, 
                            padding: EdgeInsets.all(20),
                            initialCameraPosition: CameraPosition(
                              target: LatLng(double.parse(widget.details.coordinates.latitude),double.parse(widget.details.coordinates.longitude)),
                              zoom: 17,
                            ),
                            compassEnabled: false,
                            scrollGesturesEnabled: true,
                            zoomGesturesEnabled: true,
                            myLocationEnabled: false,
                            myLocationButtonEnabled: false,
                            tiltGesturesEnabled: false,
                            rotateGesturesEnabled: false,
                            liteModeEnabled: true,
                            zoomControlsEnabled: true,
                            markers:Set.from([Marker(markerId: MarkerId(widget.details.name), position:LatLng(double.parse(widget.details.coordinates.latitude),double.parse(widget.details.coordinates.longitude)), )]), ),
                        ),
                      ),
                    ),
                  ),
                ]
              ),
            ),
          ),
        ),
      
    );
  }
}
