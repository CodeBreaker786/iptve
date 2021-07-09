import 'package:flutter/material.dart';
import 'package:iptv/screen/player.dart';
import 'package:m3u/m3u.dart';

class PlayerScreen2 extends StatefulWidget {
  final Map<String, List<M3uGenericEntry>> channelList;

  final int index;
  PlayerScreen2({this.channelList, this.index});
  @override
  _PlayerScreen2State createState() => _PlayerScreen2State();
}

class _PlayerScreen2State extends State<PlayerScreen2> {
  int listIndex = 0;
  int playIndex = 0;
  String activeURL = '';
  @override
  void initState() {
    super.initState();
    listIndex = widget.index != null ? widget.index : 0;
    activeURL =
        widget.channelList.entries.elementAt(listIndex).value.first.link;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Positioned(
          left: 0,
          right: 0,
          child: Image.asset(
            'images/background.jpg',
            fit: BoxFit.cover,
          )),
      SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Column(
              children: [
                Card(
                  color: Colors.transparent,
                  child: ListTile(
                    tileColor: Colors.transparent,
                    leading: InkWell(
                        onTap: () {
                          if (listIndex > 0) {
                            setState(() {
                              playIndex = 0;
                              // listIndex--;
                              // flickManager.handleChangeVideo(
                              //   VideoPlayerController.network(widget
                              //       .channelList.entries
                              //       .elementAt(listIndex)
                              //       .value
                              //       .first
                              //       .link),
                              // );
                            });
                          }
                        },
                        child: Icon(
                          Icons.arrow_back_ios_outlined,
                          color: Colors.white,
                        )),
                    title: Container(
                        alignment: Alignment.center,
                        child: Text(
                          widget.channelList.entries.elementAt(listIndex).key,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                    trailing: InkWell(
                        onTap: () {
                          if (listIndex < widget.channelList.length - 1) {
                            setState(() {
                              playIndex = 0;
                              listIndex++;
                              // flickManager.handleChangeVideo(
                              // VideoPlayerController.network(widget
                              //     .channelList.entries
                              //     .elementAt(listIndex)
                              //     .value
                              //     .first
                              //     .link),
                              // );
                            });
                          }
                        },
                        child: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.white,
                        )),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount:
                        widget.channelList.values.elementAt(listIndex).length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.transparent,
                        child: ListTile(
                          tileColor: Colors.transparent,
                          onTap: () async {
                            playIndex = index;
                            setState(() {
                              activeURL = widget.channelList.values
                                  .elementAt(listIndex)[index]
                                  .link;
                            });

                            //autoPlay();

                            // _player.fijk.setDataSource(
                            //     'http://tvperiod.com:2052/14893545/123456/1549701',
                            //     autoPlay: true);
                          },
                          leading: playIndex == index
                              ? Icon(
                                  Icons.play_arrow,
                                  size: 35,
                                  color: Colors.greenAccent,
                                )
                              : Text(
                                  (index + 1).toString(),
                                  style: TextStyle(color: Colors.white),
                                ),
                          title: Text(
                              widget.channelList.values
                                  .elementAt(listIndex)[index]
                                  .title,
                              style: TextStyle(color: Colors.white)),
                          // subtitle: Text(
                          //     widget.channelList[index]
                          //         .elementAt(3),
                          //     style: TextStyle(color: Colors.white)),
                        ),
                      );
                    },
                  ),
                ),
              ],
            )),
            MyVideoPlyer(
              url: activeURL,
            )
          ],
        ),
      ),
    ]));
  }
}
