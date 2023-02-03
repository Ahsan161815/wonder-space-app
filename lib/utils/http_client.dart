import 'package:http/http.dart' as http;

class MyHttpClient {
  static const String baseUrl = 'api.nasa.gov';
  static const String apiKey = '8ft243OtoNBHsR2QwzYQw4BjxurNrML3QBGaOHtB';

  static Future<String> get(
      {required String endPoint, Map<String, String>? params}) async {
    params!['api_key'] = apiKey;
    try {
      http.Response response =
          await http.get(Uri.https(baseUrl, endPoint, params));
      if (response.statusCode != 200) {
        throw http.ClientException(response.statusCode.toString());
      }
      return response.body;
      print(response.body);
    } catch (error) {
      rethrow;
    }
  }
}
