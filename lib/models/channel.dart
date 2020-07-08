part of '../dartcord.dart';

class Channel{
  Snowflake id;
  ChannelType type;
  Snowflake guild_id;
  int position;
  List permission_overwrites = [];
  String name;
  String topic;
  bool nsfw;
  Snowflake last_message_id;
  int bitrate;
  int user_limit;
  int rate_limit_per_user;
  List<User> recipients = [];
  String icon;
  Snowflake owner_id;
  Snowflake application_id;
  Snowflake parent_id;
  DateTime last_pin_timestamp;

  static Map<int, Type> types = {
    ChannelType.GUILD_TEXT.index: TextChannel,
    ChannelType.DM.index: DMChannel,
    ChannelType.GUILD_VOICE.index: VoiceChannel,
    ChannelType.GROUP_DM.index: GroupDMChannel,
    ChannelType.GUILD_CATEGORY.index: CategoryChannel,
    ChannelType.GUILD_NEWS.index: NewsChannel,
    ChannelType.GUILD_STORE.index: StoreChannel,
  };

  Channel();

  factory Channel.fromMap(Map map){
    Channel channel;
    switch(ChannelType.values[map['type']]){
      case ChannelType.GUILD_TEXT:
        channel = TextChannel();
        break;
      case ChannelType.DM:
        channel = DMChannel();
        break;
      case ChannelType.GUILD_VOICE:
        channel = VoiceChannel();
        break;
      case ChannelType.GROUP_DM:
        channel = GroupDMChannel();
        break;
      case ChannelType.GUILD_CATEGORY:
        channel = CategoryChannel();
        break;
      case ChannelType.GUILD_NEWS:
        channel = NewsChannel();
        break;
      case ChannelType.GUILD_STORE:
        channel = StoreChannel();
        break;
    }

    channel
      ..id = Snowflake(map['id'])
      ..guild_id = Snowflake(map['guild_id'])
      ..position = map['position']
      ..permission_overwrites = map['permission_overwrites']
      ..name = map['name']
      ..topic = map['topic']
      ..nsfw = map['nsfw']
      ..last_message_id = Snowflake(map['last_message_id'])
      ..bitrate = map['bitrate']
      ..user_limit = map['user_limit']
      ..rate_limit_per_user = map['rate_limit_per_user']
      ..icon = map['icon']
      ..owner_id = Snowflake(map['owner_id'])
      ..application_id = Snowflake(map['application_id'])
      ..parent_id = Snowflake(map['parent_id'])
      ..last_pin_timestamp = (map['last_pin_timestamp'] != null) ? DateTime.parse(map['last_pin_timestamp']) : null;

    if(map['recipients'] != null){
      map['recipients'].forEach((element){
        channel.recipients.add(User.fromMap(element));
      });
    }

    return channel;
  }
}


class TextChannel extends Channel{
  @override
  ChannelType type = ChannelType.GUILD_TEXT;
}

class DMChannel extends Channel{
  @override
  ChannelType type = ChannelType.DM;
}

class VoiceChannel extends Channel{
  @override
  ChannelType type = ChannelType.GUILD_VOICE;
}

class GroupDMChannel extends Channel{
  @override
  ChannelType type = ChannelType.GROUP_DM;
}

class CategoryChannel extends Channel{
  @override
  ChannelType type = ChannelType.GUILD_CATEGORY;

  CategoryChannel();
}

class NewsChannel extends Channel{
  @override
  ChannelType type = ChannelType.GUILD_NEWS;
}

class StoreChannel extends Channel{
  @override
  ChannelType type = ChannelType.GUILD_STORE;
}