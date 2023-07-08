import 'dart:convert';
import 'package:unmarshal/unmarshal.dart';

void main() async {
  /// Load API keys using your preferred method
  String authToken = 'YOUR_API_KEY';

  /// Initialize the main object
  Unmarshal api = Unmarshal(authToken: authToken);

  try {
    /// Call the API
    Response response =
        await api.transaction.getTransactionHistoryForTokenWithCount(
      address: '0x39b2a4ad86b75cd25ec582f11feafdf0612a081c',
      chain: 'ethereum',
      page: 1,
      pageSize: 25,
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
