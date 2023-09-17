import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf_io.dart' as io;

class RouterServices {
  Future<void> testServer(String message) async {
    final router = Router();
    router.get('/api/test/', (Request request) {
      return Response.ok(jsonEncode({"message": message}),
          headers: {"Content-Type": "application/json"});
    });
    var server = await io.serve(router, 'localhost', 8080);
    print(server.serverHeader);
  }
}
