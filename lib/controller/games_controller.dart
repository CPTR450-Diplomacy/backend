part of controller;

class GamesController {
  Router get router {
    final router = Router();

    router.post('/', (Request r) {
      print(r.readAsString());
      return Response.ok('Games Controller post response');
    });

    router.get('/', (Request r) {
      return Response.ok("Games Controller response");
    });

    router.all('/<ignored|.*>', (Request request) => Response.notFound('null'));

    return router;
  }
}
