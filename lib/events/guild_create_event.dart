part of '../dartcord.dart';

class GuildCreateEvent extends Event{
  @override
  String getName() {
    return 'GUILD_CREATE';
  }

  @override
  void handle(DiscordClient client, data) {
    print(data);
  }
}