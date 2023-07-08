@Timeout(Duration(seconds: 120))

import 'package:unmarshal/unmarshal.dart';
import 'package:test/test.dart';

void main() {
  late Unmarshal api;
  String authToken = 'YOUR_API_KEY';

  setUp(() {
    api = Unmarshal(authToken: authToken);
  });

  tearDown(() {
    api.close();
  });

  test('should get holders', () async {
    await api.nfts
        .getHolders(
          address: '0xd4416b13d2b3a9abae7acd5d6c2bbdbe25686401',
          chain: 'ethereum',
          tokenId:
              '94445226343659119820522348305773897616734343877551199514834207551554750107650',
        )
        .then((response) => expect(
              response.statusCode,
              200,
            ));
  });

  test('should get metadata', () async {
    await api.nfts
        .getMetadata(
          address: '0xd4416b13d2b3a9abae7acd5d6c2bbdbe25686401',
          chain: 'ethereum',
          page: 1,
          pageSize: 25,
          tokenId:
              '94445226343659119820522348305773897616734343877551199514834207551554750107650',
        )
        .then((response) => expect(
              response.statusCode,
              200,
            ));
  });

  test('should get summary', () async {
    await api.nfts
        .getNftSummary(
          address: 'vitalik.eth',
        )
        .then((response) => expect(
              response.statusCode,
              200,
            ));
  });

  test('should get tokens by contract', () async {
    await api.nfts
        .getTokensByContract(
          address: '0xd4416b13d2b3a9abae7acd5d6c2bbdbe25686401',
          chain: 'ethereum',
        )
        .then((response) => expect(
              response.statusCode,
              200,
            ));
  });

  test('should get txs by wallet', () async {
    await api.nfts
        .getTransactionsByWallet(
          address: 'vitalik.eth',
          chain: 'ethereum',
          page: 1,
          pageSize: 25,
        )
        .then((response) => expect(
              response.statusCode,
              200,
            ));
  });

  test('should get tx history', () async {
    await api.nfts
        .getTransactionHistory(
          address: '0x57f1887a8bf19b14fc0df6fd9b2acc9af147ea85',
          chain: 'ethereum',
          page: 1,
          pageSize: 25,
          tokenId:
              '62844450405653725797990302330218122450963383189106548214400876952557827767477',
        )
        .then((response) => expect(
              response.statusCode,
              200,
            ));
  });

  test('should get nfts by wallet address', () async {
    await api.nfts
        .getNftsByAddress(
          address: 'vitalik.eth',
          chain: 'ethereum',
          offset: 0,
          pageSize: 25,
        )
        .then((response) => expect(
              response.statusCode,
              200,
            ));
  });
}
