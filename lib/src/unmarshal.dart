import 'endpoints/wallet.dart';
import 'endpoints/transaction.dart';
import 'endpoints/nfts.dart';
import 'endpoints/protocol.dart';
import 'endpoints/price.dart';
import 'endpoints/token.dart';
import 'endpoints/traders.dart';
import 'endpoints/blocks.dart';
import 'endpoints/events.dart';
import 'connection/connection.dart';

/// This is the main object
class Unmarshal {
  /// The http client
  late final Connection _connection;

  /// THe API endpoints
  late final Wallet wallet;
  late final Transaction transaction;
  late final Protocol protocol;
  late final Nfts nfts;
  late final Price price;
  late final Token token;
  late final Traders traders;
  late final Blocks blocks;
  late final Events events;

  /// Initialize the main object
  Unmarshal({required authToken}) {
    _connection = Connection();
    Map<String, dynamic> config = {
      'connection': _connection,
      'authToken': authToken,
    };

    /// Initialize the API endpoints
    wallet = Wallet(config);
    transaction = Transaction(config);
    nfts = Nfts(config);
    protocol = Protocol(config);
    price = Price(config);
    token = Token(config);
    traders = Traders(config);
    blocks = Blocks(config);
    events = Events(config);
  }

  /// Close the client
  void close() {
    _connection.close();
  }
}
