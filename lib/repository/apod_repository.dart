import 'package:wonderspace/utils/http_client.dart';

import '../models/apod.dart';

class ApodRepository {
  Future<Apod> get() async {
    try {
      String res = await MyHttpClient.get(endPoint: '/planetary/apod');
      Apod _apod = apodFromJson(res);
      return _apod;
    } catch (e) {
      rethrow;
    }
  }
}
