import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf_io.dart' as io;
import '../../constants/db_paths.dart';
import '../../models/exception_models/exception_model.dart';
import '../../models/user_models/user_model.dart';
import '../../utils/custom_try_catch.dart';
import '../database_services/database_services.dart';
import '../database_services/users_db.dart';

class RouterServices {
  Map<String, String> jsonHeaders = {"Content-Type": "application/json"};

  Future<void> runServer() async {
    toTry(() async {
      final router = Router();
      await testServer(router);
      await signIn(router);
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

  Future<void> signIn(Router router) async {
    toTry(() async {
      router.post('/api/sign_in/', (Request request) async {
        final requestBody = await request.readAsString();
        print(requestBody);
        final formData = jsonDecode(requestBody);

        final login = formData['login'];
        final password = formData['password'];

        DatabaseServices databaseServices = DatabaseServices();
        UsersDatabase usersDatabase = UsersDatabase();
        final checkUserEmail = databaseServices.get(
          database: databaseServices.openDatabase(DatabasePaths.usersDbMain),
          tableName: usersDatabase.tableName,
          parameterString: "email",
          parameter: login,
        );

        final checkUserPhone = databaseServices.get(
          database: databaseServices.openDatabase(DatabasePaths.usersDbMain),
          tableName: usersDatabase.tableName,
          parameterString: "phoneNumber",
          parameter: login,
        );

        if (checkUserEmail != null) {
          final user = User.fromJson(checkUserEmail);
          if (user.password == password) {
            final response = jsonEncode(CustomException.signedIn(user.id));
            return Response.ok(
              response, /*headers: jsonHeaders*/
            );
          }
        }

        if (checkUserPhone != null) {
          final user = User.fromJson(checkUserPhone);
          if (user.password == password) {
            final response = jsonEncode(CustomException.signedIn(user.id));
            return Response.ok(response, headers: jsonHeaders);
          }
        }

        final response = jsonEncode(CustomException.notFound);
        return Response.ok(response, headers: jsonHeaders);
      });
    });
  }
}
