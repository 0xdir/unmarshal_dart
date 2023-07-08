[![pub package](https://img.shields.io/pub/v/unmarshal.svg)](https://pub.dev/packages/unmarshal)
[![package publisher](https://img.shields.io/pub/publisher/unmarshal.svg)](https://pub.dev/packages/unmarshal/publisher)

A Future-based library to interact with the Unmarshal API.

This package is a wrapper around the [Unmarshal API], allowing easy data retrieval from
blockchain networks with Dart. It is multi-platform, with limited dependencies
for use in mobile, desktop, or browser apps.

[Unmarshal API]: https://docs.unmarshal.io/

This community package is designed to follow the [Unmarshal API Documentation] as closely
as possible.

[Unmarshal API Documentation]: https://docs.unmarshal.io/

## Using

The easiest way to use this library is via the top-level ```Unmarshal``` class.

```dart
import 'package:unmarshal/unmarshal.dart';

void main() async {
  /// Load API keys using your preferred method
  String authToken = 'YOUR_API_KEY';

  /// Initialize the main object
  Unmarshal api = Unmarshal(authToken: authToken);

  try {
    /// Call the api
    Response response = await api.token.getAllTokens(
      page: 1,
      pageSize: 20,
    );
    if (response.statusCode == 200) {
      /// Do stuff with the response
      print(response.statusCode);
      print(json.decode(response.body));
    } else {
      /// Handle the server error
      print('Server Error: ${response.statusCode}:');
      print(response.body);
    }
  } catch (e) {
    /// Throws an exception if an error occurs
    print(e);
  }

  /// Close the connection
  api.close();
}
```

## Available endpoints

Implemented:
1. transaction
2. nft
3. protocol
4. price
5. token
6. traders
7. blocks
8. events

Not implemented:
1. notifications

If notification endpoints are needed, feel free to open a discussion on github. 

## Getting Help

Submit an issue on [github].

[github]: https://github.com/0xdir/unmarshal_dart

## How to contribute

All feedback and suggestions for improvements are welcome:

1. Open a discussion on [github]
2. Discuss proposed changes
3. Submit a PR (optional)

[github]: https://github.com/0xdir/unmarshal_dart

## Support my work

This package is possible thanks to the people and companies
who donate money, services or time to keep the project running.

If you're interested in becoming a Sponsor, Backer or Contributor
to expand the project, reach out to me on [github].

[github]: https://github.com/sponsors/0xdir

Or buy me coffee at `0xdir.near`.