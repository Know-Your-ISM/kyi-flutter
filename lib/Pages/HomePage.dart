import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kyism/Pages/Searching.dart';
import 'package:kyism/Model/model.dart';
import 'package:kyism/Model/source.dart';
import 'package:kyism/Model/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formkey = GlobalKey<FormState>();
  String name ="";
  List<DropdownMenuItem<House>> dropdownMenuHouse;
  House selectedHouse;
  List<DropdownMenuItem<GeoState>> dropdownMenuGeoState;
  GeoState selectedGeoState;
  List<DropdownMenuItem<Branch>> dropdownMenuBranch;
  Branch selectedBranch;
  List<DropdownMenuItem<Club>> dropdownMenuClub;
  Club selectedClub;

  void initState() {
    super.initState();
    dropdownMenuHouse = buildDropDownMenuHouse(houseObject);
    selectedHouse = dropdownMenuHouse[0].value;
    dropdownMenuGeoState = buildDropDownMenuGeoState(geoStateObject);
    selectedGeoState = dropdownMenuGeoState[0].value;
    dropdownMenuBranch = buildDropDownMenuBranch(branchObject);
    selectedBranch = dropdownMenuBranch[0].value;
    dropdownMenuClub = buildDropDownMenuClub(clubObject);
    selectedClub = dropdownMenuClub[0].value;

  }

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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text("  KYI Search",style: TextStyle(color:Colors.grey[100],fontSize: 22,fontWeight: FontWeight.bold,fontFamily:'Pacifico'),),
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
                                      borderRadius:BorderRadius.all(
                                        Radius.circular(30.0),),
                                      borderSide: BorderSide(
                                          width:2.5,
                                          color: Colors.orange[600]
                                      )
                                  ),

                                  enabledBorder: OutlineInputBorder(
                                      borderRadius:BorderRadius.all(
                                        Radius.circular(30.0),),
                                      borderSide: BorderSide(
                                          color: Colors.grey,
                                          width: 0.5
                                      )
                                  ),
                                  prefixIcon: Icon(CupertinoIcons.person_solid,color: Colors.grey,semanticLabel:"Name" ,),
                                  labelText: 'Name ',
                                  hintStyle: TextStyle(color:Colors.grey,
                                      fontSize:15),
                                ),),
                              SizedBox(height: 10,),
                              Align(alignment: Alignment.centerLeft,
                                child:Text("  Filter",style: TextStyle(color:Colors.grey,fontSize: 18,fontWeight: FontWeight.bold,fontFamily:'Pacifico'),),
                              ),
                              SizedBox(height: 10,),
                              Row(mainAxisSize: MainAxisSize.min,
                                children:<Widget>[
                                  Flexible(
                                    child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(30.0),
                                            border: Border.all(color: Colors.grey, )),
                                        padding: const EdgeInsets.only(left: 20.0, right: 10.0),
                                        child: DropdownButtonHideUnderline(child:DropdownButton<House>(
                                            value: selectedHouse,
                                            isExpanded:true,
                                            items: dropdownMenuHouse,
                                            onChanged: (value) {
                                              setState(() {
                                                selectedHouse = value;
                                              });
                                            }),),
                                    ),
                                  ),SizedBox(width: 5, ),
                                  Flexible(
                                    child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(30.0),
                                            border: Border.all(color: Colors.grey, )),
                                        padding: const EdgeInsets.only(left: 20.0, right: 10.0),
                                        child: DropdownButtonHideUnderline(child:DropdownButton<GeoState>(
                                            value: selectedGeoState,
                                            isExpanded:true,
                                            items: dropdownMenuGeoState,
                                            onChanged: (value) {
                                              setState(() {
                                                selectedGeoState = value;
                                              });
                                            }),),
                                      ),
                                  ),
                                ] ,
                              ),
                              SizedBox(height: 8,),
                              Row(mainAxisSize: MainAxisSize.min,
                                  children:<Widget>[
                                    Flexible(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(30.0),
                                            border: Border.all(color: Colors.grey, )),
                                        padding: const EdgeInsets.only(left: 20.0, right: 10.0),
                                        child: DropdownButtonHideUnderline(child:DropdownButton<Branch>(
                                            value: selectedBranch,
                                            isExpanded:true,
                                            items: dropdownMenuBranch,
                                            onChanged: (value) {
                                              setState(() {
                                                selectedBranch = value;
                                              });
                                            }),),
                                      ),
                                    ),
                                    SizedBox(width: 5, ),
                                    Flexible(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(30.0),
                                            border: Border.all(color: Colors.grey, )),
                                        padding: const EdgeInsets.only(left: 20.0, right: 10.0),
                                        child: DropdownButtonHideUnderline(child:DropdownButton<Club>(
                                            value: selectedClub,
                                            isExpanded:true,
                                            items: dropdownMenuClub,
                                            onChanged: (value) {
                                              setState(() {
                                                selectedClub = value;
                                              });
                                            }),),
                                      ),
                                    ),
                                  ]
                              ),

                              SizedBox(height: MediaQuery.of(context).size.height*(0.112),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Builder(
                                    builder:(context)
                                    => RaisedButton(onPressed: () {
                                      if(name=="" ){
                                        Scaffold.of(context).showSnackBar(snackBar);
                                      }else{
                                        Navigator.push((context),CupertinoPageRoute(builder: (context) => Process(name: name,geoState:selectedGeoState,house:selectedHouse,branch:selectedBranch,club:selectedClub)));
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
  content: Text("Enter name!"),
  elevation: 16,
  duration: Duration(milliseconds: 2000),
);
