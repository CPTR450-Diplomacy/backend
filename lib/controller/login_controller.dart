part of controller;

class LoginController {
  Router get router {
    final router = Router();

    router.post('/', (Request r) async {
      var request = jsonDecode(await r.readAsString());
      var token = request['sesionToken'];
      var jwt = GoogleJwt(token);
      bool verified = await jwt.verifySignature();
      print('Verified? $verified');

      return Response.ok('Login post reponse $verified');
    });

    router.get('/', (Request r) {
      return Response.ok("Login response");
    });

    router.all('/<ignored|.*>', (Request request) => Response.notFound('null'));

    return router;
  }
}
