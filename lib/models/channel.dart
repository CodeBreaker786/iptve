class Channel {
  String url;
  String title;
  Channel({this.url, this.title});
  factory Channel.fromJson(map) {
    return Channel(title: map['title'], url: map['link']);
  }
}
