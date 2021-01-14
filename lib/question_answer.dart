// class to pair a question with it's (true or false) answer
class QuestionAnswer {
  String _question;
  bool _answer;

  // constructor
  QuestionAnswer(String question, bool answer) {
    _question = question;
    _answer = answer;
  }

  String get question {
    return _question;
  }

  bool get answer {
    return _answer;
  }
}
