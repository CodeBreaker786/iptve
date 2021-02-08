import 'package:http/http.dart' as http;
import 'package:iptv/database/moor_curd.dart';
import 'package:m3u/m3u.dart';





Future getChannelList({User user}) async {
  var response = await http.get(
      'http://live.lilmiamitv.com:83/get.php?username=${user.username}&password=${user.password}&type=m3u_plus&output=mpegts');
  if (response.statusCode == 200) {
    final m3u = await M3uParser.parse(response.body);
    return m3u;
  }
}
