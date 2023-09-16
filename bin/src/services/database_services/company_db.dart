import '../../models/company_models/company_model.dart';
import 'database_functions.dart';

class CompanyDatabase implements DatabaseFunctions {
  @override
  String tableName = 'companies';

  @override
  String add() => '''
    INSERT INTO $tableName (
      id, username, email, password, phoneNumber, 
      title, slogan, registeredTime, description, 
      image, rating, subscribes
    )
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    ''';

  @override
  String init() => '''
    CREATE TABLE IF NOT EXISTS $tableName (
      id TEXT,
      username TEXT,
      email TEXT,
      phoneNumber TEXT,
      password TEXT,
      title TEXT,
      slogan TEXT,
      registeredTime TEXT,
      description TEXT,
      image TEXT,
      rating TEXT,
      subscribes INTEGER
    )
  ''';

  @override
  String update() => '''
    UPDATE $tableName
    SET username = ?, email = ?, password = ?, phoneNumber = ?, 
      title = ?, slogan = ?, registeredTime = ?, description = ?, 
      image = ?, rating = ?, subscribes = ?
    WHERE id = ?
  ''';

  @override
  List<Object> params(dynamic object) {
    Company company = object as Company;
    return [
      company.id,
      company.username,
      company.email,
      company.password,
      company.phoneNumber,
      company.title,
      company.slogan,
      company.registeredTime,
      company.description,
      company.image,
      company.rating.toString(),
      company.subscribes,
    ];
  }
}
