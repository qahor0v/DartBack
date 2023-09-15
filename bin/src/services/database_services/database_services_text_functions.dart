abstract class DTF {
  ///[Company] table name
  static String companyTable = 'companies';

  ///Add [Company] table to [Database]
  static String companyInit() => '''
    CREATE TABLE IF NOT EXISTS $companyTable (
      id TEXT,
      username TEXT,
      email TEXT,
      phoneNumber TEXT,
      password TEXT,
      title TEXT,
      slogan TEXT,
      registeredTime TEXT,
      description TEXT,
      image TEXT,
      rating TEXT,
      subscribes INTEGER
    )
  ''';

  ///Add [Company] to [Database]
  static String companyAdd() => '''
    INSERT INTO $companyTable (
      id, username, email, password, phoneNumber, 
      title, slogan, registeredTime, description, 
      image, rating, subscribes
    )
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    ''';

  ///Update [Company] from [Database]
  static String companyUpdate() => '''
    UPDATE $companyTable
    SET username = ?, email = ?, password = ?, phoneNumber = ?, 
      title = ?, slogan = ?, registeredTime = ?, description = ?, 
      image = ?, rating = ?, subscribes = ?
    WHERE id = ?
  ''';
}
