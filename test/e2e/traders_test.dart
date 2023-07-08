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

  test('should get top traders', () async {
    await api.traders
        .getTopTraders(
          pair: 'marsh-bnb',
          token: '0x2fa5daf6fe0708fbd63b1a7d1592577284f52256',
        )
        .then((response) => expect(
              response.statusCode,
              200,
            ));
  });
}
