import 'dart:io';

class P2PSocket {
  RawDatagramSocket _socket;
  InternetAddress get address => _socket.address;

  Future<Stream<RawSocketEvent>> bind(num host, num port) async {
    print("Binding P2P socket to ($host, $port)");
    _socket = await RawDatagramSocket.bind(host, port);
    return _socket.timeout(Duration.zero);
  }

  void close() => _socket.close();

  List<int> receive() => _socket.receive().data;

  int send(List<int> data,
      InternetAddress address,
      int port) => _socket.send(data, address, port);
}

