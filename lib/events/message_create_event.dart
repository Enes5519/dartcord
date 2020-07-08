part of '../dartcord.dart';

class MessageCreateEvent extends Event{
  @override
  String getName() {
    return 'MESSAGE_CREATE';
  }

  @override
  void handle(DiscordClient client, data) {
    var message = Message.fromMap(data);
    print(message.author.username + ': ' + message.content);
  }
}