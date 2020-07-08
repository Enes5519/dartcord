part of 'dartcord.dart';

enum TokenType { bot, user }

enum OpCode {
  DISPATCH,
  HEARTBEAT,
  IDENTIFY,
  PRESENCE_UPDATE,
  VOICE_STATE_UPDATE,
  FIVE,
  RESUME,
  RECONNECT,
  REQUEST_GUILD_MEMBERS,
  INVALID_SESSION,
  HELLO,
  HEARTBEAT_ACK
}

enum DefaultMessageNotificationLevel { ALL_MESSAGES, ONLY_MENTIONS }
enum ExplicitContentFilterLevel { DISABLED, MEMBERS_WITHOUT_ROLES, ALL_MEMBERS }
enum MFALevel { NONE, ELEVATED }
enum VerificationLevel { NONE, LOW, MEDIUM, HIGH, VERY_HIGH }
enum PremiumTier { NONE, TIER_1, TIER_2, TIER_3 }
enum ChannelType {
  GUILD_TEXT,
  DM,
  GUILD_VOICE,
  GROUP_DM,
  GUILD_CATEGORY,
  GUILD_NEWS,
  GUILD_STORE
}
