import 'package:http/http.dart' as http;
import 'package:kyism/Model/User.dart';

Future<User> getUser(String name , String city , String admission_no) async {
  String apiUrl = "https://kyi.herokuapp.com/api/search?";
  String filter = checkFilters(name, city, admission_no);
  if (filter == null) {
    return null;
  } else {
    var response = await http.get(apiUrl + filter);
    if (response.statusCode == 200) {
      final String allUser = response.body;
      return userFromJson(allUser);
    } else {
      return null;
    }
  }
}


String checkFilters(String name , String city , String admission_no) {
  if (name == "") {
    if (city == "") {
      if (admission_no == "") {
        return null;
      }
      else {
        return "&admno=" + admission_no;
      }
    }
    else {
      if (admission_no == "") {
        return "&city=" + city;
      }
      else {
        return "&city=" + city + "&admno=" + admission_no;
      }
    }
  }
  else {
    if (city == "") {
      if (admission_no == "") {
        return "&name=" + name;
      }
      else {
        return "&name=" + name + "&admno=" + admission_no;
      }
    }
    else {
      if (admission_no == "") {
        return "&name=" + name + "&city=" + city;
      }
      else {
        return "&name=" + name + "&city=" + city + "&admno=" + admission_no;
      }
    }
  }
}
