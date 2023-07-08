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

  test('should get blocks by blockhash', () async {
    await api.blocks
        .getBlocksByBlockHash(
          chain: 'ethereum',
          blockHash:
              '0x6fe83f7f38e6c40de1c5c18c2e6e9c8f783d543a6d2e33f6dca4e5d8ab5856a8',
        )
        .then((response) => expect(
              response.statusCode,
              200,
            ));
  });

  test('should get blocks by block number', () async {
    await api.blocks
        .getBlocksByBlockNumber(
          chain: 'ethereum',
          blockNumber: '10000',
        )
        .then((response) => expect(
              response.statusCode,
              200,
            ));
  });

  test('should get txs by block hash', () async {
    await api.blocks
        .getTransactionsByBlockHash(
          chain: 'ethereum',
          blockHash:
              '0x6fe83f7f38e6c40de1c5c18c2e6e9c8f783d543a6d2e33f6dca4e5d8ab5856a8',
        )
        .then((response) => expect(
              response.statusCode,
              200,
            ));
  });

  test('should get txs by block number', () async {
    await api.blocks
        .getTransactionByBlockNumber(
          chain: 'ethereum',
          blockNumber: '10000',
        )
        .then((response) => expect(
              response.statusCode,
              200,
            ));
  });
}
