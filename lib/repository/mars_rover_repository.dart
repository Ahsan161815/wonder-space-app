import 'dart:io';

import 'package:wonderspace/models/mars_rover_images.dart';
import 'package:wonderspace/utils/http_client.dart';

class MarsRoverRepository {
  Future<Mri> get() async {
    try {
      String _res = await MyHttpClient.get(
          endPoint: 'mars-photos/api/v1/rovers/curiosity/photos',
          params: {'sol': '1000'});
      Mri _mri = mriFromJson(_res);
      print(_mri);
      return _mri;
    } catch (e) {
      rethrow;
    }
  }
}
