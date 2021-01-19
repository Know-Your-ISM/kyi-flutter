import 'package:http/http.dart' as http;
import 'package:kyism/Model/User.dart';
import 'package:kyism/Model/model.dart';

Future<User> getUser(String name , GeoState geoState ,House house, Branch branch,Club club) async {
  String apiUrl = "https://kyi.herokuapp.com/api/search?";
  String filter = checkFilters(name, geoState,house,branch,club);
  var response = await http.get(apiUrl + filter);
  if (response.statusCode == 200) {
    final String allUser = response.body;
    return userFromJson(allUser);
  } else {
    return null;
  }
}


String checkFilters(String name , GeoState geoState ,House house, Branch branch,Club club) {
  String altgeoState = geoState.name;
  String althouse = house.name;
  String altbranch = branch.name;
  String altclub = club.name;
  String result = "&name=" + name;
  if (geoState.value!=0){
    result= result+ "&state=" + altgeoState;
  }
  if (house.value!=0){
    result= result+  "&house=" + althouse;
  }
  if (branch.value!=0){
    result= result+  "&department=" + altbranch;
  }
  if (club.value!=0){
    result= result+  "&clubs=" + altclub;
  }
  return result;
}
