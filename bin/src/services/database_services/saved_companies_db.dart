import '../../models/global_models/saved_companies.dart';
import 'database_functions.dart';

class SavedCompaniesDatabase implements DatabaseFunctions {
  @override
  String tableName = 'saved_companies';

  @override
  String add() => '''
    INSERT INTO $tableName (
      id, userID, companyID, companyTitle, companyImage
    )
    VALUES (?, ?, ?, ?, ?)
  ''';

  @override
  String init() => '''
    CREATE TABLE IF NOT EXISTS $tableName (
      id TEXT,
      userID TEXT,
      companyID TEXT,
      companyTitle TEXT,
      companyImage TEXT
    )
  ''';

  @override
  String update() => '''
    UPDATE $tableName
    SET userID = ?, companyID = ?, companyTitle = ?, companyImage = ?
    WHERE id = ?
  ''';

  @override
  List<Object> params(dynamic object) {
    SavedCompanies savedCompanies = object as SavedCompanies;
    return [
      savedCompanies.id,
      savedCompanies.userID,
      savedCompanies.companyID,
      savedCompanies.companyTitle,
      savedCompanies.companyImage,
    ];
  }
}
