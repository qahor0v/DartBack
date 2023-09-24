import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf_io.dart' as io;
import '../../utils/custom_try_catch.dart';
import 'user_router_services.dart';

class RouterServices {
  Map<String, String> jsonHeaders = {"Content-Type": "application/json"};

  Future<void> runServer() async {
    UserRouterServices userRouterServices = UserRouterServices();
    toTry(() async {
      final router = Router();
      await testServer(router);
      await userRouterServices.signIn(router);
      await userRouterServices.signUp(router);
      await userRouterServices.update(router);
      await userRouterServices.delete(router);
      await io.serve(router, 'localhost', 8080);
    });
  }

  Future<void> testServer(Router router) async {
    toTry(() async {
      final response = jsonEncode({"message": "Server is working...!"});
      router.get('/api/test/', (Request request) {
        return Response.ok(response, headers: jsonHeaders);
      });
    });
  }
}
