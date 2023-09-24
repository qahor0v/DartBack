import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../../constants/db_paths.dart';
import '../../models/exception_models/exception_model.dart';
import '../../models/user_models/user_model.dart';
import '../../utils/custom_try_catch.dart';
import '../../utils/id_generator.dart';
import '../database_services/database_services.dart';
import '../database_services/users_db.dart';

class UserRouterServices {
  Map<String, String> jsonHeaders = {"Content-Type": "application/json"};

  Future<void> signIn(Router router) async {
    toTry(() async {
      router.post('/api/user/sign_in/', (Request request) async {
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

  Future<void> signUp(Router router) async {
    toTry(() async {
      router.post('/api/user/sign_up/', (Request request) async {
        final requestBody = await request.readAsString();
        print(requestBody);
        final formData = jsonDecode(requestBody);

        final password = formData['password'];
        final login = "${formData['login']}";
        final lastname = formData['lastname'];
        final firstname = formData['firstname'];
        final image = formData['image'];

        DatabaseServices databaseServices = DatabaseServices();
        UsersDatabase usersDatabase = UsersDatabase();

        final checkUserPhone = databaseServices.get(
          database: databaseServices.openDatabase(
            DatabasePaths.usersDbMain,
          ),
          tableName: usersDatabase.tableName,
          parameterString: "phoneNumber",
          parameter: login,
        );

        if (checkUserPhone == null) {
          User user = User(
            id: IdServices.token(),
            lastName: "$lastname",
            firstName: "$firstname",
            email: "",
            password: "$password",
            phoneNumber: login,
            profileImage: "$image",
            profileRegisterTime: "${DateTime.now()}",
          );
          databaseServices.add(
            database: databaseServices.openDatabase(DatabasePaths.usersDbMain),
            functionText: usersDatabase.add(),
            params: usersDatabase.params(user),
          );
          final response = jsonEncode(CustomException.registered(user.id));
          return Response.ok(response, headers: jsonHeaders);
        }
        final response = jsonEncode(CustomException.alreadyHave);
        return Response.ok(response, headers: jsonHeaders);
      });
    });
  }


  Future<void> update(Router router) async {
    toTry(() async {
      router.post('/api/user/sign_up/', (Request request) async {
        final requestBody = await request.readAsString();
        print(requestBody);
        final formData = jsonDecode(requestBody);

        final password = formData['password'];
        final login = "${formData['login']}";
        final lastname = formData['lastname'];
        final firstname = formData['firstname'];
        final image = formData['image'];

        DatabaseServices databaseServices = DatabaseServices();
        UsersDatabase usersDatabase = UsersDatabase();

        final checkUserPhone = databaseServices.get(
          database: databaseServices.openDatabase(
            DatabasePaths.usersDbMain,
          ),
          tableName: usersDatabase.tableName,
          parameterString: "phoneNumber",
          parameter: login,
        );

        if (checkUserPhone == null) {
          User user = User(
            id: IdServices.token(),
            lastName: "$lastname",
            firstName: "$firstname",
            email: "",
            password: "$password",
            phoneNumber: login,
            profileImage: "$image",
            profileRegisterTime: "${DateTime.now()}",
          );
          databaseServices.add(
            database: databaseServices.openDatabase(DatabasePaths.usersDbMain),
            functionText: usersDatabase.add(),
            params: usersDatabase.params(user),
          );
          final response = jsonEncode(CustomException.registered(user.id));
          return Response.ok(response, headers: jsonHeaders);
        }
        final response = jsonEncode(CustomException.alreadyHave);
        return Response.ok(response, headers: jsonHeaders);
      });
    });
  }
}
