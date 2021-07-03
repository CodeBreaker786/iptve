import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iptv/database/moor_curd.dart';
import 'package:iptv/screen/category.dart';
import 'package:iptv/util/channel_serives.dart';
import 'package:m3u/m3u.dart';

class FetchTVChannel extends StatelessWidget {
  final User user;
  FetchTVChannel({this.user});
  @override
  Widget build(BuildContext context) {
    // Set landscape orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return  FutureBuilder(
            future: getChannelList(user: user),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                List<M3uGenericEntry> prefData = snapshot.data;
                if (snapshot.hasData) {
                  List<String> groupsCollection =[];
                  Map<String, List<M3uGenericEntry>> channelWithGrouping =
                      Map<String, List<M3uGenericEntry>>();
                  prefData.forEach((element) {
                    if (!groupsCollection
                        .contains(element.attributes['group-title'])) {
                      groupsCollection.add(element.attributes['group-title']);
                    }
                  });
                  for (int i = 0; i < groupsCollection.length; i++) {
                    List list = prefData
                        .where((e) =>
                            e.attributes['group-title'] == groupsCollection[i])
                        .toList();
                    channelWithGrouping.addAll({groupsCollection[i]: list});
                  }
                  print(channelWithGrouping.toString());
                  return CategoryScreen(channelList: channelWithGrouping);
                } else {
                  return Text("No data");
                }
              }
              return Center(child: CircularProgressIndicator());
            });
  }
}
