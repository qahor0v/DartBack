import '../../models/exception_models/exception_model.dart';
import '../../models/user_models/user_model.dart';
import '../../models/user_models/user_sign_in.dart';

abstract class UserAuthServicesBase {
  bool checkUser(User user);

  CustomException signUp(User user);

  CustomException signIn(UserSignIn user);

  CustomException updateUserData(User user);

  CustomException deleteUser(String userID);
}
