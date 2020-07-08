part of '../dartcord.dart';

class Message {
  final Snowflake id;
  final Snowflake channel_id;
  Snowflake guild_id;
  User author;
  Member member;
  String content;
  DateTime timestamp;
  DateTime edited_timestamp;
  bool tts;
  bool mention_everyone;
  List<User> mentions = [];
  List<Role> mention_roles = [];
  List<ChannelMention> mention_channels = [];
  List<Attachment> attachments = [];
  List<Embed> embeds = [];
  List<Reaction> reactions = [];
  bool pinned;
  Snowflake webhook_id;
  MessageType type;
  MessageActivity activity;
  MessageApplication application;
  MessageReference message_reference;
  int flags;

  Message(this.id, this.channel_id);

  factory Message.fromMap(Map map) {
    var message = Message(Snowflake(map['id']), Snowflake(map['channel_id']))
      ..guild_id = Snowflake.get(map['guild_id'])
      ..author = map['author'] != null ? User.fromMap(map['author']) : null
      ..member = map['member'] != null ? Member.fromMap(map['member']) : null
      ..content = map['content']
      ..timestamp =
          map['timestamp'] != null ? DateTime.parse(map['timestamp']) : null
      ..edited_timestamp = map['edited_timestamp'] != null
          ? DateTime.parse(map['edited_timestamp'])
          : null
      ..tts = map['tts']
      ..mention_everyone = map['mention_everyone']
      ..pinned = map['pinned']
      ..webhook_id = Snowflake.get(map['webhook_id'])
      ..type = MessageType.values[map['type']]
      ..activity = map['activity'] != null
          ? MessageActivity.fromMap(map['activity'])
          : null
      ..application = map['application'] != null
          ? MessageApplication.fromMap(map['application'])
          : null
      ..message_reference = map['message_reference'] != null
          ? MessageReference.fromMap(map['message_reference'])
          : null
      ..flags = map['flags'];

    if (map['mentions'] != null) {
      map['mentions'].forEach((element) {
        message.mentions.add(User.fromMap(element));
      });
    }

    if (map['mention_roles'] != null) {
      map['mention_roles'].forEach((element) {
        message.mention_roles.add(Role.fromMap(element));
      });
    }

    if (map['mention_channels'] != null) {
      map['mention_channels'].forEach((element) {
        message.mention_channels.add(ChannelMention.fromMap(element));
      });
    }

    if (map['attachments'] != null) {
      map['attachments'].forEach((element) {
        message.attachments.add(Attachment.fromMap(element));
      });
    }

    if (map['embeds'] != null) {
      map['embeds'].forEach((element) {
        message.embeds.add(Embed.fromMap(element));
      });
    }

    if (map['reactions'] != null) {
      map['reactions'].forEach((element) {
        message.reactions.add(Reaction.fromMap(element));
      });
    }

    return message;
  }
}

class MessageActivity {
  final MessageActivityType type;
  String party_id;

  MessageActivity(this.type, {this.party_id});

  factory MessageActivity.fromMap(Map map) {
    return MessageActivity(
      MessageActivityType.values[map['type']],
      party_id: map['party_id'],
    );
  }
}

class MessageApplication {
  final Snowflake id;
  String cover_image;
  final String description;
  String icon;
  final String name;

  MessageApplication(this.id, this.description, this.name,
      {this.cover_image, this.icon});

  factory MessageApplication.fromMap(Map map) {
    return MessageApplication(
      Snowflake(map['id']),
      map['description'],
      map['name'],
      cover_image: map['cover_image'],
      icon: map['icon'],
    );
  }
}

class MessageReference {
  Snowflake message_id, channel_id, guild_id;

  MessageReference({this.message_id, this.channel_id, this.guild_id});

  factory MessageReference.fromMap(Map map) {
    return MessageReference(
      message_id: Snowflake.get(map['message_id']),
      channel_id: Snowflake.get(map['channel_id']),
      guild_id: Snowflake.get(map['guild_id']),
    );
  }
}
