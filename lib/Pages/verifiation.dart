import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kyism/Services/verifying.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Dashboard.dart';
class Verify extends StatefulWidget {
  @override
  _VerifyState createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  final _formkey = GlobalKey<FormState>();
  String admission_no = "";
  String Student_name = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Color(0XFF0C78D5),Color(0XFF0D93C1),Color(0XFF0EAFAD)], begin:Alignment.centerLeft,end: Alignment.centerRight),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: SingleChildScrollView(
              child: Padding(padding: EdgeInsets.fromLTRB(15,0,15,0),
                child: Card(
                color: Colors.white,
                elevation: 16,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.asset("assets/capture.PNG",
                      height: MediaQuery.of(context).size.width*(1/3),width: MediaQuery.of(context).size.width*(1/3),),
                      SizedBox(height: 5,),
                      Text("Please enter your credentials.",style: TextStyle(fontWeight:FontWeight.bold),),
                      SizedBox(height:0,),
                      Form(
                        key:_formkey, child: Column(
                        children: <Widget>[
                          SizedBox(height:5),
                          TextFormField(
                            cursorColor: Colors.deepPurple[400],
                            cursorWidth: 2,
                            textInputAction:TextInputAction.next,
                            onEditingComplete: ()=> FocusScope.of(context).nextFocus(),
                            onChanged: (val){
                              setState(() {
                                val==null?admission_no="":admission_no=val;
                              });
                            },
                            decoration: InputDecoration(
                              hintText: "Admission no",
                              hintStyle: TextStyle(color:Colors.grey,
                                  fontSize:15),
                            ),),
                          SizedBox(height: 15,),
                          TextFormField(
                            cursorColor: Colors.deepPurple[400],
                            textInputAction:TextInputAction.done,
                            onEditingComplete: ()=> FocusScope.of(context).unfocus(),
                            onChanged: (val){
                              setState(() {
                                val==null?Student_name="":Student_name=val;
                              });
                            },
                            decoration: InputDecoration(
                              hintText:"Student Name",
                              hintStyle: TextStyle(color:Colors.grey,
                                  fontSize:15),
                            ),),
                          SizedBox(height: 25,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Builder(
                                builder:(context)
                                => RaisedButton(onPressed: () async {
                                  if(admission_no=="" || Student_name=="") {
                                    Scaffold.of(context).showSnackBar(snackBar);
                                  }else{ showAlertDialog(context);
                                    bool didVerify = await verifyUser(Student_name,admission_no);
                                    if(didVerify){
                                      Scaffold.of(context).showSnackBar(VerifysnackBar);
                                      await setVerified();
                                      String student_id = await getId(admission_no);
                                      await setId(student_id);
				                            Navigator.pop(context);
                                      Navigator.pushAndRemoveUntil(context,CupertinoPageRoute(builder: (context) =>Dashboard()),(Route<dynamic> route) => false,);
                                    }else{
				                            Navigator.pop(context);
                                      Scaffold.of(context).showSnackBar(notVerifysnackBar);
                                    }
                                  }
                                },child: Text("CONTINUE",style: TextStyle(color: Colors.white,letterSpacing: 1),),color: Colors.deepPurple,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),splashColor: Colors.deepPurple[100],),
                              ),

                            ],

                          ),SizedBox(height: 3,),
                          Center(child: Text("Imagine being able to identify every senior you came across...\n With Know Your ISM, that's exactly what you'll be able to do. On each of KYI's apps, you can search through the public data of students across IIT(ISM) Dhanbad. and that's just the beginning, soon you'll be able to access this data programatically in your own apps. Beside, inside KYI's Android and iOS apps, you'll also fid a dose of fresher-friendly guides to everything ISM.\n Send suggestions, complaints compliments or even a hello at: sayhello@kyism.ml",textAlign: TextAlign.center,)),
                          SizedBox(height: 6,)

                        ],
                      ),

                      )
                    ],
                ),
                ),
              ),

              ),
            ),
          ),
        ),
      ),
    );
  }
  SnackBar snackBar = SnackBar(
    content: Text("Enter all the entries!"),
    elevation: 16,
    duration: Duration(milliseconds: 2000),
  );
  SnackBar notVerifysnackBar = SnackBar(
    content: Text("No User with given credentials!"),
    elevation: 16,
    duration: Duration(milliseconds: 2000),
  );
  SnackBar VerifysnackBar = SnackBar(
    content: Text("User Verified :)"),
    elevation: 16,
    duration: Duration(milliseconds: 2000),
  );
}

Future<void> setVerified() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool("boolValue", true);
}

Future<void> setId( String student_id) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString("id", student_id);
}

showAlertDialog(BuildContext context){
  AlertDialog alert = AlertDialog(
          backgroundColor: Colors.white,
          elevation: 16,
          shape: RoundedRectangleBorder(borderRadius:BorderRadius.all(Radius.circular(40))),
          content:new Row(
        children: [
           CircularProgressIndicator(),
           Container(margin: EdgeInsets.only(left: 5),child:Text("Loading" )),
        ],),
        );
        showDialog(barrierDismissible: false,context: context,
        builder : (BuildContext context){
          return alert;
        });
}