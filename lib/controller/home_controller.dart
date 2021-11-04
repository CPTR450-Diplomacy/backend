part of controller;

class HomeController {
  Handler get handler {
    final router = Router();

    router.get('/', (Request request) {
      return Response.ok('Hello World');
    });

    router.mount('/login/', LoginController().router);
    router.mount('/games_endpoint/', GamesEndpoint().router);

    router.all('/<ignored|.*>', (Request request) {
      return Response.notFound('Page not found');
    });

    return router;
  }
}
