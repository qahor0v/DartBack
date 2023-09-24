import '../../models/company_models/company_location.dart';
import 'database_functions.dart';

class CompanyLocationDatabase implements DatabaseFunctions {
  @override
  String tableName = 'location';

  @override
  String add() => '''
    INSERT INTO $tableName (
      title, description, lon, lat, orientr, companyID
    )
    VALUES (?, ?, ?, ?, ?)
  ''';

  @override
  String init() => '''
    CREATE TABLE IF NOT EXISTS $tableName (
      title TEXT,
      description TEXT,
      lon REAL,
      lat REAL,
      orientr TEXT,
      companyID TEXT
    )
  ''';

  @override
  String update() => '''
    UPDATE $tableName
    SET title = ?, description = ?, lon = ?, lat = ?, orientr = ?,
    WHERE companyID = ?
  ''';

  @override
  List<Object> params(dynamic object) {
    CompanyLocation location = object as CompanyLocation;
    return [
      location.title,
      location.description,
      location.lon,
      location.lat,
      location.orientr,
      location.companyID,
    ];
  }

  @override
  List<Object> paramsForUpdate(object) {
    CompanyLocation location = object as CompanyLocation;
    return [
      location.title,
      location.description,
      location.lon,
      location.lat,
      location.orientr,
      location.companyID,
    ];
  }
}
