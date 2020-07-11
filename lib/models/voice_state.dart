part of '../dartcord.dart';

class VoiceState {
  Snowflake guild_id, channel_id, user_id;
  Member member;
  String session_id;
  bool deaf, mute, self_deaf, self_mute;
  bool self_video;
  bool suppress;

  VoiceState(this.user_id, this.session_id, this.deaf, this.self_deaf,
      this.mute, this.self_mute);

  factory VoiceState.fromMap(Map map) {
    return VoiceState(Snowflake.get(map['user_id']), map['session_id'], map['deaf'],
        map['self_deaf'], map['mute'], map['self_mute'])
      ..guild_id = Snowflake.get(map['guild_id'])
      ..channel_id = Snowflake.get(map['channel_id'])
      ..member = map['member'] != null ? Member.fromMap(map['member']) : null
      ..self_video = map['self_video'] ?? map['self_stream']
      ..suppress = map['suppress'];
  }
}
