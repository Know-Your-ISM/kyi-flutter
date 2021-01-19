import 'package:flutter/material.dart';
import 'package:kyism/Model/User.dart';
import 'package:kyism/Model/model.dart';
import 'package:kyism/Pages/userList.dart';
import 'package:kyism/Services/Search.dart';

import 'Loading.dart';
import 'NoUser.dart';
import 'errorPage.dart';

class Process extends StatelessWidget {
  Process({this.name,this.geoState,this.house,this.branch,this.club});
  final String name;
  final GeoState geoState;
  final House house;
  final Branch branch;
  final Club club;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
      if( snapshot.connectionState==ConnectionState.waiting){
        return Loading();
      }else{
        if(snapshot.hasError){
          return ErrorPage(errors: snapshot.error.toString(),);
        }
        else{
          if(snapshot.data==null){
            return NoUser();
          }else{
            return UserList(allusers: snapshot.data,);
          }
        }
      }
    },
      future: getUser(name, geoState,house,branch,club),
    );
  }
}
