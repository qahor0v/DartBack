import 'package:sqlite3/sqlite3.dart';

import '../../constants/db_paths.dart';
import '../../models/user_models/user_model.dart';

abstract class UserDatabaseServicesBase {
  final String tableName = 'users';
  final database = sqlite3.open(DatabasePaths.usersDbMain);

  void initDatabase();

  void disposeDatabase();

  void addUser(User user);

  void updateUser(User user);

  void deleteUser(String id);

  User? getUserByPhoneNumber(String phoneNumber);

  User? getUserByEmail(String email);

  User? getUserById(String id);
}
