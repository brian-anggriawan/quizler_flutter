import 'question.dart';

class MasterQuestion {
  double _totalPoint = 0;
  int _questionStep = 0;
  bool _isFinished = false;
  List<bool> _listUserAnswer = [];
  final List<Question> _masterQuestion = [
    Question('Apakah jakarta ibukota negara indonesia ?', true),
    Question('Apakah surabaya ibukota provinsi jawa timur ?', true),
    Question('Benarkah indonesia ada di benua eropa ?', false),
    Question('Donal trumph adalah presiden negara indonesia ?', false),
    Question('Hewan komodo berasal dari indonesia ?', true)
  ];

  String getQuestion() {
    return this._masterQuestion[this._questionStep].questionName;
  }

  bool getAnswer() {
    return this._masterQuestion[this._questionStep].questionAnswer;
  }

  bool isLastQuestion() {
    if (this._listUserAnswer.length < (this._masterQuestion.length - 1)) {
      return false;
    }

    return true;
  }

  bool isFinished() {
    return this._isFinished;
  }

  List getUserAnswer() {
    return this._listUserAnswer;
  }

  int getPoint() {
    return this._totalPoint.toInt();
  }

  void submitAnswer(bool userAnswer) {
    bool isCorrectAnswer = userAnswer == this.getAnswer();
    if (this.isLastQuestion()) {
      if (!this._isFinished) {
        this._listUserAnswer.add(isCorrectAnswer);
        this.calculatePoint(isCorrectAnswer);
      }
      this._isFinished = true;
    } else {
      this._listUserAnswer.add(isCorrectAnswer);
      this._questionStep++;
      this.calculatePoint(isCorrectAnswer);
    }
  }

  void calculatePoint(bool isCorrectAnswer) {
    if (isCorrectAnswer) {
      double total = (100 / this._masterQuestion.length);
      this._totalPoint += total;
    }
  }

  void resetQuestion() {
    this._isFinished = false;
    this._totalPoint = 0;
    this._questionStep = 0;
    this._listUserAnswer.clear();
  }
}
