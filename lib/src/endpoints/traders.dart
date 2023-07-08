import '../connection/connection.dart';
import '../connection/response.dart';

/// This is a collection of related endpoints
class Traders {
  late final Connection _connection;
  late final String _authToken;

  Traders(config) {
    _connection = config['connection'];
    _authToken = config['authToken'];
  }

  /// Get top traders for a pair on pancakeswap v2
  ///
  /// Note: This endpoint is dex specific and supports
  /// only by pancakeswap v2 contract.
  Future<Response> getTopTraders({
    /// The name of the pair
    ///
    /// eg. 'marsh-bnb'
    required String pair,

    /// The contract address of the token pair
    required String token,
  }) async {
    return await _connection.get(
      endpoint: '/v2/$pair/top-traders',
      params: {
        'token': token,
        'auth_key': _authToken,
      },
    );
  }
}
