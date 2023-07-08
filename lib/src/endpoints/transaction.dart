import '../connection/connection.dart';
import '../connection/response.dart';

/// This is a collection of related endpoints
class Transaction {
  late final Connection _connection;
  late final String _authToken;

  Transaction(config) {
    _connection = config['connection'];
    _authToken = config['authToken'];
  }

  /// Get transaction History for a wallet address
  ///
  /// Returns a list of all transactions associated with a wallet address.
  /// The transactions are returned in reverse chronological order,
  /// with the most recent transactions appearing first. Additionally,
  /// the API includes decrypt log events in the response.
  Future<Response> getTransactionHistory({
    /// A wallet address or ENS
    required String address,

    /// The name of the chain
    ///
    /// Options: 'ethereum', 'bsc', 'matic', 'celo', 'kadena', 'klaytn',
    /// 'cronos', 'velas', 'arbitrum', 'avalanche', 'xinfin', 'zilliqa',
    /// 'solana', 'fantom', 'fuse', 'aurora', 'bsc-testnet',
    /// 'matic-testnet', 'rinkeby-testnet'
    required String chain,

    /// The page to query
    required int page,

    /// The number of results per page
    required int pageSize,

    /// Filter results for a specific contract address
    String? contract,

    /// Starting block from which the transactions should be considered
    int? fromBlock,

    /// End block till which the transactions should be considered
    int? toBlock,

    /// Flag to enable price of tokens at the time of transaction
    bool? price = false,

    /// Equates to search until the following transaction ID
    ///
    /// Note: only for solana
    String? before,

    /// Search from before this transaction ID
    ///
    /// Note: only for solana
    String? until,
  }) async {
    return await _connection.get(
      endpoint: '/v3/$chain/address/$address/transactions',
      params: {
        'page': page.toString(),
        'pageSize': pageSize.toString(),
        'contract': contract,
        'fromBlock': fromBlock?.toString(),
        'toBlock': toBlock?.toString(),
        'price': price?.toString(),
        'before': before,
        'until': until,
        'auth_key': _authToken,
      },
    );
  }

  /// Get transaction history with prices for a wallet address
  ///
  /// Returns a list of all transactions associated with a wallet address.
  /// The transactions are returned in reverse chronological order,
  /// with the most recent transactions appearing first. Additionally,
  /// the API includes decrypt log events in the response.
  Future<Response> getTransactionHistoryWithPrice({
    /// A wallet address or ENS
    required String address,

    /// The name of the chain
    ///
    /// Options: 'ethereum', 'bsc', 'matic', 'celo', 'kadena', 'klaytn',
    /// 'cronos', 'velas', 'arbitrum', 'avalanche', 'xinfin', 'zilliqa',
    /// 'solana', 'fantom', 'fuse', 'aurora', 'bsc-testnet',
    /// 'matic-testnet', 'rinkeby-testnet'
    required String chain,

    /// The page to query
    required int page,

    /// The number of results per page
    required int pageSize,

    /// Filter results for a specific contract address
    String? contract,

    /// Starting block from which the transactions should be considered
    int? fromBlock,

    /// End block till which the transactions should be considered
    int? toBlock,
  }) async {
    return await _connection.get(
      endpoint: '/v2/$chain/address/$address/transactions',
      params: {
        'page': page.toString(),
        'pageSize': pageSize.toString(),
        'contract': contract,
        'fromBlock': fromBlock?.toString(),
        'toBlock': toBlock?.toString(),
        'auth_key': _authToken,
      },
    );
  }

  /// Get transaction history with transaction count for a wallet address
  /// excluding token prices
  ///
  /// Returns a list of all transactions associated with a wallet address.
  /// The transactions are returned in reverse chronological order,
  /// with the most recent transactions appearing first. Additionally,
  /// the API includes decrypt log events in the response.
  Future<Response> getTransactionHistoryWithCount({
    /// A wallet address or ENS
    required String address,

    /// The name of the chain
    ///
    /// Options: 'ethereum', 'bsc', 'matic', 'celo', 'kadena', 'klaytn',
    /// 'cronos', 'velas', 'arbitrum', 'avalanche', 'xinfin', 'zilliqa',
    /// 'solana', 'fantom', 'fuse', 'aurora', 'bsc-testnet',
    /// 'matic-testnet', 'rinkeby-testnet'
    required String chain,

    /// The page to query
    required int page,

    /// The number of results per page
    required int pageSize,

    /// Filter results for a specific contract address
    String? contract,

    /// Starting block from which the transactions should be considered
    int? fromBlock,

    /// End block till which the transactions should be considered
    int? toBlock,

    /// Return details for requested chain id (For Kadena chain)
    String? chainId,
  }) async {
    return await _connection.get(
      endpoint: '/v2/$chain/address/$address/transactions',
      params: {
        'page': page.toString(),
        'pageSize': pageSize.toString(),
        'contract': contract,
        'fromBlock': fromBlock?.toString(),
        'toBlock': toBlock?.toString(),
        'chainId': chainId,
        'auth_key': _authToken,
      },
    );
  }

