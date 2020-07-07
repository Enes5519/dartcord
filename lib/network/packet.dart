part of '../dartcord.dart';

class Packet{
  OpCode opcode;
  int seq;
  dynamic data;
  String event;

  Packet({this.opcode, this.data, this.seq, this.event});

  factory Packet.fromPayload(payload){
    return Packet(
        data: payload['d'],
        event: payload['t'] as String,
        opcode: OpCode.values[payload['op'] as int],
        seq: payload['s'] as int);
  }

  @override
  String toString() =>
      json.encode({'op': opcode.index, 'd': data, 's': seq, 't': event});
}