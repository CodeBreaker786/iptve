import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:m3u/m3u.dart';
import 'package:video_player/video_player.dart';

class PlayerScreen2 extends StatefulWidget {
  List<M3uGenericEntry> channelList;
  PlayerScreen2({this.channelList});
  @override
  _PlayerScreen2State createState() => _PlayerScreen2State();
}

class _PlayerScreen2State extends State<PlayerScreen2> {
  FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController:
          VideoPlayerController.network(widget.channelList[100].link),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: const Text('IPTV'),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Container(
            child: ListView.builder(
              itemCount: widget.channelList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    onTap: () {
                      flickManager.handleChangeVideo(
                        VideoPlayerController.network(
                            widget.channelList[index].link),
                      );
                    },
                    leading: Text(index.toString()),
                    title: Text(widget.channelList[index].title),
                    subtitle: Text(widget.channelList[index].attributes.values
                        .elementAt(3)),
                  ),
                );
              },
            ),
          )),
          SizedBox(
             
            height:MediaQuery.of(context).size.height*0.55 ,
            child: Container(
              
              child: FlickVideoPlayer(
                
                preferredDeviceOrientation: [DeviceOrientation.landscapeLeft],
                flickManager: flickManager,
                flickVideoWithControls: FlickVideoWithControls(
                 
                  controls: FlickPortraitControls(),
                ),
                flickVideoWithControlsFullscreen: FlickVideoWithControls(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
