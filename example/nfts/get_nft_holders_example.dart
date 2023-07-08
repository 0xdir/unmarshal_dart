import 'dart:convert';
import 'package:unmarshal/unmarshal.dart';

void main() async {
  /// Load API keys using your preferred method
  String authToken = 'YOUR_API_KEY';

  /// Initialize the main object
  Unmarshal api = Unmarshal(authToken: authToken);

  try {
    /// Call the API
    Response response = await api.nfts.getHolders(
      address: '0xd4416b13d2b3a9abae7acd5d6c2bbdbe25686401',
      chain: 'ethereum',
      tokenId:
          '94445226343659119820522348305773897616734343877551199514834207551554750107650',
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
