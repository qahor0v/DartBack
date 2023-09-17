import 'package:sqlite3/sqlite3.dart';
import '../../constants/db_paths.dart';
import '../../models/exception_models/exception_model.dart';
import '../../models/user_models/user_model.dart';
import '../../models/user_models/user_sign_in.dart';
import '../database_services/database_services.dart';
import '../database_services/users_db.dart';
import 'user_auth_services_base.dart';

class UserAuthServices implements UserAuthServicesBase {
  @override
  bool checkUser(User user) {
    UsersDatabase usersDatabase = UsersDatabase();
    DatabaseServices services = DatabaseServices();
    Database database = services.openDatabase(DatabasePaths.usersDbMain);
    services.initDatabase(
      database: database,
      functionText: usersDatabase.init(),
    );
    final checkEmail = services.get(
      database: database,
      tableName: usersDatabase.tableName,
      parameterString: 'email',
      parameter: user.email,
    );

    final checkPhone = services.get(
      database: database,
      tableName: usersDatabase.tableName,
      parameterString: 'phoneNumber',
      parameter: user.phoneNumber,
    );

    return checkPhone == null && checkEmail == null;
  }

  @override
  CustomException deleteUser(String userID) {
    UsersDatabase usersDatabase = UsersDatabase();
    DatabaseServices services = DatabaseServices();
    Database database = services.openDatabase(DatabasePaths.usersDbMain);
    services.initDatabase(
      database: database,
      functionText: usersDatabase.init(),
    );
    services.delete(
      database: database,
      tableName: usersDatabase.tableName,
      id: userID,
    );
    return CustomException.deleted;
  }

  @override
  CustomException signIn(UserSignIn userSignIn) {
    User? signedUser;
    bool check = false;
    UsersDatabase usersDatabase = UsersDatabase();
    DatabaseServices services = DatabaseServices();
    Database database = services.openDatabase(DatabasePaths.usersDbMain);
    services.initDatabase(
      database: database,
      functionText: usersDatabase.init(),
    );
    final checkEmail = services.get(
      database: database,
      tableName: usersDatabase.tableName,
      parameterString: 'email',
      parameter: userSignIn.login,
    );

    final checkPhone = services.get(
      database: database,
      tableName: usersDatabase.tableName,
      parameterString: 'phoneNumber',
      parameter: userSignIn.login,
    );

    if (checkEmail != null) {
      User user = User.fromJson(checkEmail);
      signedUser = user;
      if (user.password == userSignIn.password) {
        check = true;
      }
    }

    if (checkPhone != null) {
      User user = User.fromJson(checkPhone);
      signedUser = user;
      if (user.password == userSignIn.password) {
        check = true;
      }
    }

    if (check) {
      return CustomException.signedIn(signedUser!.id);
    } else {
      return CustomException.notFound;
    }
  }

  @override
  CustomException signUp(User user) {
    if (checkUser(user)) {
      UsersDatabase usersDatabase = UsersDatabase();
      DatabaseServices services = DatabaseServices();
      Database database = services.openDatabase(DatabasePaths.usersDbMain);
      services.initDatabase(
        database: database,
        functionText: usersDatabase.init(),
      );
      services.add(
        database: database,
        functionText: usersDatabase.add(),
        params: usersDatabase.params(user),
      );
      return CustomException.registered(user.id);
    } else {
      return CustomException.alreadyHave;
    }
  }

  @override
  CustomException updateUserData(User user) {
    UsersDatabase usersDatabase = UsersDatabase();
    DatabaseServices services = DatabaseServices();
    Database database = services.openDatabase(DatabasePaths.usersDbMain);
    services.initDatabase(
      database: database,
      functionText: usersDatabase.init(),
    );
    services.update(
      database: database,
      functionText: usersDatabase.update(),
      params: usersDatabase.paramsForUpdate(user),
    );
    return CustomException.updated(user.id);
  }
}
