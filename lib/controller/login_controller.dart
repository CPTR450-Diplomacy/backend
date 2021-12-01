part of controller;

class LoginController {
  Router get router {
    final router = Router();

    router.post('/', (Request r) async {
      var request = jsonDecode(await r.readAsString());
      var token = request['token'];
      var jwt = GoogleJwt(token);
      bool verified = await jwt.verifySignature();
      if (!verified) {
        return Response.forbidden('Not authorized');
      }
      var userInfo = jwt.decodeUserInformation();

      String sessionToken = Diplomacy().createSession(userInfo);

      return Response.ok(jsonEncode({'sessionToken': sessionToken}));
    });

    router.get('/', (Request r) {
      return Response.ok("Login response");
    });

    router.all('/<ignored|.*>', (Request request) => Response.notFound('null'));

    return router;
  }
}
