import '../../models/company_models/company_image.dart';
import 'database_functions.dart';

class CompanyImageDatabase implements DatabaseFunctions {
  @override
  String tableName = 'images';

  @override
  String add() => '''
    INSERT INTO $tableName (
      id, title, description, url, createdTime, likes
    )
    VALUES (?, ?, ?, ?, ?, ?)
  ''';

  @override
  String init() => '''
    CREATE TABLE IF NOT EXISTS $tableName (
      id TEXT,
      title TEXT,
      description TEXT,
      url TEXT,
      createdTime TEXT,
      likes INTEGER
    )
  ''';

  @override
  String update() => '''
    UPDATE $tableName
    SET title = ?, description = ?, url = ?, createdTime = ?, likes = ?
    WHERE id = ?
  ''';

  @override
  List<Object> params(dynamic object) {
    CompanyImage image = object as CompanyImage;
    return [
      image.id,
      image.title,
      image.description,
      image.url,
      image.createdTime,
      image.likes,
    ];
  }
}
