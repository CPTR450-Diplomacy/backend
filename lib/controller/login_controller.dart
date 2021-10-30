part of controller;

class LoginController {
  Router get router {
    final router = Router();

    router.post('/', (Request r) async {
      var request = jsonDecode(await r.readAsString());
      var token = request['sesionToken'];
      var tokenIssuer = "https://securetoken.google.com/cptr450-diplomacy";
      var env = Platform.environment;
      // Map<String, String> credentials = jsonDecode(env['credentials']!);
      String privateKey = env['private_key']!;
      // final jwt = JWT.verify(token, SecretKey(privateKey));
      // print(jwt.header);
      return Response.ok('Login post reponse');
    });

    router.get('/', (Request r) {
      return Response.ok("Login response");
    });

    router.all('/<ignored|.*>', (Request request) => Response.notFound('null'));

    return router;
  }
}
