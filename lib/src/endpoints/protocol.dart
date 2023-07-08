import '../connection/connection.dart';
import '../connection/response.dart';

/// This is a collection of related endpoints
class Protocol {
  late final Connection _connection;
  late final String _authToken;

  Protocol(config) {
    _connection = config['connection'];
    _authToken = config['authToken'];
  }

  /// Get all LP positions on a protocol for a wallet address
  Future<Response> getLpPositions({
    /// The wallet address or ENS
    ///
    /// eg. 'demo.eth'
    required String address,

    /// Protocols supported: pancakeswap_v2, uniswap_v2
    required String protocols,
  }) async {
    return await _connection.get(
      endpoint: '/v2/protocols/$protocols/address/$address/positions',
      params: {
        'auth_key': _authToken,
      },
    );
  }

  /// Get all LP pairs on a protocol
  Future<Response> getLpPairs({
    /// Protocols supported: pancakeswap_v2, uniswap_v2
    required String protocols,

    /// The page to query
    required int page,

    /// The size of the page
    required int pageSize,
  }) async {
    return await _connection.get(
      endpoint: '/v2/protocols/$protocols/pairs',
      params: {
        'page': page.toString(),
        'pageSize': pageSize.toString(),
        'auth_key': _authToken,
      },
    );
  }

  /// Get all the transactions with a protocol for a wallet address
  Future<Response> getLpTransactions({
    /// Protocols supported: pancakeswap_v2, uniswap_v2
    required String protocols,

    /// The wallet address
    required String address,

    /// The page to query
    required int page,

    /// The size of the page
    required int pageSize,
  }) async {
    return await _connection.get(
      endpoint: '/v2/protocols/$protocols/address/$address/lp_transactions',
      params: {
        'page': page.toString(),
        'pageSize': pageSize.toString(),
        'auth_key': _authToken,
      },
    );
  }
}
