import '../../models/company_models/company_model.dart';
import '../../models/exception_models/exception_model.dart';
import '../../models/user_models/user_sign_in.dart';

abstract class CompanyAuthServicesBase {
  bool checkCompany(Company company);

  bool checkUsername(String username);

  CustomException signUp(Company company);

  CustomException signIn(UserSignIn company);

  CustomException updateCompanyData(Company company);

  CustomException deleteCompany(String companyID);

  CustomException verifyCompany(String companyID);
}
