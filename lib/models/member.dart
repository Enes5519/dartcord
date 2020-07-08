part of '../dartcord.dart';

class Member{
  User user;
  String nick;
  List<Snowflake> roles = [];
  DateTime joined_at;
  DateTime premium_since;
  bool deaf;
  bool mute;

  Member(this.user, this.nick);

  factory Member.fromMap(Map map){
    var member = Member(
        (map['user'] != null) ? User.fromMap(map['user']) : null, map['nick'])
      ..joined_at = (map['joined_at'] != null) ? DateTime.parse(map['joined_at']) : null
      ..premium_since = (map['premium_since'] != null) ? DateTime.parse(map['premium_since']) : null
      ..deaf = map['deaf']
      ..mute = map['mute'];

    map['roles'].forEach((element) {
      member.roles.add(Snowflake(element));
    });

    return member;
  }
}