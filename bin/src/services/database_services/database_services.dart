import 'package:sqlite3/sqlite3.dart';
import 'database_services_base.dart';

class DatabaseServices implements DatabaseServicesBase {
  @override
  void add({
    required Database database,
    required String functionText,
    required List<Object> params,
  }) {
    final statement = database.prepare(functionText);
    statement.execute(params);
    print("Added!");
    statement.dispose();
  }

  @override
  void delete({
    required Database database,
    required String tableName,
    required String id,
  }) {
    final statement = database.prepare(
      'DELETE FROM $tableName WHERE id = ?',
    );
    statement.execute([id]);
    print("Deleted!");
    statement.dispose();
  }

  @override
  void disposeDatabase({required Database database}) {
    print("Database is disposed!");
    database.dispose();
  }

  @override
  Row? get({
    required Database database,
    required String tableName,
    required String parameterString,
    required parameter,
    dynamic object,
  }) {
    final statement = database.prepare(
      'SELECT * FROM $tableName WHERE $parameterString = ?',
    );
    final results = statement.select([parameter]);
    statement.dispose();
    if (results.isNotEmpty) {
      return results.first;
    }
    return null;
  }

  @override
  List<Row> getList({
    required Database database,
    required String tableName,
    required String parameterString,
    required parameter,
    required int length,
  }) {
    List<Row> rows = [];
    final statement = database.prepare(
      'SELECT * FROM $tableName WHERE $parameterString = ?',
    );
    final results = statement.select([parameter]);
    statement.dispose();
    for (Row row in results) {
      rows.add(row);
    }
    return rows;
  }

  @override
  void initDatabase({
    required Database database,
    required String functionText,
  }) {
    database.execute(functionText);
    print("Initialized to database!");
  }

  @override
  void update({
    required Database database,
    required String functionText,
    required List<Object> params,
  }) {
    final statement = database.prepare(functionText);
    statement.execute(params);
    print("Added!");
    statement.dispose();
  }

  Database openDatabase(String path) => sqlite3.open(path);

  void deleteByCompanyID({
    required Database database,
    required String tableName,
    required String companyID,
  }) {
    final statement = database.prepare(
      'DELETE FROM $tableName WHERE companyID = ?',
    );
    statement.execute([companyID]);
    print("Deleted!");
    statement.dispose();
  }
}
