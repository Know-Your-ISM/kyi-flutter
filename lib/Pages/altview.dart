import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AltHomePage extends StatefulWidget {
  @override
  _AltHomePageState createState() => _AltHomePageState();
}

class _AltHomePageState extends State<AltHomePage> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.blueAccent[200],Colors.green[500]], begin:Alignment.centerLeft,end: Alignment.centerRight),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Stack(
              children: <Widget>[
                Positioned(right:0,child: Image.asset("assets/enquiry_bk.png",width: MediaQuery.of(context).size.width*(0.75),)),//SizedBox(height: MediaQuery.of(context).size.height*(0.13),),
                Positioned(
                  width: MediaQuery.of(context).size.width*0.93,
                  bottom: 0,
                  child: Column(children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text("  Student Spy",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Card(
                    color: Colors.white,
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
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width:3,
                                        color: Colors.orange[600]
                                    )
                                ),

                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    )
                                ),
                                prefixIcon: Icon(Icons.account_box,color: Colors.grey,),
                                labelText: 'Name',
                                hintStyle: TextStyle(color:Colors.grey,
                                    fontSize:15),
                              ),),
                            SizedBox(height: 15,),
                            TextFormField(
                              cursorColor: Colors.deepPurple[400],
                              textInputAction:TextInputAction.next,
                              onEditingComplete: ()=> FocusScope.of(context).nextFocus(),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width:3,
                                        color: Colors.orange[600]
                                    )
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    )
                                ),
                                prefixIcon: Icon(Icons.account_box,color: Colors.grey,),
                                labelText: 'City',
                                hintStyle: TextStyle(color:Colors.grey,
                                    fontSize:15),
                              ),),
                            SizedBox(height: 15,),
                            TextFormField(
                              cursorColor: Colors.deepPurple[400],
                              textInputAction:TextInputAction.done,
                              onEditingComplete: ()=> FocusScope.of(context).unfocus(),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width:3,
                                        color: Colors.orange[600]
                                    )
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    )
                                ),
                                prefixIcon: Icon(Icons.account_box,color: Colors.grey,),
                                labelText: 'Admission no',
                                hintStyle: TextStyle(color:Colors.grey,
                                    fontSize:15),
                              ),),
                            SizedBox(height: MediaQuery.of(context).size.height*(0.112),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                RaisedButton(onPressed: (){},child: Text("SEARCH",style: TextStyle(color: Colors.white,letterSpacing: 1),),color: Colors.deepPurple,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),splashColor: Colors.deepPurple[400],),

                              ],

                            ),
                            SizedBox(height: 5,)

                          ],
                        ),
                      ),
                    ),
                  )
                    ]
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
