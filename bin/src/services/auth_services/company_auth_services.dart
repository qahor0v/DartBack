import 'package:sqlite3/sqlite3.dart';
import '../../constants/db_paths.dart';
import '../../models/company_models/company_model.dart';
import '../../models/exception_models/exception_model.dart';
import '../../models/user_models/user_sign_in.dart';
import '../database_services/company_db.dart';
import '../database_services/company_services_db.dart';
import '../database_services/database_services.dart';
import 'company_auth_services_base.dart';

class CompanyAuthServices implements CompanyAuthServicesBase {
  @override
  bool checkCompany(Company company) {
    CompanyDatabase companyDatabase = CompanyDatabase();
    DatabaseServices services = DatabaseServices();
    Database database = services.openDatabase(
      DatabasePaths.companiesDbMain,
    );
    services.initDatabase(
      database: database,
      functionText: companyDatabase.init(),
    );
    final checkEmail = services.get(
      database: database,
      tableName: companyDatabase.tableName,
      parameterString: 'email',
      parameter: company.email,
    );

    final checkPhone = services.get(
      database: database,
      tableName: companyDatabase.tableName,
      parameterString: 'phoneNumber',
      parameter: company.phoneNumber,
    );

    return checkPhone == null && checkEmail == null;
  }

  @override
  bool checkUsername(String username) {
    CompanyDatabase companyDatabase = CompanyDatabase();
    DatabaseServices services = DatabaseServices();
    Database database = services.openDatabase(
      DatabasePaths.companiesDbMain,
    );
    services.initDatabase(
      database: database,
      functionText: companyDatabase.init(),
    );
    final checkUsername = services.get(
      database: database,
      tableName: companyDatabase.tableName,
      parameterString: 'username',
      parameter: username,
    );

    return checkUsername == null;
  }

  @override
  CustomException deleteCompany(String companyID) {
    CompanyDatabase companyDatabase = CompanyDatabase();
    CompanyServicesDatabase servicesDatabase = CompanyServicesDatabase();
    DatabaseServices services = DatabaseServices();
    Database database = services.openDatabase(
      DatabasePaths.companiesDbMain,
    );

    services.initDatabase(
      database: database,
      functionText: companyDatabase.init(),
    );

    services.delete(
      database: database,
      tableName: companyDatabase.tableName,
      id: companyID,
    );

    services.deleteByCompanyID(
      database: database,
      tableName: servicesDatabase.tableName,
      companyID: companyID,
    );

    return CustomException.deleted;
  }

  @override
  CustomException signIn(UserSignIn signIN) {
    Company? company;
    bool check = false;
    CompanyDatabase companyDatabase = CompanyDatabase();
    DatabaseServices services = DatabaseServices();
    Database database = services.openDatabase(
      DatabasePaths.companiesDbMain,
    );
    services.initDatabase(
      database: database,
      functionText: companyDatabase.init(),
    );
    final checkEmail = services.get(
      database: database,
      tableName: companyDatabase.tableName,
      parameterString: 'email',
      parameter: signIN.login,
    );

    final checkPhone = services.get(
      database: database,
      tableName: companyDatabase.tableName,
      parameterString: 'phoneNumber',
      parameter: signIN.login,
    );

    if (checkEmail != null) {
      Company kCompany = Company.fromJson(checkEmail);
      company = kCompany;
      if (kCompany.password == signIN.password) {
        check = true;
      }
    }

    if (checkPhone != null) {
      Company kCompany = Company.fromJson(checkPhone);
      company = kCompany;
      if (kCompany.password == signIN.password) {
        check = true;
      }
    }

    if (check) {
      return CustomException.signedIn(company!.id);
    } else {
      return CustomException.notFound;
    }
  }

  @override
  CustomException signUp(Company company) {
    if (checkUsername(company.username)) {
      if (checkCompany(company)) {
        CompanyDatabase companyDatabase = CompanyDatabase();
        DatabaseServices services = DatabaseServices();
        Database database = services.openDatabase(
          DatabasePaths.companiesDbMain,
        );

        services.initDatabase(
          database: database,
          functionText: companyDatabase.init(),
        );

        services.add(
          database: database,
          functionText: companyDatabase.add(),
          params: companyDatabase.params(company),
        );

        return CustomException.registered(company.id);
      } else {
        return CustomException.alreadyHave;
      }
    } else {
      return CustomException.usernameAlreadyHave;
    }
  }

  @override
  CustomException updateCompanyData(Company company) {
    CompanyDatabase companyDatabase = CompanyDatabase();
    DatabaseServices services = DatabaseServices();
    Database database = services.openDatabase(
      DatabasePaths.companiesDbMain,
    );

    services.initDatabase(
      database: database,
      functionText: companyDatabase.init(),
    );

    services.add(
      database: database,
      functionText: companyDatabase.update(),
      params: companyDatabase.params(company),
    );

    return CustomException.updated(company.id);
  }

  @override
  CustomException verifyCompany(String companyID) {
    throw UnimplementedError();
  }
}
