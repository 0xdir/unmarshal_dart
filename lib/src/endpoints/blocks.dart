import '../connection/connection.dart';
import '../connection/response.dart';

/// This is a collection of related endpoints
class Blocks {
  late final Connection _connection;
  late final String _authToken;

  Blocks(config) {
    _connection = config['connection'];
    _authToken = config['authToken'];
  }

  /// Get Block by block number
  ///
  /// For a given block number, this endpoint returns block-level details
  Future<Response> getBlocksByBlockNumber({
    /// The name of the chain
    ///
    /// eg. "ethereum"
    ///
    /// Options: "ethereum" "bsc" "matic" "kadena" "celo" "klaytn"
    /// "cronos" "velas" "arbitrum" "avalanche" "xinfin" "zilliqa"
    /// "fantom" "fuse" "aurora" "bsc-testnet" "matic-testnet"
    /// "rinkeby-testnet"
    required String chain,

    /// A valid block number
    required String blockNumber,

    /// Return details for requested chain id (For Kadena chain)
    String chainId = 'false',
  }) async {
    return await _connection.get(
      endpoint: '/v1/$chain/block/$blockNumber/details',
      params: {
        'chainId': chainId,
        'auth_key': _authToken,
      },
    );
  }

  /// Get Block by block hash
  ///
  /// For a given block hash, this endpoint returns block-level details
  Future<Response> getBlocksByBlockHash({
    /// The name of the chain
    ///
    /// eg. "ethereum"
    ///
    /// Options: "ethereum" "bsc" "matic" "kadena" "celo" "klaytn"
    /// "cronos" "velas" "arbitrum" "avalanche" "xinfin" "zilliqa"
    /// "fantom" "fuse" "aurora" "bsc-testnet" "matic-testnet"
    /// "rinkeby-testnet"
    required String chain,

    /// A valid block hash
    required String blockHash,
  }) async {
    return await _connection.get(
      endpoint: '/v1/$chain/block-hash/$blockHash/details',
      params: {
        'auth_key': _authToken,
      },
    );
  }

  /// Get Transactions in Block by block Number
  ///
  /// For a given block number, this endpoint returns a list of all
  /// transactions in the block, along with their decoded
  /// log events.
  Future<Response> getTransactionByBlockNumber({
    /// The name of the chain
    ///
    /// eg. "ethereum"
    ///
    /// Options: "ethereum" "bsc" "matic" "kadena" "celo" "klaytn"
    /// "cronos" "velas" "arbitrum" "avalanche" "xinfin" "zilliqa"
    /// "fantom" "fuse" "aurora" "bsc-testnet" "matic-testnet"
    /// "rinkeby-testnet"
    required String chain,

    /// A valid block number
    required String blockNumber,
  }) async {
    return await _connection.get(
      endpoint: '/v1/$chain/block/$blockNumber/transactions',
      params: {
        'auth_key': _authToken,
      },
    );
  }

  /// Get Transactions in Block by block hash
  ///
  /// For a given block hash, this endpoint returns a list of all
  /// transactions in the block, along with their decoded
  /// log events.
  ///
  /// Note: This query takes about 15 seconds.
  Future<Response> getTransactionsByBlockHash({
    /// The name of the chain
    ///
    /// eg. "ethereum"
    ///
    /// Options: "ethereum" "bsc" "matic" "kadena" "celo" "klaytn"
    /// "cronos" "velas" "arbitrum" "avalanche" "xinfin" "zilliqa"
    /// "fantom" "fuse" "aurora" "bsc-testnet" "matic-testnet"
    /// "rinkeby-testnet"
    required String chain,

    /// A valid block hasb
    required String blockHash,
  }) async {
    return await _connection.get(
      endpoint: '/v1/$chain/block-hash/$blockHash/transactions',
      params: {
        'auth_key': _authToken,
      },
    );
  }
}
