import '../../models/user_models/user_model.dart';
import 'database_functions.dart';

class UsersDatabase implements DatabaseFunctions {
  @override
  String tableName = 'users';

  @override
  String init() => '''
    CREATE TABLE IF NOT EXISTS $tableName (
      id TEXT,
      lastName TEXT,
      firstName TEXT,
      email TEXT,
      password TEXT,
      phoneNumber TEXT,
      profileImage TEXT,
      profileRegisterTime TEXT
    )
  ''';

  @override
  String add() => '''
    INSERT INTO $tableName (
      id, lastName, firstName, email, password, phoneNumber, 
      profileImage, profileRegisterTime
    )
    VALUES (?, ?, ?, ?, ?, ?, ?, ?)
    ''';

  @override
  String update() => '''
    UPDATE $tableName
    SET lastName = ?, firstName = ?, email = ?, password = ?, 
        phoneNumber = ?, profileImage = ?, profileRegisterTime = ?
    WHERE id = ?
  ''';

  @override
  List<Object> params(dynamic object) {
    User user = object as User;
    return [
      user.id,
      user.lastName,
      user.firstName,
      user.email,
      user.password,
      user.phoneNumber,
      user.profileImage,
      user.profileRegisterTime,
    ];
  }
}
