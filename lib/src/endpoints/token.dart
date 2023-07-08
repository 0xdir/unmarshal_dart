import '../connection/connection.dart';
import '../connection/response.dart';

/// This is a collection of related endpoints
///
/// Token Store
///
/// With data of more than 100,000+ tokens, Token Store is one
/// of the finest products when it comes to querying token
/// attributes; either with the contract address of the token
/// or with the token ticker itself. This gives developers
/// the flexibility and ease of querying data in more than one way
/// with just a single line of code.
///
/// The details fetched by the product is comprehensive along with
/// granular information. The distinctive data fetched for every
/// query through Token Store: “Symbol”, “Contract”, “Logo”,
/// “Decimal”, “Blockchain”, “Website”, “Total Supply”, "Verified"
/// and “Explorer” Verified flag returns the status of token.
///
/// If its a valid token the API returns true, else returns false.
class Token {
  late final Connection _connection;
  late final String _authToken;

  Token(config) {
    _connection = config['connection'];
    _authToken = config['authToken'];
  }

  /// Get information of a token by contract address
  Future<Response> getDetailsByContract({
    /// The contract address of the token
    required String address,
  }) async {
    return await _connection.get(
      endpoint: '/v1/tokenstore/token/address/$address',
      params: {
        'auth_key': _authToken,
      },
    );
  }

  /// Get information of a token by token symbol
  Future<Response> getDetailsBySymbol({
    /// The token symbol
    ///
    /// eg. marsh
    required String symbol,
  }) async {
    return await _connection.get(
      endpoint: '/v1/tokenstore/token/symbol/$symbol',
      params: {
        'auth_key': _authToken,
      },
    );
  }

  /// List all tokens on Ethereum, BSC, and Polygon
  Future<Response> getAllTokens({
    /// The page to query
    required int page,

    /// The size of the page
    required int pageSize,
  }) async {
    return await _connection.get(
      endpoint: '/v1/tokenstore/token/all',
      params: {
        'page': page.toString(),
        'pageSize': pageSize.toString(),
        'auth_key': _authToken,
      },
    );
  }
}
