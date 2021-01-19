import 'package:kyism/Model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

  List<DropdownMenuItem<House>> buildDropDownMenuHouse(List houses) {
    List<DropdownMenuItem<House>> items = List();
    for (House house in houses) {
      items.add(
        DropdownMenuItem(
          child: Text(house.name,overflow: TextOverflow.ellipsis),
          value: house,
        ),
      );
    }
    return items;
  }

    List<DropdownMenuItem<GeoState>> buildDropDownMenuGeoState(List geostates) {
    List<DropdownMenuItem<GeoState>> items = List();
    for (GeoState geostate in geostates) {
      items.add(
        DropdownMenuItem(
          child: Text(geostate.name,overflow: TextOverflow.ellipsis),
          value: geostate,
        ),
      );
    }
    return items;
  }

    List<DropdownMenuItem<Branch>> buildDropDownMenuBranch(List branches) {
    List<DropdownMenuItem<Branch>> items = List();
    for (Branch branch in branches) {
      items.add(
        DropdownMenuItem(
          child: Text(branch.name,overflow: TextOverflow.ellipsis),
          value: branch,
        ),
      );
    }
    return items;
  }

    List<DropdownMenuItem<Club>> buildDropDownMenuClub(List clubs) {
    List<DropdownMenuItem<Club>> items = List();
    for (Club club in clubs) {
      items.add(
        DropdownMenuItem(
          child: Text(club.name,overflow: TextOverflow.ellipsis),
          value: club,
        ),
      );
    }
    return items;
  }