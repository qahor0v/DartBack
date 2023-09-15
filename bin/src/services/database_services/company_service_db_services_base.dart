import 'package:sqlite3/sqlite3.dart';

import '../../constants/db_paths.dart';
import '../../models/company_models/company_service_model.dart';

abstract class CompanyServicesDbServiceBase {
  final String tableName = 'services';
  final database = sqlite3.open(DatabasePaths.companyServicesDbMain);

  void initDatabase();

  void disposeDatabase();

  void addService(CompanyService service);

  void updateService(CompanyService service);

  void deleteService(String id);

  List<CompanyService> getServiceByCompanyID(String companyID);

  CompanyService? getServiceById(String id);

  List<CompanyService> getServices(int length);
}
