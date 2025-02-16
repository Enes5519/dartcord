part of '../dartcord.dart';

class Snowflake {
  int id;

  @override
  String toString() => id.toString();

  Snowflake(dynamic id) {
    this.id = id is String ? int.parse(id) : id as int;
  }

  factory Snowflake.get(foo){
    return foo != null ? Snowflake(foo) : null;
  }

  @override
  int get hashCode => id.hashCode;
  @override
  bool operator ==(dynamic idOther) => id.toString() == idOther.toString();
}