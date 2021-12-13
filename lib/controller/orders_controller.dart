part of controller;

class Orders {
  Router get router {
    final router = Router();

    router.post('/', (Request r) async {
      var request = jsonDecode(await r.readAsString());
      var session = request['session'];
      var orders = request['orders'];
      return Response.ok(jsonEncode({'session': session, 'orders': orders}));
    });

    return router;
  }
}