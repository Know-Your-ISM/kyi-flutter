import 'package:http/http.dart' as http;
import 'package:kyism/Model/VerifyModel.dart';
Future<bool> verifyUser(String student_name , String admission_no) async {
  String apiUrl = "https://kyi.herokuapp.com/api/students/verification/";
    var response = await http.get(apiUrl + admission_no);
    if (response.statusCode == 200) {
      final String userInfo = response.body;
      String status = modelUserFromJson(userInfo).status;
      if(status.toUpperCase()=="VERIFIED"){
        String name = modelUserFromJson(userInfo).student.name;
        if(name.toLowerCase()==student_name.toLowerCase()){
          return true;
        }else{
          return false;
        }
      }else{
        return false;
      }
    } else {
      return false;
    }
  }


Future<String> getId(String admission_no) async {
  String apiUrl = "https://kyi.herokuapp.com/api/students/verification/";
  print(apiUrl + admission_no);
  var response = await http.get(apiUrl + admission_no);
  if (response.statusCode == 200) {
    final String userInfo = response.body;
    String status = modelUserFromJson(userInfo).status;
    if(status.toUpperCase()=="VERIFIED"){
      String id = modelUserFromJson(userInfo).student.id;
      return id;
    }else{
      return null;
    }
  } else {
    return null;
  }
}
