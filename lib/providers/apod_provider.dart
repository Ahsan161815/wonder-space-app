import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wonderspace/repository/apod_repository.dart';

final apodProvider = Provider<ApodRepository>(
  (ref) => ApodRepository(),
);
