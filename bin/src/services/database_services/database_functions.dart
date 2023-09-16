abstract class DatabaseFunctions {
  String tableName = '';

  String init();

  String add();

  String update();

  List<Object> params(dynamic object);

  List<Object> paramsForUpdate(dynamic object);
}
