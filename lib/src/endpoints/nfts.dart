import '../connection/connection.dart';
import '../connection/response.dart';

/// This is a collection of related endpoints
class Nfts {
  late final Connection _connection;
  late final String _authToken;

  Nfts(config) {
    _connection = config['connection'];
    _authToken = config['authToken'];
  }

  /// Get NFTs by contract address
  ///
  /// The NFT Assets API allows retrieval of all non-fungible ERC-721
  /// and ERC-1155 NFT assets held by an address with offset-based
  /// pagination.
  ///
  /// For solana pagination and contract address filtering is not
  /// supported at the moment.
  Future<Response> getNftsByAddress({
    /// The wallet address or ENS
    required String address,

    /// The name of the chain
    ///
    /// Options: 'ethereum', 'bsc', 'matic', 'avalanche', 'cronos', 'velas'
    /// 'klaytn', 'solana', 'fuse', 'bsc-testnet'. 'matic-testnet'
    required String chain,

    /// The offset to start with, this is returned in the
    /// previous response
    required int offset,

    /// The number of results per page
    required int pageSize,

    /// The contract address of the ERC-721 or ERC-1155 NFT
    String? contract,
  }) async {
    return await _connection.get(
      endpoint: '/v3/$chain/address/$address/nft-assets',
      params: {
        'offset': offset.toString(),
        'pageSize': pageSize.toString(),
        'contract': contract,
        'auth_key': _authToken,
      },
    );
  }

  /// Get NFT transactions for a wallet
  ///
  /// Returns a list of recent non-fungible token (NFT) transactions
  /// associated with a specific wallet address. The response is paginated
  /// to ensure efficient handling of large amounts of data, and the
  /// transactions are listed in a recent-first order to provide up-to-date
  /// information.
  Future<Response> getTransactionsByWallet({
    /// The wallet address or ENS
    required String address,

    /// The name of the chain
    ///
    /// Options: 'ethereum', 'bsc', 'matic', 'avalanche', 'cronos', 'velas'
    /// 'klaytn', 'solana', 'fuse', 'bsc-testnet'. 'matic-testnet'
    required String chain,

    /// The [page] to query
    required int page,

    /// The number of results per [page]
    required int pageSize,
  }) async {
    return await _connection.get(
      endpoint: '/v2/$chain/address/$address/nft-transactions',
      params: {
        'offset': page.toString(),
        'pageSize': pageSize.toString(),
        'auth_key': _authToken,
      },
    );
  }

  /// Get metadata of an NFT by contract or specific token
  Future<Response> getMetadata({
    /// The ERC-721 or ERC-1155 contract address
    required String address,

    /// The name of the chain
    ///
    /// Options: 'ethereum', 'bsc', 'matic', 'avalanche', 'cronos'
    /// 'velas', 'klaytn', 'fuse', 'bsc-testnet', 'matic-testnet'
    required String chain,

    /// The [page] to query
    required int page,

    /// The number of results per [page]
    required int pageSize,

    /// Provide the specific [tokenID] to retrieve metadata for a
    /// particular NFT
    String? tokenId,
  }) async {
    return await _connection.get(
      endpoint: '/v2/$chain/address/$address/details',
      params: {
        'offset': page.toString(),
        'pageSize': pageSize.toString(),
        'tokenId': tokenId,
        'auth_key': _authToken,
      },
    );
  }

  /// Get transaction history of an NFT by contract or specific token
  Future<Response> getTransactionHistory({
    /// The ERC-721 or ERC-1155 contract address
    required String address,

    /// The name of the chain
    ///
    /// Options: 'ethereum', 'bsc', 'matic', 'avalanche', 'cronos'
    /// 'velas', 'klaytn', 'fuse', 'bsc-testnet', 'matic-testnet'
    required String chain,

    /// The page to query
    required int page,

    /// The number of results per page
    required int pageSize,

    /// Provide the specific tokenID to retrieve metadata for a
    /// particular NFT
    String? tokenId,
  }) async {
    return await _connection.get(
      endpoint: '/v1/$chain/contract/$address/nft-transactions',
      params: {
        'page': page.toString(),
        'pageSize': pageSize.toString(),
        'tokenId': tokenId,
        'auth_key': _authToken,
      },
    );
  }

  /// Get all NFTs a specified ERC-721 or ERC-1155
  Future<Response> getTokensByContract({
    /// The ERC-721 or ERC-1155 contract address
    required String address,

    /// The name of the chain
    ///
    /// Options: 'ethereum', 'bsc', 'matic', 'avalanche', 'cronos'
    /// 'velas', 'klaytn', 'fuse', 'bsc-testnet', 'matic-testnet'
    ///
    /// Note: This query could take up to 30 seconds.
    required String chain,
  }) async {
    return await _connection.get(
      endpoint: '/v1/$chain/contract/$address/tokenIds',
      params: {
        'auth_key': _authToken,
      },
    );
  }

  /// Get historical holders of an NFT by tokenId
  Future<Response> getHolders({
    /// The ERC-721 or ERC-1155 contract address
    required String address,

    /// The name of the chain
    ///
    /// Options: 'ethereum', 'bsc', 'matic', 'avalanche', 'cronos'
    /// 'velas', 'klaytn', 'fuse', 'bsc-testnet', 'matic-testnet'
    ///
    /// Note: This query could take up to 30 seconds.
    required String chain,

    /// Provide the specific tokenID to retrieve holders for a
    /// particular NFT
    required String tokenId,
  }) async {
    return await _connection.get(
      endpoint: '/v1/$chain/address/$address/nftholders',
      params: {
        'tokenId': tokenId,
        'auth_key': _authToken,
      },
    );
  }

  /// Get the total NFT count for a given wallet address across
  /// multiple chains
  Future<Response> getNftSummary({
    /// The wallet address or ENS
    required String address,

    /// The name of the chains to query for NFTs
    ///
    /// Options: 'ethereum', 'bsc', 'matic', 'avalanche', 'cronos'
    /// 'velas', 'klaytn', 'fuse', 'bsc-testnet', 'matic-testnet'
    String? chain,
  }) async {
    return await _connection.get(
      endpoint: '/v1/address/$address/nft-summary',
      params: {
        'chain': chain,
        'auth_key': _authToken,
      },
    );
  }
}
