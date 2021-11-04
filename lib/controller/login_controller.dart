part of controller;

class LoginController {
  Router get router {
    final router = Router();

    router.post('/', (Request r) {
      print(r.readAsString());
      return Response.ok('Login post reponse');
    });

    router.get('/', (Request r) {
      return Response.ok("Login response");
    });

    router.all('/<ignored|.*>', (Request request) => Response.notFound('null'));

    return router;
  }
}
