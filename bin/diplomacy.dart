import 'dart:async';
import 'dart:io';

import 'package:diplomacy/diplomacy.dart' as diplomacy;
import 'package:diplomacy/controller/controller.dart';

void main(List<String> arguments) async {
  final api = Api();
  await api.initialize();

  // String? quit = stdin.readLineSync();

  // if (quit == 'q') {
  //   api.server.close();
  //   exit(0);
  // }
}
