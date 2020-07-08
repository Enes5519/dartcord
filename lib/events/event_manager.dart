part of '../dartcord.dart';

class EventManager{
  Map<String, Event> events = {};

  EventManager(){
    register(ReadyEvent());
    register(GuildCreateEvent());
    register(MessageCreateEvent());
  }

  void register(Event event){
    events[event.getName()] = event;
  }
}