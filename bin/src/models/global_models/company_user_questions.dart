class CompanyUserQuestions {
  String id;
  String questionTitle;
  String answerTitle;
  String questionText;
  String answerText;

  CompanyUserQuestions({
    required this.id,
    required this.questionTitle,
    required this.answerTitle,
    required this.questionText,
    required this.answerText,
  });

  factory CompanyUserQuestions.fromJson(Map<String, dynamic> json) {
    return CompanyUserQuestions(
      id: json['id'],
      questionTitle: json['questionTitle'],
      answerTitle: json['answerTitle'],
      questionText: json['questionText'],
      answerText: json['answerText'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'questionTitle': questionTitle,
      'answerTitle': answerTitle,
      'questionText': questionText,
      'answerText': answerText,
    };
  }
}
