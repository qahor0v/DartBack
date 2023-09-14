import 'src/models/company_models/company_model.dart';
import 'src/services/database_services/company_db_services.dart';
import 'src/utils/id_generator.dart';

void main() {
  CompanyDatabaseServices services = CompanyDatabaseServices();
  Company company = Company(
    id: IdServices.shortID(),
    username: "my_company",
    password: "123",
    title: "The Company Title",
    slogan: "The Company Slogan",
    registeredTime: "${DateTime.now()}",
    description: "The description of company",
    image: "https:image",
    rating: 9.9,
    subscribes: 1921,
    email: "companyemail@gmail.com",
    phoneNumber: "+998912452810",
  );

  services.initDatabase();
  final data = services.getCompanyByPhoneNumber(company.title);
  print(data?.toJson().toString());
  print("Company deleted!");
}
