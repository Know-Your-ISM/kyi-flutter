import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kyism/Pages/Searching.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formkey = GlobalKey<FormState>();
  String name ="";
  String city = "";
  String admission_no = "";
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Color(0XFF0C78D5),Color(0XFF0D93C1),Color(0XFF0EAFAD)], begin:Alignment.centerLeft,end: Alignment.centerRight),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              height: height,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image.asset("assets/enquiry_bk.png",width: MediaQuery.of(context).size.width*(0.75),height:MediaQuery.of(context).size.height*(0.29)),
                    //SizedBox(height: MediaQuery.of(context).size.height*(0.13),),
                    //Spacer(),
                    //Expanded(child: Container(),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text("  Student Spy",style: TextStyle(color:Colors.grey[100],fontSize: 28,fontWeight: FontWeight.bold,fontFamily:'Pacifico'),),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Card(
                      color: Colors.grey[100],
                      elevation: 16,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Form(
                          key: _formkey,
                          child: Column(
                            children: <Widget>[
                              SizedBox(height:5),
                              TextFormField(
                                cursorColor: Colors.deepPurple[400],
                                cursorWidth: 2,
                                textInputAction:TextInputAction.next,
                                onEditingComplete: ()=> FocusScope.of(context).nextFocus(),
                                onChanged: (val){
                                  setState(() {
                                    val==null?name="":name=val;
                                  });
                                },
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width:2.5,
                                      color: Colors.orange[600]
                                    )
                                  ),

                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                      width: 0.5
                                    )
                                  ),
                                  prefixIcon: Icon(CupertinoIcons.person_solid,color: Colors.grey,semanticLabel:"Name" ,),
                                  labelText: 'Name',
                                  hintStyle: TextStyle(color:Colors.grey,
                                      fontSize:15),
                                ),),
                              SizedBox(height: 15,),
                              TextFormField(
                                cursorColor: Colors.deepPurple[400],
                                textInputAction:TextInputAction.next,
                                onEditingComplete: ()=> FocusScope.of(context).nextFocus(),
                                onChanged: (val){
                                  setState(() {
                                    val==null?city="":city=val;
                                  });
                                },
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width:2.5,
                                          color: Colors.orange[600]
                                      )
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                        width: 0.5
                                      )
                                  ),
                                  prefixIcon: Icon(CupertinoIcons.person_solid,color: Colors.grey,semanticLabel:"City" ),
                                  labelText: 'City',
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
                                    val==null?admission_no="":admission_no=val;
                                  });
                                },
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width:2.5,
                                          color: Colors.orange[600]
                                      )
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                        width: 0.5
                                      )
                                  ),
                                  prefixIcon: Icon(CupertinoIcons.person_solid,color: Colors.grey,semanticLabel:"Admission No" ),
                                  labelText: 'Admission no',
                                  hintStyle: TextStyle(color:Colors.grey,
                                      fontSize:15),
                                ),),
                              SizedBox(height: MediaQuery.of(context).size.height*(0.112),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Builder(
                                    builder:(context)
                                    => RaisedButton(onPressed: () {
                                      if((name=="" && city=="") && admission_no=="" ){
                                        Scaffold.of(context).showSnackBar(snackBar);
                                      }else{Navigator.push((context),CupertinoPageRoute(builder: (context) => Process(name: name,admission_no: admission_no,city: city,)));
                                   }
                                    },child: Text("SEARCH",style: TextStyle(color: Colors.white,letterSpacing: 1),),color: Colors.deepPurple,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),splashColor: Colors.deepPurple[100],),
                                  ),

                                ],

                              ),
                              SizedBox(height: 1,)

                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
SnackBar snackBar = SnackBar(
  content: Text("Enter atleast one entry!"),
  elevation: 16,
  duration: Duration(milliseconds: 2000),
);
