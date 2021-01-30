import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iptv/screen/fetch_channels.dart';


void main() { 
  WidgetsFlutterBinding.ensureInitialized(); 
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft])
    .then((_) {
      runApp(  MyApp());
    });
   }

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // Set landscape orientation
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home:   Scaffold(
          body: FetchTVChannel()),
    
    );
  }
}
