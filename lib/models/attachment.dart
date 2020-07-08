part of '../dartcord.dart';

class Attachment {
  final Snowflake id;
  final String filename;
  final int size;
  final String url;
  final String proxy_url;
  int height;
  int width;

  Attachment(this.id, this.filename, this.size, this.url, this.proxy_url);

  factory Attachment.fromMap(Map map) {
    return Attachment(Snowflake(map['id']), map['filename'], map['size'],
        map['url'], map['proxy_url'])
      ..height = map['height']
      ..width = map['width'];
  }
}
