import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kyism/Model/Campus.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GetCampus extends StatefulWidget {
  @override
  _GetCampusState createState() => _GetCampusState();
}

class _GetCampusState extends State<GetCampus> {
Campus data;
    Future<Campus> getCLocation() async {
  String url = "https://kyi.herokuapp.com/api/locations/college?";
  var response = await http.get(url);
  if(response.statusCode==200){
    final String cLocation = response.body;
    Campus initialcampus=campusFromJson(cLocation);
    this.setState(() {
        data=initialcampus;
    });
    return data;
  }else{
    return null;
  }
}
  @override
  void initState(){
      super.initState();
    this.getCLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  PageView.builder(
        itemCount: data == null ? 0 : data.count,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index){
          return Rescard(index:index,data:data);
        },
      ),
    );
  }
}

class Rescard extends StatelessWidget {
    final int index;
    final Campus data;
    Rescard({this.index,this.data});
  @override
  Widget build(BuildContext context) {
    return _buildMap(index,data);
  }
}

      Widget _buildMap(int index,Campus data) {
Future _mapFuture = Future.delayed(Duration(milliseconds: 1000), () => true);
    return FutureBuilder(
      future: _mapFuture,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container(
              child:Center(child: Text("Loading",textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color: CupertinoColors.black,fontFamily: "RobotoSlab",fontWeight: FontWeight.bold)), )
          );
        }
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
                    child:FadeInImage(image:NetworkImage(data.locations[index].photo.medium), placeholder: AssetImage("assets/capture.png"),fit: BoxFit.cover,))),
            SizedBox(height: 10,),
            Text(data.locations[index].name,textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color: CupertinoColors.black,fontFamily: "RobotoSlab",fontWeight: FontWeight.bold)),
            SizedBox(height: 10,),
            Text(data.locations[index].propertyType,textAlign: TextAlign.center,style: TextStyle(fontSize: 12,color: CupertinoColors.darkBackgroundGray,)),
            SizedBox(height: 10,),
            Text(data.locations[index].description,textAlign: TextAlign.center,style: TextStyle(fontSize: 14,color: CupertinoColors.systemGrey,fontStyle: FontStyle.italic)),
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
                    target: LatLng(double.parse(data.locations[index].coordinates.latitude),double.parse(data.locations[index].coordinates.longitude)),
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
                  markers:Set.from([Marker(markerId: MarkerId(data.locations[index].name), position:LatLng(double.parse(data.locations[index].coordinates.latitude),double.parse(data.locations[index].coordinates.longitude)), )]),
              ),
              ),
            ),
            SizedBox(height: 15,),
          ],
        ),
      )
    );
      },
    );
  }