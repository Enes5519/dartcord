part of '../dartcord.dart';

class ReadyEvent extends Event{
  @override
  String getName() {
    return 'READY';
  }

  @override
  void handle(DiscordClient client, data) {
    client.ready = true;
    client.sessionId = data['session_id'] as String;
    client.user = User.fromMap(data['user']);
  }
}