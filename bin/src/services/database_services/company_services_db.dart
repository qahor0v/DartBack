import '../../models/company_models/company_service_model.dart';
import 'database_functions.dart';

class CompanyServicesDatabase implements DatabaseFunctions {
  @override
  String tableName = 'services';

  @override
  String init() => '''
    CREATE TABLE IF NOT EXISTS $tableName (
      id TEXT,
      title TEXT,
      image TEXT,
      description TEXT,
      companyID TEXT,
      companyName TEXT,
      companyImage TEXT,
      url TEXT
      urlTitle TEXT
      price TEXT
    )
  ''';

  @override
  String add() => '''
    INSERT INTO $tableName (
      id, title, image, description, companyID, companyName, 
      companyImage, url, urlTitle, price
    )
    VALUES (?, ?, ?, ?, ?, ?, ?, ?)
    ''';

  @override
  String update() => '''
    UPDATE $tableName
    SET title = ?, image = ?, description = ?, companyID = ?, 
        companyName = ?, companyImage = ?, url = ?, urlTitle = ?, 
        price = ?
    WHERE id = ?
  ''';

  @override
  List<Object> params(dynamic object) {
    CompanyService service = object as CompanyService;
    return [
      service.id,
      service.title,
      service.image,
      service.description,
      service.companyID,
      service.companyName,
      service.companyImage,
      service.url,
      service.urlTitle,
      service.price,
    ];
  }

  @override
  List<Object> paramsForUpdate(object) {
    CompanyService service = object as CompanyService;
    return [
      service.title,
      service.image,
      service.description,
      service.companyID,
      service.companyName,
      service.companyImage,
      service.url,
      service.urlTitle,
      service.price,
      service.id,
    ];
  }
}
