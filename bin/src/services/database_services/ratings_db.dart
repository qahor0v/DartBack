import '../../models/global_models/rating_model.dart';
import 'database_functions.dart';

class RatingModelDatabase implements DatabaseFunctions {
  @override
  String tableName = 'ratings';

  @override
  String add() => '''
    INSERT INTO $tableName (
      id, message, rating, userImage, userID, username
    )
    VALUES (?, ?, ?, ?, ?, ?)
  ''';

  @override
  String init() => '''
    CREATE TABLE IF NOT EXISTS $tableName (
      id TEXT,
      message TEXT,
      rating REAL,
      userImage TEXT,
      userID TEXT,
      username TEXT
    )
  ''';

  @override
  String update() => '''
    UPDATE $tableName
    SET message = ?, rating = ?, userImage = ?, userID = ?, username = ?
    WHERE id = ?
  ''';

  @override
  List<Object> params(dynamic object) {
    RatingModel ratingModel = object as RatingModel;
    return [
      ratingModel.id,
      ratingModel.message,
      ratingModel.rating,
      ratingModel.userImage,
      ratingModel.userID,
      ratingModel.username,
    ];
  }
}
