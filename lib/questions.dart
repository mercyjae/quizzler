

class Question {
  String questionText;
  bool questionAnswer;
  Question({required this.questionText, required this.questionAnswer});
}
class QuizBrain {
  int questionNumber = 0;
  List<Question> questionBank = [
    Question(
        questionText: "A credit card and a debit card are the same.",
        questionAnswer: false),
    Question(
        questionText:
        "Queen Elizabeth the 1st was the daughter of King Henry the 8th of England",
        questionAnswer: true),
    Question(
        questionText:
        "Vitamin C is also known by the chemical name of Ascorbic Acid",
        questionAnswer: false),
    Question(
        questionText:
        "The Nobel prize-winning novel ‘The Old Man and the Sea’ was written by the American",
        questionAnswer: true),
    Question(
        questionText: "The atomic number for lithium is 17",
        questionAnswer: true),
    Question(
        questionText: "There are five different blood groups",
        questionAnswer: false),
    Question(
        questionText:
        "In theory, it takes over 5,000 helium balloons to lift an average-sized human from the ground",
        questionAnswer: true),
    Question(
        questionText:
        "The term inflation refers to a general fall in the prices of most products and services",
        questionAnswer: false),
    Question(
        questionText:
        "The maximum length for a video posted on TikTok is 60 seconds",
        questionAnswer: true),
    Question(
        questionText: "Glass is manufactured mainly from processed sand",
        questionAnswer: true),
    Question(
        questionText: "The liver is the largest organ in the human body",
        questionAnswer: false),
    Question(
        questionText:
        "A person’s fingernails and hair continue to grow after they die",
        questionAnswer: false),
    Question(
        questionText:
        "Women usually reach the earning-peak of their career when they are younger than men",
        questionAnswer: true),
    Question(
        questionText:
        "Ethereum is the second-largest cryptocurrency after Bitcoin.",
        questionAnswer: true),
    Question(
        questionText: "All introverts are shy and socially anxious.",
        questionAnswer: false),
    Question(
        questionText: "Copyrights depreciate over time.", questionAnswer: true),
    Question(questionText: "Emus can’t fly.", questionAnswer: true),
    Question(
        questionText: "The capital of Australia is Sydney. ",
        questionAnswer: false),
    Question(
        questionText: "In Scotland, the unicorn is their national animal.",
        questionAnswer: true),
    Question(
        questionText: "The Atlantic Ocean is the world’s biggest ocean.",
        questionAnswer: false),

  ];

  void nextQuestion(){
    if(questionNumber < questionBank.length - 1){
      questionNumber++;
    }
  }
  String getQuestion(){
    return questionBank[questionNumber].questionText;
  }
  bool getAnswer(){
    return questionBank[questionNumber].questionAnswer;
  }
  void reset(){
    questionNumber = 0;
  }
}

