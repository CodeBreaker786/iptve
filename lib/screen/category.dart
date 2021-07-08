import 'package:flutter/material.dart';
import 'package:iptv/screen/player_screen2.dart';
import 'package:m3u/m3u.dart';

class CategoryScreen extends StatelessWidget {
  final Map<String, List<M3uGenericEntry>> channelList;
  CategoryScreen({this.channelList});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListTile(
            title: Center(
                child: Text("Categories",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold))),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: channelList.entries.length,
              itemBuilder: (context, index) {
                return Card(
                    color: Colors.transparent,
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PlayerScreen2(
                                      channelList: this.channelList,
                                      index: index,
                                    )));
                      },
                      leading: Text(
                        (1 + index).toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      title: Text(
                        channelList.entries.elementAt(index).key.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Container(
                        width: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                                channelList.entries
                                    .elementAt(index)
                                    .value
                                    .length
                                    .toString(),
                                style: TextStyle(color: Colors.white)),
                            Icon(Icons.arrow_forward_ios_outlined,
                                color: Colors.white)
                          ],
                        ),
                      ),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
