import 'src/models/company_models/company_model.dart';
import 'src/models/user_models/user_sign_in.dart';
import 'src/services/auth_services/company_auth_services.dart';
import 'src/utils/id_generator.dart';

void main() {
  testSignUp();
}

void testSignUp() {
  CompanyAuthServices authServices = CompanyAuthServices();
  Company company = Company(
    id: IdServices.token(),
    username: "username",
    password: "123",
    title: "The Company Title",
    slogan: "The Company Slogan",
    registeredTime: "${DateTime.now()}",
    description: "Lorem Ipsum Dolor",
    image: "http://image",
    rating: 4.5,
    subscribes: 119,
    email: "email@gmail.com",
    phoneNumber: "+99891",
  );

  UserSignIn signIn = UserSignIn(login: "+998912452810", password: "123");

  final result = authServices.signIn(signIn);

  print(result.title);
}
