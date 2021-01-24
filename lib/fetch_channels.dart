import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iptv/channel_serives.dart';

import 'models/player_screen2.dart';

class FetchTVChannel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Set landscape orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return Scaffold(
      
      body: FutureBuilder(
          future: getChannelList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return PlayerScreen2(
                  channelList: snapshot.data,
                );
              } else {
                return Text("No data");
              }
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
