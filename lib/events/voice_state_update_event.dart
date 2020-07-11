part of '../dartcord.dart';

class VoiceStateUpdateEvent extends Event{
  @override
  String getName() {
    return 'VOICE_STATE_UPDATE';
  }

  @override
  void handle(DiscordClient client, data) {
    var voiceState = VoiceState.fromMap(data);
    // TODO : Event
    print('Voice State User Id: ' + voiceState.user_id.toString());
  }
}