import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:diplomacy/diplomacy.dart' as diplomacy;
import 'package:diplomacy/controller/controller.dart';
import 'package:googleapis_auth/googleapis_auth.dart' as auth;
import 'package:http/http.dart' as http;

void main(List<String> arguments) async {
  var env = Platform.environment;
  var token = env['jwt']!;
  var jwt = GoogleJwt(token);
  bool verified = await jwt.verifySignature();
  print('Verified? $verified');
  // final api = Api();
  // await api.initialize();
}
