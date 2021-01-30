import 'package:http/http.dart' as http;
import 'package:m3u/m3u.dart';





Future getChannelList() async {
  var response = await http.get(
      'http://live.lilmiamitv.com:83/get.php?username=14893545&password=86547342&type=m3u_plus&output=mpegts');

  if (response.statusCode == 200) {
    final m3u = await M3uParser.parse(response.body);
    return m3u;
  }
}
