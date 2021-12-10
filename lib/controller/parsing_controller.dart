part of controller;

class Parsing {
  Handler get handler {
    final router = Router();

    router.post('/', (Request request) {
      return Response.ok('Hello World');
    });

    return router;
  }
}