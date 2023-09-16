import '../../models/company_models/company_video-model.dart';
import 'database_functions.dart';

class CompanyVideoDatabase implements DatabaseFunctions {
  @override
  String tableName = 'videos';

  /*
    String id;
    String title;
    String description;
    String duration;
    String thumbnail;
    String url;
    String createdTime;
    int views;
    int likes,
   */
  @override
  String add() => '''
    INSERT INTO $tableName (
      id, title, description, duration, thumbnail, 
      url, createdTime, views, likes
    )
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
    ''';

  @override
  String init() => '''
    CREATE TABLE IF NOT EXISTS $tableName (
      id TEXT,
      title TEXT,
      description TEXT,
      duration TEXT,
      thumbnail TEXT,
      url TEXT,
      createdTime TEXT,
      views INTEGER,
      likes INTEGER
    )
  ''';

  @override
  String update() => '''
    UPDATE $tableName
    SET title = ?, description = ?, duration = ?, thumbnail = ?, 
      url = ?, createdTime = ?, views = ?, likes = ?
    WHERE id = ?
  ''';

  @override
  List<Object> params(dynamic object) {
    CompanyVideo video = object as CompanyVideo;
    return [
      video.id,
      video.title,
      video.description,
      video.duration,
      video.thumbnail,
      video.url,
      video.createdTime,
      video.views,
      video.likes,
    ];
  }

  @override
  List<Object> paramsForUpdate(object) {
    CompanyVideo video = object as CompanyVideo;
    return [
      video.title,
      video.description,
      video.duration,
      video.thumbnail,
      video.url,
      video.createdTime,
      video.views,
      video.likes,
      video.id,
    ];
  }
}
