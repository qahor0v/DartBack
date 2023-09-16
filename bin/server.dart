import 'src/models/user_models/user_model.dart';
import 'src/models/user_models/user_sign_in.dart';
import 'src/services/auth_services/user_auth_services.dart';
import 'src/utils/id_generator.dart';

void main() {
  testSignUp();
}

void testSignUp() {
  User user = User(
    id: "YDWwSCfp2023916204251344755",
    lastName: "Zafarovich",
    firstName: "Zamon",
    email: "aemail@gmail.com",
    password: "123456",
    phoneNumber: "99891",
    profileImage: "http://image",
    profileRegisterTime: "${DateTime.now()}",
  );

  UserSignIn signIn = UserSignIn(login: "zamon@gmail.com", password: "123456");

  UserAuthServices services = UserAuthServices();

  final result = services.updateUserData(user);

  print(result.title);
}
