import 'dart:async';
import 'dart:convert';
import 'dart:io';

// import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:diplomacy/diplomacy.dart' as diplomacy;
import 'package:diplomacy/controller/controller.dart';
import 'package:googleapis_auth/googleapis_auth.dart' as auth;
import 'package:http/http.dart' as http;

void main(List<String> arguments) async {
  var env = Platform.environment;
  var key = env['private_key']!;
  var token = env['jwt']!;
  // print(env);
  // final accountCredentials =
  //     auth.ServiceAccountCredentials.fromJson(credentials);
  // final scopes = [
  //   "https://www.googleapis.com/auth/userinfo.email",
  //   "https://www.googleapis.com/auth/firebase.database",
  // ];
  // print(env['credentials']);

  http.Request pubKeyRequest = http.Request(
    'GET',
    Uri.parse(
        'https://www.googleapis.com/robot/v1/metadata/x509/securetoken@system.gserviceaccount.com'),
  );
  var response = await pubKeyRequest.send();
  var body = await response.stream.bytesToString();
  var pubKeys = jsonDecode(body);

  for (var id in pubKeys.keys) {
    try {
      print('Checking public key: $id');
      print('Public key: ${pubKeys[id]}');
      final jwt = JWT.verify(token, RSAPublicKey(pubKeys[id]));
      print(jwt.payload);
    } catch (e) {
      print(e.toString());
    }
  }

  // final api = Api();
  // await api.initialize();

  // String? quit = stdin.readLineSync();

  // if (quit == 'q') {
  //   api.server.close();
  //   exit(0);
  // }
}
