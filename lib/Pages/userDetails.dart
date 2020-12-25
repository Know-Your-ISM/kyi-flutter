import 'package:flutter/cupertino.dart';
import 'package:kyism/Model/User.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
const Color color1 = Color(0XFF0C78D5);
const Color color2 = Color(0XFF0D93C1);
const Color color3 = Color(0XFF0EAFAD);

class ProfileSecond extends StatefulWidget {
  final Student student ;
  ProfileSecond({this.student});
  @override
  _ProfileSecondState createState() => _ProfileSecondState();
}

class _ProfileSecondState extends State<ProfileSecond> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient:LinearGradient(begin: Alignment.topCenter,end:Alignment.bottomCenter,colors:[
        Colors.grey[100],Colors.grey[350]
      ])),
      child: Scaffold(
        //appBar: AppBar(
        //centerTitle: true,
          backgroundColor: Colors.transparent,
          //title:Text("BOOK ID",
          //style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,letterSpacing: 2))
          //),
          body:Stack(
              children:<Widget>[
                Content(usdata: widget.student,),
                CustomPaint(
                    painter: CustomContainer(),
                    child:Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*(1/3),
                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*(0.25/6)),
                      child:Align(
                          alignment: Alignment.topCenter,
                          child: SingleChildScrollView(
                            child: Column(
                                children: <Widget>[
                                  SizedBox(height:30),
                                  Text("KYI ID",style: TextStyle(fontFamily:'RobotoSlab',color:Colors.white,fontWeight: FontWeight.bold,fontSize: 25,shadows: [Shadow(
                                      blurRadius:8,color:Colors.grey[800],offset:Offset(0, 7) ),],))
                                  //SizedBox(height: 10,),
                                  //CircleAvatar(backgroundColor: Colors.white,radius: MediaQuery.of(context).size.height*(0.25/2),child:
                                  //CircleAvatar(backgroundColor: Colors.black,radius: MediaQuery.of(context).size.height*(0.25/2.2),),),
                                  //SizedBox(height:4),
                                  //Text("Name",style:TextStyle(color:Colors.deepPurple[900],fontWeight:FontWeight.bold,fontSize: 22)),
                                  //Text("Type",style:TextStyle(color:Colors.red,fontSize: 10,fontWeight: FontWeight.bold))
                                ]),
                          )
                      ),
                    )
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width*(1/3.5),
                  top:MediaQuery.of(context).size.height*(0.32/2),
                  child:
                  CircleAvatar(backgroundColor: Colors.white,radius: MediaQuery.of(context).size.width*(0.43/2),child:
                  Container(decoration: BoxDecoration(shape: BoxShape.circle,boxShadow: [BoxShadow(
                      color:Colors.black,blurRadius:2,offset:Offset(0,4)
                  )]),child:ClipOval(

                    child:Container(
                    height: MediaQuery.of(context).size.width*(0.40),
                    width: MediaQuery.of(context).size.width*(0.40),
                    decoration: BoxDecoration(
                        shape:BoxShape.circle,
                        color: Colors.black
                    ),
                    child: widget.student.sex=="F"?FadeInImage(placeholder: AssetImage("assets/images.png"), image: NetworkImage(widget.student.avatarUrl),fit: BoxFit.cover,):FadeInImage(placeholder: AssetImage("assets/vector.jpg"), image: NetworkImage(widget.student.avatarUrl),fit: BoxFit.cover,),
                  ),))))
              ]
          )
      ),
    );
  }
}

class CustomContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;
    var paint = Paint();
    paint.shader = LinearGradient(end: Alignment.topRight,
        begin: Alignment.bottomLeft,colors: [color1,color2,color3]).createShader(rect);
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, size.height * 0.80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height * 0.80);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class Content extends StatefulWidget {
  Content({this.usdata});
  final Student usdata;
  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:SingleChildScrollView(
        child: Column(
            children:<Widget>[
              SizedBox(height: MediaQuery.of(context).size.height*(1/2.7),),
              Center(
                child: Text(widget.usdata.admno,style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontSize: 24,shadows: [Shadow(
                  blurRadius:6,color:Colors.black26,offset:Offset(0, 7),)])),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                        children:<Widget>[
                    Chip(visualDensity: VisualDensity.compact,backgroundColor: Colors.blue,elevation: 16,label: Text(widget.usdata.course!=""?widget.usdata.course:"NA",style: TextStyle(color:Colors.white,fontWeight: FontWeight.normal,fontSize:13,shadows: [Shadow(
                      blurRadius:6,color:Colors.black26,offset:Offset(0, 7),)]),),avatar: CircleAvatar(backgroundColor: Colors.black,child: Text(widget.usdata.course!=""?widget.usdata.course[0]:"N"),),),
                    ]),
                    Row(children:<Widget>[
                      Text("Sex",style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontSize: 16,shadows: [Shadow(
                      blurRadius:6,color:Colors.black26,offset:Offset(0, 7),)])),
                      SizedBox(width: 10,),
                      CircleAvatar(backgroundColor: Colors.black,child: Text(widget.usdata.sex!=""?widget.usdata.sex:"NA"),),]),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Container(

                  decoration:BoxDecoration(gradient: LinearGradient(begin:Alignment.bottomLeft,end: Alignment.topRight,colors: [color1,color2,color3]),borderRadius: BorderRadius.circular(30),boxShadow: [BoxShadow(
                      color:Colors.grey[300],blurRadius:4,offset:Offset(10,10)
                  )]),
                  child: Card(
                      color: Colors.transparent,
                      elevation: 10,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),),
                      child:Padding(
                        padding: const EdgeInsets.fromLTRB(20,5, 5, 5),
                        child: Column(
                            children:<Widget>[
                              SizedBox(height:30),
                              Row(
                                  children:<Widget>[
                                    Icon(CupertinoIcons.person,color: Colors.white,size: 20,),
                                    SizedBox(width:30),
                                    Text(widget.usdata.name,style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 13,shadows: [Shadow(
                                      blurRadius:6,color:Colors.black26,offset:Offset(0, 7),)]),),
                                  ]
                              ),
                              SizedBox(height:10),
                              Padding(
                                padding: const EdgeInsets.only(left:50),
                                child: Divider(color:Colors.grey[800]),
                              ),
                              Row(
                                  children:<Widget>[
                                    Icon(CupertinoIcons.news,color: Colors.white,size: 20,),
                                    SizedBox(width:30),
                                    Text(widget.usdata.department!=""?widget.usdata.department:"NA",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize:13,shadows: [Shadow(
                                      blurRadius:6,color:Colors.black26,offset:Offset(0, 7),)]),),
                                  ]
                              ),SizedBox(height:10),
                              Padding(
                                padding: const EdgeInsets.only(left:50),
                                child: Divider(color:Colors.grey[800]),
                              ),
                              Row(
                                  children:<Widget>[
                                    Icon(CupertinoIcons.location,color: Colors.white,size: 20,),
                                    SizedBox(width:30),
                                    Text(widget.usdata.city!=""?widget.usdata.city+",":"NA , ",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 13,shadows: [Shadow(
                                      blurRadius:6,color:Colors.black26,offset:Offset(0, 7),)]),),
                                    SizedBox(width:10),
                                    Text(widget.usdata.state!=""?widget.usdata.state:"NA",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 13,shadows: [Shadow(
                                      blurRadius:6,color:Colors.black26,offset:Offset(0, 7),)]),),
                                  ]
                              ),SizedBox(height:10),                        Padding(
                                padding: const EdgeInsets.only(left:50),
                                child: Divider(color:Colors.grey[800]),),
                              Row(
                                  children:<Widget>[
                                    Icon(CupertinoIcons.home,color: Colors.white,size: 20,),
                                    SizedBox(width:30),
                                    Text(widget.usdata.house!=""?widget.usdata.house:"NA",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize:13,shadows: [Shadow(
                                      blurRadius:6,color:Colors.black26,offset:Offset(0, 7),)]),),
                                  ]
                              ),SizedBox(height:10),
                              Padding(
                                padding: const EdgeInsets.only(left:50),
                                child: Divider(color:Colors.grey[800]),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                  children:<Widget>[
                                    Icon(CupertinoIcons.group,size: 23,color: Colors.white,)
                                    ,SizedBox(width: 10,),
                                    Text("Clubs",style:TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize:15,shadows: [Shadow(
                                      blurRadius:6,color:Colors.black26,offset:Offset(0, 7),)]),
                                    ),
                                    ]
                              ),
                          SizedBox(height: 10),
                              widget.usdata.clubs!=[]?Wrap( spacing: 12,
                                children :widget.usdata.clubs.map((s){
                                  return Chip(avatar: CircleAvatar(
                                    backgroundColor: Colors.black,
                                    child: Text(s!=""?s[0]:"N"),
                                  ),
                                    label: Text(s!=""?s:"NA",style:TextStyle(color:Colors.white,fontWeight: FontWeight.normal,fontSize:13,shadows: [Shadow(
                                      blurRadius:6,color:Colors.black26,offset:Offset(0, 7),)]) ,),
                                    visualDensity: VisualDensity.compact,
                                    elevation: 16,
                                    backgroundColor: Colors.blue,)
                                  ;
                                }).toList(),):SizedBox(height: 1,)
                              ,SizedBox(height:10),
                              Padding(
                                padding: const EdgeInsets.only(left:50),
                                child: Divider(color:Colors.grey[800]),
                              ),
                            ]
                        ),
                      )
                  ),
                ),
              ),
               SizedBox(height:25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:<Widget>[
              IconButton(onPressed: () {if(widget.usdata.facebook!=null){
                Scaffold.of(context).showSnackBar(anotherSnackBar(widget.usdata.facebook));
              }else{
                Scaffold.of(context).showSnackBar(snackBar);
              }
              }, icon: Icon(MdiIcons.facebook,color: Colors.black,size: 30,),),
                  //SizedBox(width:10),
              IconButton(onPressed: () { Scaffold.of(context).showSnackBar(snackBar);}, icon: Icon(MdiIcons.instagram,color: Colors.black,size: 30,),),
                  //SizedBox(width:10),
              IconButton(onPressed: () { Scaffold.of(context).showSnackBar(snackBar);}, icon: Icon(MdiIcons.linkedin,color: Colors.black,size: 30,),),
    ]
              )

            ]
        ),
      ),
    );
  }
}
SnackBar snackBar = SnackBar(
  content: Text("No Link Available :("),
  elevation: 16,
  duration: Duration(milliseconds: 2000),
);
SnackBar anotherSnackBar(String fbLink) {
  return
  SnackBar(
    content: Text("Redirecting to FaceBook Link :-" + fbLink),
    elevation: 16,
    duration: Duration(milliseconds: 2000),
  );
}
