import '../../models/global_models/saved_services.dart';
import 'database_functions.dart';

class SavedServicesDatabase implements DatabaseFunctions {
  @override
  String tableName = 'saved_services';

  @override
  String add() => '''
    INSERT INTO $tableName (
      id, userID, companyID, companyTitle, serviceID, serviceTitle, serviceImage
    )
    VALUES (?, ?, ?, ?, ?, ?, ?)
  ''';

  @override
  String init() => '''
    CREATE TABLE IF NOT EXISTS $tableName (
      id TEXT,
      userID TEXT,
      companyID TEXT,
      companyTitle TEXT,
      serviceID TEXT,
      serviceTitle TEXT,
      serviceImage TEXT
    )
  ''';

  @override
  String update() => '''
    UPDATE $tableName
    SET userID = ?, companyID = ?, companyTitle = ?,
        serviceID = ?, serviceTitle = ?, serviceImage = ?
    WHERE id = ?
  ''';

  @override
  List<Object> params(dynamic object) {
    SavedServices savedServices = object as SavedServices;
    return [
      savedServices.id,
      savedServices.userID,
      savedServices.companyID,
      savedServices.companyTitle,
      savedServices.serviceID,
      savedServices.serviceTitle,
      savedServices.serviceImage,
    ];
  }

  @override
  List<Object> paramsForUpdate(object) {
    SavedServices savedServices = object as SavedServices;
    return [
      savedServices.userID,
      savedServices.companyID,
      savedServices.companyTitle,
      savedServices.serviceID,
      savedServices.serviceTitle,
      savedServices.serviceImage,
      savedServices.id,
    ];
  }
}
