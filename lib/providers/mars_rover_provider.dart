import 'package:wonderspace/repository/mars_rover_repository.dart';
import 'package:riverpod/riverpod.dart';

final marsRoverProvider = Provider<MarsRoverRepository>((ref) {
  return MarsRoverRepository();
});
