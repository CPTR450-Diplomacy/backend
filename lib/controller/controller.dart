library controller;

import 'dart:io' show HttpServer, Platform;
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart';

part 'api.dart';
part 'home_controller.dart';
part 'login_controller.dart';
part 'games_endpoint.dart';
