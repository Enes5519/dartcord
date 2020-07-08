part of '../dartcord.dart';

abstract class Event{
  void handle(DiscordClient client, data);
  String getName();
}