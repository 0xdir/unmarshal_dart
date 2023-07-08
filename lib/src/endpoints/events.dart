import '../connection/connection.dart';
import '../connection/response.dart';

/// This is a collection of related endpoints
class Events {
  late final Connection _connection;
  late final String _authToken;

  Events(config) {
    _connection = config['connection'];
    _authToken = config['authToken'];
  }

  /// Get Events
  ///
  /// Returns all transactions logs between specified blocks. All log
  /// events related to a given topic between blocks can be fetched
  /// via this endpoint.
  ///
  /// Get All Logs between specified blocks:
  /// Block filtering, return all logs between those blocks.
  ///
  /// If fromBlock and toBlock are not specified then the recent 5
  /// block logs will be returned.
  ///
  /// [fromBlock] specifies from which block logs should be picked,
  /// [toBlock] specifies till which block.
  ///
  /// Note: This query takes awhile (about 20 seconds).
  Future<Response> getEvents({
    /// The name of the chain
    ///
    /// eg. "ethereum"
    required String chain,

    /// Topics which are to be filtered in logs
    String topics =
        '0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef',

    /// Starting block from which the transactions should be considered
    int? fromBlock,

    /// End block till which the transactions should be considered
    int? toBlock,
  }) async {
    return await _connection.get(
      endpoint: '/v1/$chain/topics/logs',
      params: {
        'topics': topics,
        'fromBlock': fromBlock?.toString(),
        'toBlock': toBlock?.toString(),
        'auth_key': _authToken,
      },
    );
  }
}
