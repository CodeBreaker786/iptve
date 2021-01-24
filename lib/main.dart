import 'dart:typed_data';

import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:iptv/channel_serives.dart';
import 'package:iptv/fetch_channels.dart';
import 'package:m3u/m3u.dart';
import 'package:provider/provider.dart';

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
