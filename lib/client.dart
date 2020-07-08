part of 'dartcord.dart';

class DiscordClient {
  static const int API_VERSION = 6;

  final String token;
  final TokenType tokenType;
  EventManager eventManager;

  Timer _heartbeat;
  WebSocket _socket;
  int _lastSeq;

  bool ready = false;
  bool _closed = false;

  Route get api => Route(this);

  User user;

  /// The current session ID of this client.
  String sessionId;

  /// The shard of the current client.
  int shard;
  /// The total number of shards that this bot is using.
  int shardCount;

  Map<Snowflake, Guild> guilds = {};

  DiscordClient(this.token, {this.tokenType = TokenType.bot}){
    eventManager = EventManager();
  }

  Future<String> _getGateway() async {
    final response = await (api + 'gateway').get();
    return json.decode(response.body)['url'] as String;
  }

  void _sendHeartbeat(Timer timer) {
    final packet = Packet(data: _lastSeq, opcode: OpCode.HEARTBEAT);
    _socket.add(packet.toString());
  }

  void _sendIdentify() {
    final packet = Packet(opcode: OpCode.IDENTIFY, seq: _lastSeq, data: {
      'token': token,
      'properties': {
        '\$os': 'linux',
        '\$browser': 'dartcord',
        '\$device': 'dartcord'
      },
      'compress': false,
      'large_threshold': 250
    });
    if (shard != null) packet.data['shard'] = [shard, shardCount];

    _socket.add(packet.toString());
  }

  Future<dynamic> disconnect({bool reconnect = false}) async {
    _closed = !reconnect;
    return await _socket.close();
  }

  Future<void> _reconnect() =>
      _establishConnection(reconnect: true);

  Future<void> connect() =>
      _establishConnection(reconnect: false);

  Future<void> _establishConnection({bool reconnect = false}) async {
    final gateway = await _getGateway();
    _socket = await WebSocket.connect(gateway + '?v=' + API_VERSION.toString() + '&encoding=json');

    _socket.listen((payloadRaw) async {
      final payload = json.decode(payloadRaw as String);
      final packet = Packet.fromPayload(payload);

      if (packet.seq != null) _lastSeq = packet.seq;

      print(packet.opcode.index);

      switch(packet.opcode){
        case OpCode.DISPATCH:
          if(eventManager.events.containsKey(packet.event)){
            eventManager.events[packet.event].handle(this, packet.data);
          }else{
            print(packet.event);
          }
          break;
        case OpCode.HEARTBEAT:
          _sendHeartbeat(_heartbeat);
          break;
        case OpCode.RECONNECT:
          await disconnect(reconnect: true);
          break;
        case OpCode.INVALID_SESSION:
          await Future.delayed(const Duration(seconds: 3));
          _sendIdentify();
          break;
        case OpCode.HELLO:
          _heartbeat = Timer.periodic(
              Duration(
                  milliseconds: packet.data['heartbeat_interval'] as int),
              _sendHeartbeat);
          if (reconnect) {
            _socket.add(Packet(opcode: OpCode.RESUME, seq: _lastSeq, data: {
              'token': token,
              'session_id': sessionId,
              'seq': _lastSeq
            }).toString());
          } else {
            _sendIdentify();
          }
          break;
        default:
          break;
      }
    }, onError: (e) {
      print(e.toString());
    }, onDone: () {
      _socket.close();
      _heartbeat.cancel();

      if (!_closed) {
        _reconnect();
      }
    }, cancelOnError: true);
  }
}