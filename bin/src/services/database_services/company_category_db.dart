import '../../models/company_models/company_category.dart';
import 'database_functions.dart';

class CompanyCategoryDatabase implements DatabaseFunctions {
  @override
  String tableName = 'company_categories';

  @override
  String add() => '''
    INSERT INTO $tableName (
      id, icon, description, title
    )
    VALUES (?, ?, ?, ?)
  ''';

  @override
  String init() => '''
    CREATE TABLE IF NOT EXISTS $tableName (
      id TEXT,
      icon TEXT,
      description TEXT,
      title TEXT
    )
  ''';

  @override
  String update() => '''
    UPDATE $tableName
    SET icon = ?, description = ?, title = ?
    WHERE id = ?
  ''';

  @override
  List<Object> params(dynamic object) {
    CompanyCategory category = object as CompanyCategory;
    return [
      category.id,
      category.icon,
      category.description,
      category.title,
    ];
  }
}
