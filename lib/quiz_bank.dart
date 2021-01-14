// repository of questions and answers for the quiz app

import 'question_answer.dart';

class QuizBank {
  int _questionNumber = 0;

  List<QuestionAnswer> _questionsAndAnswers = [
    QuestionAnswer('Some cats are actually allergic to humans', true),
    QuestionAnswer('You can lead a cow down stairs but not up stairs.', false),
    QuestionAnswer(
        'Approximately one quarter of human bones are in the feet.', true),
    QuestionAnswer('A slug\'s blood is green.', true),
    QuestionAnswer('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    QuestionAnswer('It is illegal to pee in the Ocean in Portugal.', true),
    QuestionAnswer(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    QuestionAnswer(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    QuestionAnswer(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    QuestionAnswer(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    QuestionAnswer('Google was originally called \"Backrub\".', true),
    QuestionAnswer(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    QuestionAnswer(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  bool nextQuestion() {
    if (_questionNumber < _questionsAndAnswers.length - 1) {
      _questionNumber++;
      return true;
    } else if (_questionNumber >= _questionsAndAnswers.length - 1) {
      _questionNumber = 0;
      return false;
    } else {
      return false;
    }
  }

  String getQuestion() {
    return _questionsAndAnswers[_questionNumber].question;
  }

  bool getAnswer() {
    return _questionsAndAnswers[_questionNumber].answer;
  }
}
