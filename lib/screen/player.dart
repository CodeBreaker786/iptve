import 'package:flutter/material.dart';
import 'package:fijkplayer/fijkplayer.dart' as fijkplayer;
import 'package:flutter_live/flutter_live.dart' as flutter_live;

class MyVideoPlyer extends StatefulWidget {
  final url;
  MyVideoPlyer({Key key, this.url}) : super(key: key);
  @override
  _MyVideoPlyerState createState() => _MyVideoPlyerState();
}

class _MyVideoPlyerState extends State<MyVideoPlyer> {
  flutter_live.RealtimePlayer _player =
      flutter_live.RealtimePlayer(fijkplayer.FijkPlayer());
  @override
  void initState() {
    autoPlay();
    super.initState();
  }

  void autoPlay() async {
    // Auto start play live streaming.
    await _player.play(widget.url);
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: fijkplayer.FijkView(
        height: MediaQuery.of(context).size.height * 0.58,
        width: MediaQuery.of(context).size.width * 0.48,
        player: _player.fijk,
        fit: fijkplayer.FijkFit.fill,
        fsFit: fijkplayer.FijkFit.fill,
        fs: true,
        //panelBuilder: fijkplayer.fijkPanel2Builder(fill: true),
      ),
    );
  }
}
