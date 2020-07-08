part of '../dartcord.dart';

class GuildCreateEvent extends Event{
  @override
  String getName() {
    return 'GUILD_CREATE';
  }

  @override
  void handle(DiscordClient client, data) {
    var guild = Guild.fromMap(data);
    client.guilds[guild.id] = guild;

    guild.channels.forEach((element) { print(element.type); });
  }
}