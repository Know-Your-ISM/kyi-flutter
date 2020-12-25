import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kyism/Model/Campus.dart';
import 'package:kyism/Pages/altLoading.dart';
import 'package:kyism/Pages/errorPage.dart';
import 'package:kyism/TabPages/CampusLocations/CLocation.dart';

class GetCampus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(builder: (BuildContext context, AsyncSnapshot<Campus> snapshot) {
      if( snapshot.connectionState==ConnectionState.waiting){
        return AltLoading();
      }else{
        if(snapshot.hasError){
          return ErrorPage(
            errors: snapshot.error.toString(),
          );
        }
        else{
          return CampusLocation(campus: snapshot.data,);
        }
      }
    },
      future: getCLocation(),
    );
  }
}

Future<Campus> getCLocation() async {
  String url = "https://kyi.herokuapp.com/api/locations/college?";
  var response = await http.get(url);
  if(response.statusCode==200){
    final String cLocation = response.body;
    return campusFromJson(cLocation);
  }else{
    return null;
  }
}