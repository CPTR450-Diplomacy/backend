part of controller;

class GamesEndpoint {
  Router get router {
    final router = Router();

    router.post('/', (Request r) {
      print(r.readAsString());
      return Response.ok('Games Endpoint post response');
    });

    router.get('/', (Request r) {
      return Response.ok("Games Endpoint response");
    });

    router.all('/<ignored|.*>', (Request request) => Response.notFound('null'));

    return router;
  }
}
