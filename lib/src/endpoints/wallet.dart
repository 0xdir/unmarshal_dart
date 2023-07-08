import '../connection/connection.dart';
import '../connection/response.dart';

/// This is a collection of related endpoints
class Wallet {
  late final Connection _connection;
  late final String _authToken;

  Wallet(config) {
    _connection = config['connection'];
    _authToken = config['authToken'];
  }

  /// Get token balances with pagination
  ///
  /// The Token Balances API with pagination enables the retrieval
  /// of the balance of the native token and all ERC20 fungible tokens
  /// for a specific [chain], based on a particular [address].
  ///
  /// It also allows for pagination to improve response times
  /// when dealing with large numbers of tokens.
  ///
  /// This API will become the default option once support for the
  /// older Token Balances API is deprecated.
  ///
  /// Note:
  /// To fetch items on the next page, pass next_offset value of
  /// current page as the offset.
  ///
  /// For Kadena and Solana, all assets will be returned in a single
  /// response.
  Future<Response> getTokenBalance({
    /// The name of the chain to be queried
    ///
    /// Options: 'ethereum', 'bsc', 'matic', 'kadena', 'celo', 'klaytn',
    /// 'cronos', 'velas', 'arbitrum', 'avalanche', 'xinfin', 'zilliqa',
    /// 'solana', 'fantom', 'fuse', 'aurora', 'bsc-testnet',
    required String chain,

    /// A valid address or ENS
    ///
    /// eg. vitalik.eth
    required String address,

    /// Set true for only verified tokens
    bool verified = false,

    /// Number of records to be fetched per page
    int pageSize = 5,

    /// The offset to start with, this is returned in the previous
    /// response
    int offset = 0,

    /// Return details for requested chain id (For Kadena chain)
    String chainId = 'false',

    /// Return balances of the requested token (For Kadena chain)
    String token = 'false',

    /// Return aggregated balances across all chains (For Kadena chain)
    String aggregatedBalance = 'false',
  }) async {
    return await _connection.get(
      endpoint: '/v2/$chain/address/$address/assets',
      params: {
        'verified': verified.toString(),
        'pageSize': pageSize.toString(),
        'offset': offset.toString(),
        'chainId': chainId,
        'token': token,
        'aggregatedBalance': aggregatedBalance,
        'auth_key': _authToken,
      },
    );
  }

  /// Get Profit and Loss
  ///
  /// The Profit/Loss API returns the net profit or loss made by a
  /// specified address for a particular token.
  Future<Response> getProfitAndLoss({
    /// The wallet address
    required String address,

    /// The name of the chain eg. 'ethereum'
    required String chain,

    /// The contract address of the token
    required String contract,
  }) async {
    return await _connection.get(
      endpoint: '/v2/$chain/address/$address/userData',
      params: {
        'contract': contract,
        'auth_key': _authToken,
      },
    );
  }

  /// Token Holders Count
  ///
  /// The Token Holders API enables the retrieval of the total number
  /// of token holders for a specific token contract address.
  Future<Response> getTokenHoldersCount({
    /// A valid Erc20 token address
    required String address,

    /// The name of the chain eg. 'ethereum'
    required String chain,
  }) async {
    return await _connection.get(
      endpoint: '/v1/$chain/token-address/$address/holders-count',
      params: {
        'auth_key': _authToken,
      },
    );
  }

  /// Top Token Holders
  ///
  /// The Top Holders API retrieves the list of the top token holders
  /// for a specific token on the Ethereum and Polygon blockchains.
  Future<Response> getTopTokenHolders({
    /// A valid Erc20 token address
    required String contract,

    /// The name of the chain eg. 'ethereum'
    required String chain,
  }) async {
    return await _connection.get(
      endpoint: '/v1/$chain/contract/$contract/top-holders',
      params: {
        'auth_key': _authToken,
      },
    );
  }

  /// Batch Assets V3
  ///
  /// The Batch Assets API enables the retrieval of wallet balances
  /// across multiple blockchain networks by batching together
  /// multiple asset balance API requests. The API accepts comma-separated
  /// addresses and chains as input parameters, allowing for efficient
  /// retrieval of wallet balances on multiple networks in a single
  /// API call.
  Future<Response> getBalanceMultichain({
    /// Comma separated wallet addresses
    ///
    /// eg. "address1,address2"
    required String wallets,

    /// A comma separated list of chains
    ///
    /// eg. "ethereum,bsc"
    required String chains,
  }) async {
    return await _connection.get(
      endpoint: '/v3/batch-assets',
      params: {
        'wallets': wallets,
        'chains': chains,
        'auth_key': _authToken,
      },
    );
  }
}
