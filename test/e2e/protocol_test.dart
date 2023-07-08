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

  test('should get lp pairs', () async {
    await api.protocol
        .getLpPairs(
          protocols: 'uniswap_v2',
          page: 1,
          pageSize: 20,
        )
        .then((response) => expect(
              response.statusCode,
              200,
            ));
  });

  test('should get lp positions', () async {
    await api.protocol
        .getLpPositions(
          address: '0xfC43f5F9dd45258b3AFf31Bdbe6561D97e8B71de',
          protocols: 'pancakeswap_v2',
        )
        .then((response) => expect(
              response.statusCode,
              200,
            ));
  });

  test('should get lp transactions', () async {
    await api.protocol
        .getLpTransactions(
          protocols: 'pancakeswap_v2',
          address: 'demo.eth',
          page: 1,
          pageSize: 20,
        )
        .then((response) => expect(
              response.statusCode,
              200,
            ));
  });
}
