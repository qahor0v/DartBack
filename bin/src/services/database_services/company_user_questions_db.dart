import '../../models/global_models/company_user_questions.dart';
import 'database_functions.dart';

class CompanyUserQuestionsDatabase implements DatabaseFunctions {
  @override
  String tableName = 'questions';

  /*
  String id;
  String questionTitle;
  String answerTitle;
  String questionText;
  String answerText;
  */
  @override
  String add() => '''
    INSERT INTO $tableName (
      id, questionTitle, answerTitle, questionText, answerText, 
    )
    VALUES (?, ?, ?, ?, ? )
    ''';

  @override
  String init() => '''
    CREATE TABLE IF NOT EXISTS $tableName (
      id TEXT,
      questionTitle TEXT,
      answerTitle TEXT,
      questionText TEXT,
      answerText TEXT,
    )
  ''';

  @override
  String update() => '''
    UPDATE $tableName
    SET questionTitle = ?, answerTitle = ?, questionText = ?, answerText = ?, 
    WHERE id = ?
  ''';

  @override
  List<Object> params(dynamic object) {
    CompanyUserQuestions questions = object as CompanyUserQuestions;
    return [
      questions.id,
      questions.questionTitle,
      questions.answerTitle,
      questions.questionText,
      questions.answerText,
    ];
  }

  @override
  List<Object> paramsForUpdate(object) {
    CompanyUserQuestions questions = object as CompanyUserQuestions;
    return [
      questions.questionTitle,
      questions.answerTitle,
      questions.questionText,
      questions.answerText,
      questions.id,
    ];
  }
}
