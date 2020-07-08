part of '../dartcord.dart';

class User{
  Snowflake id;
  String username;
  String discriminator;
  String avatar;
  bool bot;
  bool system;
  bool mfa_enabled;
  String locale;
  bool verified;
  String email;
  int flags;
  int premium_type;
  int public_flags;

  String get avatarUrl => 'https://cdn.discordapp.com/avatars/$id/$avatar.png';
  String get mention => '<@$id>';

  User(this.id, this.username, this.discriminator, {this.avatar});

  factory User.fromMap(Map map){
    return User(Snowflake.get(map['id']), map['username'], map['discriminator'], avatar: map['avatar'])
    ..bot = map['bot']
    ..system = map['system']
    ..mfa_enabled = map['mfa_enabled']
    ..locale = map['locale']
    ..verified = map['verified']
    ..email = map['email']
    ..flags = map['flags']
    ..premium_type = map['premium_type']
    ..public_flags = map['public_flags'];
  }

  @override
  String toString() => mention;
}