import 'package:http/http.dart' as http;
import 'response.dart';
import '../constants/constants.dart';

/// Handles low-level calls to the api
class Connection {
  late http.Client client;

  Connection() {
    client = http.Client();
  }

  /// Get with optional params
  Future<Response> get({
    required String endpoint,
    Map<String, dynamic>? params,
  }) async {
    try {
      final response = await client.get(
        Uri.https(Constants.authority, endpoint, params),
      );
      return Response(response.statusCode, response.body);
    } catch (e) {
      rethrow;
    }
  }

  /// Close the client
  void close() {
    client.close();
  }
}
