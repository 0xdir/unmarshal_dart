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

  test('should get balance', () async {
    await api.wallet
        .getBalanceMultichain(
          wallets: 'vitalik.eth,demo.eth',
          chains: 'ethereum,matic',
        )
        .then((response) => expect(
              response.statusCode,
              200,
            ));
  });

  test('should get PnL', () async {
    await api.wallet
        .getProfitAndLoss(
          address: 'vitalik.eth',
          chain: 'ethereum',

          /// WETH contract address on ethereum
          contract: '0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2',
        )
        .then((response) => expect(
              response.statusCode,
              200,
            ));
  });

  test('should get token balance', () async {
    await api.wallet
        .getTokenBalance(
          chain: 'ethereum',
          address: 'vitalik.eth',
          offset: 8,
        )
        .then((response) => expect(
              response.statusCode,
              200,
            ));
  });

  test('should get holders count', () async {
    await api.wallet
        .getTokenHoldersCount(
          /// WETH contract address on ethereum
          address: '0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2',
          chain: 'ethereum',
        )
        .then((response) => expect(
              response.statusCode,
              200,
            ));
  });

  test('should get top token holders', () async {
    await api.wallet
        .getTopTokenHolders(
          /// WETH contract address on ethereum
          contract: '0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2',
          chain: 'ethereum',
        )
        .then((response) => expect(
              response.statusCode,
              200,
            ));
  });
}
