part of '../dartcord.dart';

class Reaction{

  final int count;
  final bool me;
  final Emoji emoji;

  Reaction(this.count, this.me, this.emoji);

  factory Reaction.fromMap(Map map){
    return Reaction(map['count'], map['me'], Emoji.fromMap(map['emoji']));
  }
}