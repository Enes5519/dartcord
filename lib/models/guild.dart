part of '../dartcord.dart';

class Guild {
  final Snowflake id;
  final String name;
  String icon;
  String splash;
  String discovery_splash;
  final Snowflake owner_id;
  int permissions;
  String region;
  Snowflake afk_channel_id;
  int afk_timeout;
  bool embed_enabled;
  Snowflake embed_channel_id;
  VerificationLevel verification_level;
  DefaultMessageNotificationLevel default_message_notifications;
  ExplicitContentFilterLevel explicit_content_filter;
  List<Role> roles = [];
  List<Emoji> emojis = [];
  List features = [];
  MFALevel mfa_level;
  Snowflake application_id;
  bool widget_enabled;
  Snowflake widget_channel_id;
  Snowflake system_channel_id;
  int system_channel_flags;
  Snowflake rules_channel_id;
  DateTime joined_at;
  bool large;
  bool unavailable;
  int member_count;
  List<Member> members = [];
  List<Channel> channels = [];
  List presences = []; // TODO
  int max_presences;
  int max_members;
  String vanity_url_code;
  String description;
  String banner;
  PremiumTier premium_tier;
  int premium_subscription_count;
  String preferred_locale;
  Snowflake public_updates_channel_id;
  int max_video_channel_users;
  int approximate_member_count;
  int approximate_presence_count;

  Guild(this.id, this.name, this.owner_id);

  factory Guild.fromMap(Map map) {
    var guild = Guild(
        Snowflake(map['id']), map['name'], Snowflake(map['owner_id']))
      ..icon = map['icon']
      ..splash = map['splash']
      ..discovery_splash = map['discovery_splash']
      ..permissions = map['permissions']
      ..region = map['region']
      ..afk_channel_id = Snowflake(map['afk_channel_id'])
      ..afk_timeout = map['afk_timeout']
      ..embed_enabled = map['embed_enabled']
      ..embed_channel_id = Snowflake(map['embed_channel_id'])
      ..verification_level = VerificationLevel.values[map['verification_level']]
      ..default_message_notifications = DefaultMessageNotificationLevel
          .values[map['default_message_notifications']]
      ..explicit_content_filter =
          ExplicitContentFilterLevel.values[map['explicit_content_filter']]
      ..features = map['features']
      ..mfa_level = MFALevel.values[map['mfa_level']]
      ..application_id = Snowflake(map['application_id'])
      ..widget_enabled = map['widget_enabled']
      ..widget_channel_id = Snowflake(map['widget_channel_id'])
      ..system_channel_id = Snowflake(map['system_channel_id'])
      ..system_channel_flags = map['system_channel_flags']
      ..rules_channel_id = Snowflake(map['rules_channel_id'])
      ..joined_at = DateTime.parse(map['joined_at'])
      ..large = map['large']
      ..unavailable = map['unavailable']
      ..member_count = map['member_count']
      ..presences = map['presences']
      ..max_presences = map['max_presences']
      ..max_members = map['max_members']
      ..vanity_url_code = map['vanity_url_code']
      ..description = map['description']
      ..banner = map['banner']
      ..premium_tier = PremiumTier.values[map['premium_tier']]
      ..premium_subscription_count = map['premium_subscription_count']
      ..preferred_locale = map['preferred_locale']
      ..public_updates_channel_id = Snowflake(map['public_updates_channel_id'])
      ..max_video_channel_users = map['max_video_channel_users']
      ..approximate_member_count = map['approximate_member_count']
      ..approximate_presence_count = map['approximate_presence_count'];

    map['roles'].forEach((element) {
      guild.roles.add(Role.fromMap(element));
    });

    map['emojis'].forEach((element) {
      guild.emojis.add(Emoji.fromMap(element));
    });

    map['members'].forEach((element) {
      guild.members.add(Member.fromMap(element));
    });

    map['channels'].forEach((element) {
      guild.channels.add(Channel.fromMap(element));
    });

    return guild;
  }
}
