import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:iptv/database/moor_curd.dart';
import 'package:m3u/m3u.dart';
import 'package:path_provider/path_provider.dart';

Future getChannelList({User user}) async {
  // var url = Uri.parse(
  //     'http://tvperiod.com:2052/get.php?username=${user.username}&password=${user.password}&type=m3u_plus&output=ts');
  // Response response = await http.get(url);
  // if (response.statusCode == 200) {
    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String path = '$dir${user.username}.m3u';
    // final File file = File(path);
    // await file.writeAsBytes(response.bodyBytes);
    final m3u = await M3uParser.parse(await File(path).readAsString());
    return m3u;
  }
//   return null;
// }

Future getM3uFile(User user) async {
  final String dir = (await getApplicationDocumentsDirectory()).path;
  final String path = '${user.username}/report.pdf';
}
