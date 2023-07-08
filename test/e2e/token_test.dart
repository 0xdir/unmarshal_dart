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

  test('should get all tokens', () async {
    await api.token
        .getAllTokens(
          page: 1,
          pageSize: 20,
        )
        .then((response) => expect(
              response.statusCode,
              200,
            ));
  });

  test('should get details by contract', () async {
    await api.token
        .getDetailsByContract(
          address: '0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2',
        )
        .then((response) => expect(
              response.statusCode,
              200,
            ));
  });

  test('should details by symbol', () async {
    await api.token
        .getDetailsBySymbol(
          symbol: 'weth',
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
