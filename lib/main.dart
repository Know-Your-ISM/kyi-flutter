import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kyism/Pages/Dashboard.dart';
import 'Pages/verifiation.dart';
import 'package:shared_preferences/shared_preferences.dart';
Future<void> main() async{
WidgetsFlutterBinding.ensureInitialized();
SharedPreferences prefs = await SharedPreferences.getInstance();
bool boolValue = prefs.getBool("boolValue")??false;
  runApp(MyApp(boolValue:boolValue));
}
class MyApp extends StatelessWidget {
final bool boolValue;
MyApp({this.boolValue});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      localizationsDelegates: [
        DefaultCupertinoLocalizations.delegate,
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate
      ],
      color: Colors.deepPurple[400],
      home:boolValue?Dashboard():Verify()
      );
  }
}