import 'dart:developer';
import '../../models/user_models/user_model.dart';
import 'user_db_services_base.dart';

class UserDatabaseServices extends UserDatabaseServicesBase {
  @override
  void initDatabase() {
    database.execute('''
    CREATE TABLE IF NOT EXISTS users (
      id TEXT,
      lastName TEXT,
      firstName TEXT,
      email TEXT,
      password TEXT,
      phoneNumber TEXT,
      profileImage TEXT,
      profileRegisterTime TEXT
    )
  ''');
    log("Initialized to users.db");
  }

  @override
  void disposeDatabase() => database.dispose();

  @override
  void addUser(User user) {
    final statement = database.prepare('''
    INSERT INTO users (
      id, lastName, firstName, email, password, phoneNumber, 
      profileImage, profileRegisterTime
    )
    VALUES (?, ?, ?, ?, ?, ?, ?, ?)
    ''');
    statement.execute([
      user.id,
      user.lastName,
      user.firstName,
      user.email,
      user.password,
      user.phoneNumber,
      user.profileImage,
      user.profileRegisterTime,
    ]);
    log("Added to users.db");
    statement.dispose();
  }

  @override
  void updateUser(User user) {
    final statement = database.prepare('''
    UPDATE users
    SET lastName = ?, firstName = ?, email = ?, password = ?, 
        phoneNumber = ?, profileImage = ?, profileRegisterTime = ?
    WHERE id = ?
  ''');

    statement.execute([
      user.lastName,
      user.firstName,
      user.email,
      user.password,
      user.phoneNumber,
      user.profileImage,
      user.profileRegisterTime,
    ]);
    log("Updated to users.db");
    statement.dispose();
  }

  @override
  void deleteUser(String id) {
    final statement = database.prepare('DELETE FROM users WHERE id = ?');
    statement.execute([id]);
    log("user deleted from users.db");
    statement.dispose();
  }

  @override
  User? getUserByPhoneNumber(String phoneNumber) {
    final statement =
        database.prepare('SELECT * FROM users WHERE phoneNumber = ?');
    final results = statement.select([phoneNumber]);
    statement.dispose();
    if (results.isNotEmpty) {
      return User.fromJson(results.first);
    }
    return null;
  }

  @override
  User? getUserByEmail(String email) {
    final statement = database.prepare('SELECT * FROM users WHERE email = ?');
    final results = statement.select([email]);
    statement.dispose();
    if (results.isNotEmpty) {
      return User.fromJson(results.first);
    }
    return null;
  }

  @override
  User? getUserById(String id) {
    final statement = database.prepare('SELECT * FROM users WHERE id = ?');
    final results = statement.select([id]);
    statement.dispose();
    if (results.isNotEmpty) {
      return User.fromJson(results.first);
    }
    return null;
  }
}
