// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:iptv/screen/fetch_channels.dart';
// import 'package:iptv/screen/login_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import 'database/moor_curd.dart';
// import 'database/user_curd/user_curd.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft])
//       .then((_) {
//     runApp(MyApp());
//   });
// }

// class MyApp extends StatefulWidget {
//   var db;
//   UsersDao usersDao;
//   MyApp() {
//     db = AppDatabase();
//     usersDao = UsersDao(db);
//   }
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Material App',
//       home: Stack(children: [
//         Positioned(
//             left: 0,
//             right: 0,
//             top: 0,
//             bottom: 0,
//             child: Image.asset(
//               'images/background.jpg',
//               fit: BoxFit.cover,
//             )),
//         Scaffold(
//             backgroundColor: Colors.transparent,
//             body: FutureBuilder(
//                 future: widget.usersDao.getUser(),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.done) {
//                     User user = snapshot.data;
//                     if (user != null) {
//                       return FetchTVChannel(
//                         user: user,
//                       );
//                     } else {
//                       return LoginScreen();
//                     }
//                   }
//                   return Center(child: CircularProgressIndicator());
//                 })),
//       ]),
//     );
//   }
// }
 
 
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:cdnbye/cdnbye.dart';
import 'package:video_player/video_player.dart';
 

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: VideoPlayerWidget(),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  VideoPlayerController _controller;
  bool _isPlaying = false;
  String url = 'http://tvperiod.com:2052/eMPk3YF3/sH5ufBqH/2456518';

  ChewieController chewieController;
  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.network(url);
    chewieController = ChewieController(
      videoPlayerController: _controller,
      aspectRatio: 4.0 / 3.0,
      autoPlay: true,
      looping: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget video = Container(
      height: 300,
      child: Center(
        child: Chewie(
          controller: chewieController,
        ),
      ),
    );
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('视频播放'),
        ),
        body: ListView(
          children: <Widget>[
            video,
            Container(
              height: 200,
              child: Center(
                child: RaisedButton(
                  child: Text('init'),
                  onPressed: () async {
                    await Cdnbye.init('free');
                  },
                ),
              ),
            ),
            Container(),
            Container(
              height: 200,
              child: Center(
                child: RaisedButton(
                  child: Text('free'),
                  onPressed: () async {
                    var newUrl = await Cdnbye.parseStreamURL('http://tvperiod.com:2052/eMPk3YF3/sH5ufBqH/2456518');
                    print('转换后的URL:$newUrl');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
