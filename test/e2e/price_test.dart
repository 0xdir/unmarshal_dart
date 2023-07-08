@Timeout(Duration(seconds: 90))

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

  test('should get price by address', () async {
    await api.price
        .getPriceByAddress(
          address: '0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2',
          priceStoreChains: 'ethereum',
        )
        .then((response) => expect(
              response.statusCode,
              200,
            ));
  });

  test('should get price by symbol', () async {
    await api.price
        .getPriceBySymbol(
          symbol: 'weth',
        )
        .then((response) => expect(
              response.statusCode,
              200,
            ));
  });

  test('should get LP token price', () async {
    await api.price
        .getLPTokenPrice(
          priceStoreChains: 'ethereum',
          lptokens: '0x96ba057136FEb27a8CDBD1Aa9C8aBcFc4D084d8b',
        )
        .then((response) => expect(
              response.statusCode,
              200,
            ));
  });

  test('should get token price for multiple tokens', () async {
    await api.price
        .getMultipleTokenPrice(
          priceStoreChains: 'ethereum',
          tokens: '0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2,'
              '0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48',
        )
        .then((response) => expect(
              response.statusCode,
              200,
            ));
  });

  test('should get top gainers', () async {
    await api.price
        .getTopGainers(
          priceStoreChains: 'ethereum',
          price: 100.00,
        )
        .then((response) => expect(
              response.statusCode,
              200,
            ));
  });

  test('should get top losers', () async {
    await api.price
        .getTopLosers(
          priceStoreChains: 'ethereum',
          price: 100.00,
        )
        .then((response) => expect(
              response.statusCode,
              200,
            ));
  });
}
