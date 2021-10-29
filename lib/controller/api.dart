part of controller;

class Api {
  Map<String, String> envVars = Platform.environment;
  final homeController = HomeController();

  late final HttpServer server;

  late final port;

  Future<void> initialize() async {
    var portEnv = envVars['PORT'];
    port = portEnv == null ? 7777 : int.parse(portEnv);
    server = await shelf_io.serve(homeController.handler, '0.0.0.0', port);
  }
}
