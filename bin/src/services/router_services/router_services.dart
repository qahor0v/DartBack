import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf_io.dart' as io;

import '../../utils/custom_try_catch.dart';

class RouterServices {
  Map<String, String> jsonHeaders = {"Content-Type": "application/json"};

  Future<void> runServer() async {
    toTry(() async {
      final router = Router();
      await testServer(router);
      await io.serve(router, 'localhost', 8080);
    });
  }

  Future<void> testServer(Router router) async {
    toTry(() async {
       final response = jsonEncode({"message": "Server is working...!"});
      router.post('/api/auth/', (Request request) {
        return Response.ok(response, headers: jsonHeaders);
      });
    });
  }




}
