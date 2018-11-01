import 'dart:async';

import 'package:angular/core.dart';

/// Mock service emulating access to a to-do list stored on a server.
@Injectable()
class RandomService {
  List<String> mockRandom = <String>[];

  Future<List<String>> getRandom() async => mockRandom;
}