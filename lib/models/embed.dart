part of '../dartcord.dart';

class Embed {
  String title;
  String type;
  String description;
  String url;
  DateTime timestamp;
  int color;
  EmbedFooter footer;
  EmbedImage image;
  EmbedThumbnail thumbnail;
  EmbedVideo video;
  EmbedProvider provider;
  EmbedAuthor author;
  List<EmbedField> fields = [];

  Embed();

  factory Embed.fromMap(Map map){
    var embed = Embed()
    ..title = map['title']
    ..type = map['type']
    ..description = map['description']
    ..url = map['url']
    ..timestamp = map['timestamp'] != null ? DateTime.parse(map['timestamp']) : null
    ..color = map['color']
    ..footer = map['footer'] != null ? EmbedFooter.fromMap(map['footer']) : null
    ..image = map['image'] != null ? EmbedImage.fromMap(map['image']) : null
    ..thumbnail = map['thumbnail'] != null ? EmbedThumbnail.fromMap(map['thumbnail']) : null
    ..video = map['video'] != null ? EmbedVideo.fromMap(map['video']) : null
    ..provider = map['provider'] != null ? EmbedProvider.fromMap(map['provider']) : null
    ..author = map['author'] != null ? EmbedAuthor.fromMap(map['author']) : null;

    if(map['fields'] != null){
      map['fields'].forEach((element){
        embed.fields.add(EmbedField.fromMap(element));
      });
    }

    return embed;
  }
}

class EmbedField {
  final String name;
  final String value;
  bool inline;

  EmbedField(this.name, this.value);

  factory EmbedField.fromMap(Map map) {
    return EmbedField(map['name'], map['value'])..inline = map['inline'];
  }
}

class EmbedFooter {
  final String text;
  String icon_url, proxy_icon_url;

  EmbedFooter(this.text);

  factory EmbedFooter.fromMap(Map map) {
    return EmbedFooter(map['text'])
      ..icon_url = map['icon_url']
      ..proxy_icon_url = map['proxy_icon_url'];
  }
}

class EmbedImage {
  String url, proxy_url;
  int height, width;

  EmbedImage();

  factory EmbedImage.fromMap(Map map) {
    return EmbedImage()
      ..url = map['url']
      ..proxy_url = map['proxy_url']
      ..height = map['height']
      ..width = map['width'];
  }
}

class EmbedThumbnail {
  String url, proxy_url;
  int height, width;

  EmbedThumbnail();

  factory EmbedThumbnail.fromMap(Map map) {
    return EmbedThumbnail()
      ..url = map['url']
      ..proxy_url = map['proxy_url']
      ..height = map['height']
      ..width = map['width'];
  }
}

class EmbedVideo {
  String url;
  int height, width;

  EmbedVideo();

  factory EmbedVideo.fromMap(Map map) {
    return EmbedVideo()
      ..url = map['url']
      ..height = map['height']
      ..width = map['width'];
  }
}

class EmbedProvider {
  String name;
  String url;

  EmbedProvider();

  factory EmbedProvider.fromMap(Map map) {
    return EmbedProvider()
      ..name = map['name']
      ..name = map['url'];
  }
}

class EmbedAuthor {
  String name;
  String url;
  String icon_url, proxy_icon_url;

  EmbedAuthor();

  factory EmbedAuthor.fromMap(Map map) {
    return EmbedAuthor()
      ..name = map['name']
      ..url = map['url']
      ..icon_url = map['icon_url']
      ..proxy_icon_url = map['proxy_icon_url'];
  }
}
