import '../connection/connection.dart';
import '../connection/response.dart';

/// This is a collection of related endpoints
///
/// Price Store
///
/// The price store API contains endpoints that provides the
/// latest price of a token as well as historical price of the
/// tokens, these tokens can also be LP tokens.
///
/// Tokens supported from ETH/BSC/Matic chains.
///
/// These api's also provide top losers and gainers.
class Price {
  late final Connection _connection;
  late final String _authToken;

  Price(config) {
    _connection = config['connection'];
    _authToken = config['authToken'];
  }

  /// Get the latest price of a token by token symbol
  Future<Response> getPriceBySymbol({
    /// The token symbol
    ///
    /// Only for tokens on Ethereum, BSC, Polygon, Arbitrum
    ///
    /// eg. 'weth'
    required String symbol,

    /// Provide a unix timestamp to get the historical price
    String? timestamp,
  }) async {
    return await _connection.get(
      endpoint: '/v1/pricestore/$symbol',
      params: {
        'timestamp': timestamp,
        'auth_key': _authToken,
      },
    );
  }

  /// Get the latest price of a token by token address
  Future<Response> getPriceByAddress({
    /// The token contract address
    ///
    /// Only for tokens on Ethereum, BSC, Polygon, Arbitrum
    ///
    required String address,

    /// The name of the chain to query
    ///
    /// Options: 'ethereum', 'bsc', 'matic', 'arbitrum'
    required String priceStoreChains,

    /// Provide a unix timestamp to get the historical price
    String? timestamp,

    /// The param to fetch 24h change in price
    String? change,

    /// Set true to fetch from other chains if not found
    /// in current chain
    String? alternateChain,
  }) async {
    return await _connection.get(
      endpoint: '/v1/pricestore/chain/$priceStoreChains/$address',
      params: {
        'timestamp': timestamp,
        'change': change,
        'alternateChain': alternateChain,
        'auth_key': _authToken,
      },
    );
  }

  /// Get prices for multiple tokens at once
  Future<Response> getMultipleTokenPrice({
    /// The name of the chain to query
    ///
    /// Options: 'ethereum', 'bsc', 'matic', 'arbitrum'
    required String priceStoreChains,

    /// A list of comma separated token contract addresses
    ///
    /// eg. 'address1,address2'
    String? tokens,
  }) async {
    return await _connection.get(
      endpoint: '/v1/pricestore/chain/$priceStoreChains/tokens',
      params: {
        'tokens': tokens,
        'auth_key': _authToken,
      },
    );
  }

  /// Top gainers in the last 24 hours
  Future<Response> getTopGainers({
    /// The name of the chain to query
    ///
    /// Options: 'ethereum', 'bsc', 'matic', 'arbitrum'
    required String priceStoreChains,

    /// Filter results above this price
    double? price,
  }) async {
    return await _connection.get(
      endpoint: '/v1/pricestore/chain/$priceStoreChains/gainers',
      params: {
        'price': price.toString(),
        'auth_key': _authToken,
      },
    );
  }

  /// Top losers in the last 24 hours
  Future<Response> getTopLosers({
    /// The name of the chain to query
    ///
    /// Options: 'ethereum', 'bsc', 'matic', 'arbitrum'
    required String priceStoreChains,

    /// Filter results above this price
    double? price,
  }) async {
    return await _connection.get(
      endpoint: '/v1/pricestore/chain/$priceStoreChains/losers',
      params: {
        'price': price.toString(),
        'auth_key': _authToken,
      },
    );
  }

  /// Get price for LP token by contract address
  ///
  /// This endpoint only supports Ethereum LP tokens.
  ///
  ///
  Future<Response> getLPTokenPrice({
    /// The name of the chain to query
    ///
    /// Options: 'ethereum'
    required String priceStoreChains,

    /// The contract address of the LP token on Ethereum
    required String lptokens,
  }) async {
    return await _connection.get(
      endpoint: '/v1/pricestore/chain/$priceStoreChains/lptokens',
      params: {
        'lptokens': lptokens,
        'auth_key': _authToken,
      },
    );
  }
}
