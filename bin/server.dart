import 'src/services/database_services/user_db_services.dart';

void main() {
  final UserDatabaseServices services = UserDatabaseServices();
  // final user = User(
  //   id: IdServices.shortID(),
  //   lastName: "Last",
  //   firstName: "First",
  //   email: "email@gmail.com",
  //   password: "123",
  //   phoneNumber: "99891",
  //   profileImage: "https://imageUrl",
  //   profileRegisterTime: "${DateTime.now()}",
  // );
  services.initDatabase();
  services.deleteUser("8");
  print("Deleted!");
  services.disposeDatabase();
}
