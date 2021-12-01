import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:diplomacy/controller/controller.dart';
import 'package:googleapis_auth/googleapis_auth.dart' as auth;
import 'package:http/http.dart' as http;

void main(List<String> arguments) async {
  final api = Api();
  await api.initialize();
}
