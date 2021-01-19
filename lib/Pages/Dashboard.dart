import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kyism/Pages/beta.dart';
import 'package:kyism/Pages/show.dart';
import 'package:kyism/Model/grid.dart';
import 'dart:math' as math;

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CupertinoPageScaffold(
        backgroundColor: CupertinoColors.white,
        child:SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[Column(mainAxisSize:MainAxisSize.min,children:<Widget>[   Text("KYI",style: TextStyle(color: CupertinoColors.black,fontSize: 22,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,fontFamily: "RobotoSlab"),),
                SizedBox(height: 5,),
                Text("Dashboard",style: TextStyle(color: CupertinoColors.systemGrey,fontSize: 16),),]),
                SizedBox(height:10),
                Image.asset("assets/captured.png",height:MediaQuery.of(context).size.height*(1/4),),
            SizedBox(height:20),
            Card(
                    color: CupertinoColors.white,
                    elevation: 10,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: <Widget>[
                          GridView.builder(primary: false,shrinkWrap: true,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 8,crossAxisSpacing: 8,childAspectRatio: 1.3), itemBuilder: (BuildContext context, int index) { return Show(item: grids[index],); },
                            itemCount: grids.length,padding: EdgeInsets.fromLTRB(30,0,30,0),

                          ),
                          SizedBox(height: 8,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width*(1/2),
                            height: MediaQuery.of(context).size.width*(1/2)*(1/1.8),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(16),
                              onTap:()=>Navigator.of(context).push(CupertinoPageRoute(builder: (context) =>Beta())),
                              child: Card(
                                elevation: 2,
                                color: Color((math.Random().nextDouble() *0xFFFFFF).toInt()).withOpacity(0.2),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Icon(Icons.info_outline,size: 40,color: CupertinoColors.black,),
                                      Text("FAQ?",textAlign: TextAlign.center,style: TextStyle(color: CupertinoColors.black,fontStyle: FontStyle.italic,fontSize: 14,fontWeight: FontWeight.bold,fontFamily: "RobotoSlab"),)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

              ],
            ),
          ),
        ),

      ),
    );
  }
}
