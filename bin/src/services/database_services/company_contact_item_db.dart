import '../../models/company_models/company_contact_model.dart';
import 'database_functions.dart';

class CompanyContactItemDatabase implements DatabaseFunctions {
  @override
  String tableName = 'company_contact_items';

  @override
  String add() => '''
    INSERT INTO $tableName (
      name, startWork, endWork, url, companyID, id
    )
    VALUES (?, ?, ?, ?, ?, ?)
  ''';

  @override
  String init() => '''
    CREATE TABLE IF NOT EXISTS $tableName (
      name TEXT,
      startWork TEXT,
      endWork TEXT,
      url TEXT,
      companyID TEXT,
      id TEXT
    )
  ''';

  @override
  String update() => '''
    UPDATE $tableName
    SET name = ?, startWork = ?, endWork = ?, url = ?, companyID = ?
    WHERE id = ?
  ''';

  @override
  List<Object> params(dynamic object) {
    CompanyContactItem contactItem = object as CompanyContactItem;
    return [
      contactItem.name,
      contactItem.startWork,
      contactItem.endWork,
      contactItem.url,
      contactItem.companyID,
      contactItem.id,
    ];
  }

  @override
  List<Object> paramsForUpdate(object) {
    CompanyContactItem contactItem = object as CompanyContactItem;
    return [
      contactItem.name,
      contactItem.startWork,
      contactItem.endWork,
      contactItem.url,
      contactItem.companyID,
      contactItem.id,
    ];
  }
}
