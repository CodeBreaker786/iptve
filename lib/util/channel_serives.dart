import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:iptv/database/moor_curd.dart';
import 'package:m3u/m3u.dart';

Future getChannelList({User user}) async {
  var url = Uri.parse(
      'http://tvperiod.com:2052/get.php?username=eMPk3YF3&password=sH5ufBqH&type=m3u_plus&output=ts');
  Response response = await http.get(url);
  if (response.statusCode == 200) {
    final m3u = await M3uParser.parse(response.body);
    return m3u;
  }
  return null;
}
