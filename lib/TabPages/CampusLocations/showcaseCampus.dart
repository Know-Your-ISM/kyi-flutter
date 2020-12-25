import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kyism/Model/Campus.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShowCampus extends StatefulWidget {
  final Location campusLocation;
  ShowCampus({this.campusLocation});
  @override
  _ShowCampusState createState() => _ShowCampusState();
}

class _ShowCampusState extends State<ShowCampus> {
  Completer<GoogleMapController> _controller = Completer();
  @override
  Widget build(BuildContext context) {
    return Card(
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
                    child:FadeInImage(image:NetworkImage(widget.campusLocation.photo.medium), placeholder: AssetImage("assets/placeholder.jpg"),fit: BoxFit.cover,))),
            SizedBox(height: 6,),
            Text(widget.campusLocation.name,textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color: CupertinoColors.black,fontFamily: "RobotoSlab",fontWeight: FontWeight.bold)),
            SizedBox(height: 6,),
            Text(widget.campusLocation.propertyType,textAlign: TextAlign.center,style: TextStyle(fontSize: 12,color: CupertinoColors.darkBackgroundGray,)),
            SizedBox(height: 8,),
            Text(widget.campusLocation.description,textAlign: TextAlign.center,style: TextStyle(fontSize: 14,color: CupertinoColors.systemGrey,fontStyle: FontStyle.italic)),
            SizedBox(height: 10,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*(1/4),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(16) ),
              child:ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: GoogleMap(
                  onMapCreated: (GoogleMapController controller) {_controller.complete(controller);},
                  mapType: MapType.normal,
                  padding: EdgeInsets.all(20),
                  initialCameraPosition: CameraPosition(
                    target: LatLng(double.parse(widget.campusLocation.coordinates.latitude),double.parse(widget.campusLocation.coordinates.longitude)),
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
                  markers:Set.from([Marker(markerId: MarkerId(widget.campusLocation.name), position:LatLng(double.parse(widget.campusLocation.coordinates.latitude),double.parse(widget.campusLocation.coordinates.longitude)), )]), ),
              ),
              ),
            SizedBox(height: 10,),
          ],
        ),
      )
    );
  }
}
