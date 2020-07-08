part of '../dartcord.dart';

class EventManager{
  Map<String, Event> events = {};

  EventManager(){
    register(ReadyEvent());
    register(GuildCreateEvent());
  }

  void register(Event event){
    events[event.getName()] = event;
  }
}