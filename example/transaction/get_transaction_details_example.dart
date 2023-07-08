import 'dart:convert';
import 'package:unmarshal/unmarshal.dart';

void main() async {
  /// Load API keys using your preferred method
  String authToken = 'YOUR_API_KEY';

  /// Initialize the main object
  Unmarshal api = Unmarshal(authToken: authToken);

  try {
    /// Call the API
    Response response = await api.transaction.getTransactionDetails(
      transactionHash:
          '0x034d6120b03040e4337c3941f7d4db55173577c13b3f47c67dd0694fa1603363',
      chain: 'ethereum',
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