  /// Get transaction history for a specific token contract
  Future<Response> getTransactionHistoryForToken({
    /// A token contract [address]
    required String address,

    /// The name of the chain
    ///
    /// Options: 'ethereum', 'bsc', 'matic', 'celo', 'kadena', 'klaytn',
    /// 'cronos', 'velas', 'arbitrum', 'avalanche', 'xinfin', 'zilliqa',
    /// 'solana', 'fantom', 'fuse', 'aurora', 'bsc-testnet',
    /// 'matic-testnet', 'rinkeby-testnet'
    required String chain,

    /// The page to query
    required int page,

    /// The number of results per page
    required int pageSize,

    /// Starting block from which the transactions should be considered
    int? fromBlock,

    /// End block till which the transactions should be considered
    int? toBlock,

    /// Equates to search until the following transaction ID
    ///
    /// Note: only for solana
    String? before,

    /// Search from before this transaction ID
    ///
    /// Note: only for solana
    String? until,
  }) async {
    return await _connection.get(
      endpoint: '/v2/$chain/token/$address/transactions',
      params: {
        'page': page.toString(),
        'pageSize': pageSize.toString(),
        'fromBlock': fromBlock?.toString(),
        'toBlock': toBlock?.toString(),
        'before': before,
        'until': until,
        'auth_key': _authToken,
      },
    );
  }

  /// Get details of a specific transaction on a particular chain
  Future<Response> getTransactionDetails({
    /// A transaction hash
    required String transactionHash,

    /// The name of the chain
    ///
    /// Options: 'ethereum', 'bsc', 'matic', 'celo', 'kadena', 'klaytn',
    /// 'cronos', 'velas', 'arbitrum', 'avalanche', 'xinfin', 'zilliqa',
    /// 'solana', 'fantom', 'fuse', 'aurora', 'bsc-testnet',
    /// 'matic-testnet', 'rinkeby-testnet'
    required String chain,

    /// Return details for requested chain id (For Kadena chain)
    int? chainId,
  }) async {
    return await _connection.get(
      endpoint: '/v1/$chain/transactions/$transactionHash',
      params: {
        'chainId': chainId?.toString(),
        'auth_key': _authToken,
      },
    );
  }

  /// Get total transaction count and transactions with a token
  Future<Response> getTransactionHistoryForTokenWithCount({
    /// A token contract [address]
    required String address,

    /// The name of the chain
    ///
    /// Options: 'ethereum', 'bsc', 'matic', 'celo', 'kadena', 'klaytn',
    /// 'cronos', 'velas', 'arbitrum', 'avalanche', 'xinfin', 'zilliqa',
    /// 'solana', 'fantom', 'fuse', 'aurora', 'bsc-testnet',
    /// 'matic-testnet', 'rinkeby-testnet'
    required String chain,

    /// The page to query
    required int page,

    /// The number of results per page
    required int pageSize,

    /// Return details for requested chain id (For Kadena chain)
    int? chainId,
  }) async {
    return await _connection.get(
      endpoint: '/v1/$chain/token/$address/transactions',
      params: {
        'page': page.toString(),
        'pageSize': pageSize.toString(),
        'chainId': chainId?.toString(),
        'auth_key': _authToken,
      },
    );
  }

  /// Get transaction count for a wallet address
  Future<Response> getTransactionCount({
    /// A wallet address or ENS
    required String address,

    /// The name of the chain
    ///
    /// Options: 'ethereum', 'bsc', 'matic', 'celo', 'kadena', 'klaytn',
    /// 'cronos', 'velas', 'arbitrum', 'avalanche', 'xinfin', 'zilliqa',
    /// 'solana', 'fantom', 'fuse', 'aurora', 'bsc-testnet',
    /// 'matic-testnet', 'rinkeby-testnet'
    required String chain,
  }) async {
    return await _connection.get(
      endpoint: '/v1/$chain/address/$address/transactions/count',
      params: {
        'auth_key': _authToken,
      },
    );
  }
}
