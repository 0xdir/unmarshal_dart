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

  test('should get tx count', () async {
    await api.transaction
        .getTransactionCount(
          address: 'vitalik.eth',
          chain: 'ethereum',
        )
        .then((response) => expect(
              response.statusCode,
              200,
            ));
  });

  test('should get tx details', () async {
    await api.transaction
        .getTransactionDetails(
          transactionHash:
              '0x034d6120b03040e4337c3941f7d4db55173577c13b3f47c67dd0694fa1603363',
          chain: 'ethereum',
        )
        .then((response) => expect(
              response.statusCode,
              200,
            ));
  });

  test('should get tx history with price', () async {
    await api.transaction
        .getTransactionHistoryWithPrice(
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

  test('should get tx history for token', () async {
    await api.transaction
        .getTransactionHistoryForToken(
          address: '0x39b2a4ad86b75cd25ec582f11feafdf0612a081c',
          chain: 'ethereum',
          page: 1,
          pageSize: 25,
        )
        .then((response) => expect(
              response.statusCode,
              200,
            ));
  });

  test('should get tx history for token with count', () async {
    await api.transaction
        .getTransactionHistoryForTokenWithCount(
          address: '0x39b2a4ad86b75cd25ec582f11feafdf0612a081c',
          chain: 'ethereum',
          page: 1,
          pageSize: 25,
        )
        .then((response) => expect(
              response.statusCode,
              200,
            ));
  });

  test('should get tx history with count', () async {
    await api.transaction
        .getTransactionHistoryWithCount(
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

  test('should get tx history ', () async {
    await api.transaction
        .getTransactionHistory(
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
}
