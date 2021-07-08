import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iptv/screen/fetch_channels.dart';
import 'package:iptv/screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'database/moor_curd.dart';
import 'database/user_curd/user_curd.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {
  var db;
  UsersDao usersDao;
  MyApp() {
    db = AppDatabase();
    usersDao = UsersDao(db);
  }
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Stack(children: [
        Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Image.asset(
              'images/background.jpg',
              fit: BoxFit.cover,
            )),
        Scaffold(
            backgroundColor: Colors.transparent,
            body: FutureBuilder(
                future: widget.usersDao.getUser(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    User user = snapshot.data;
                    if (user != null) {
                      return FetchTVChannel(
                        user: user,
                      );
                    } else {
                      return LoginScreen();
                    }
                  }
                  return Center(child: CircularProgressIndicator());
                })),
      ]),
    );
  }
}
 
 
 
 