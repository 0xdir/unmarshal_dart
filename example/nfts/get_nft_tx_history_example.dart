import 'dart:convert';
import 'package:unmarshal/unmarshal.dart';

void main() async {
  /// Load API keys using your preferred method
  String authToken = 'YOUR_API_KEY';

  /// Initialize the main object
  Unmarshal api = Unmarshal(authToken: authToken);

  try {
    /// Call the API
    Response response = await api.nfts.getTransactionHistory(
      address: '0x57f1887a8bf19b14fc0df6fd9b2acc9af147ea85',
      chain: 'ethereum',
      page: 1,
      pageSize: 25,
      tokenId:
          '62844450405653725797990302330218122450963383189106548214400876952557827767477',
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
