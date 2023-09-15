import 'package:sqlite3/sqlite3.dart';

abstract class DatabaseServicesBase {
  void initDatabase({
    required Database database,
    required String functionText,
  });

  void disposeDatabase({
    required Database database,
  });

  void add({
    required Database database,
    required String functionText,
    required List<Object> params,
  });

  void update({
    required Database database,
    required String functionText,
    required List<Object> params,
  });

  void delete({
    required Database database,
    required String tableName,
    required String id,
  });

  Row? get({
    required Database database,
    required String tableName,
    required String parameterString,
    required dynamic parameter,
  });

  List<Row> getList({
    required Database database,
    required String tableName,
    required String parameterString,
    required dynamic parameter,
    required int length,
  });
}
