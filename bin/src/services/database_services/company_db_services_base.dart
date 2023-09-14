import 'package:sqlite3/sqlite3.dart';

import '../../constants/db_paths.dart';
import '../../models/company_models/company_model.dart';

abstract class CompanyDatabaseServicesBase {
  final database = sqlite3.open(DatabasePaths.companiesDbMain);

  void initDatabase();

  void disposeDatabase();

  void addCompany(Company company);

  void updateCompany(Company company);

  void deleteCompany(String id);

  Company? getCompanyByPhoneNumber(String phoneNumber);

  Company? getCompanyByUsername(String username);

  Company? getCompanyByEmail(String email);

  Company? getCompanyById(String id);
}
