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

  test('should get events', () async {
    await api.events
        .getEvents(
          chain: 'ethereum',
        )
        .then((response) => expect(
              response.statusCode,
              200,
            ));
  });
}
