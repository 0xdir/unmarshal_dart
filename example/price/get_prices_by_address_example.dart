import 'dart:convert';
import 'package:unmarshal/unmarshal.dart';

void main() async {
  /// Load API keys using your preferred method
  String authToken = 'YOUR_API_KEY';

  /// Initialize the main object
  Unmarshal api = Unmarshal(authToken: authToken);

  try {
    /// Call the api
    Response response = await api.price.getMultipleTokenPrice(
      priceStoreChains: 'ethereum',
      tokens: '0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2,'
          '0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48',
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
