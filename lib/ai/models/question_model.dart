class QuestionModel {
  final int id;
  final String question;
  final List<String> choices;
  final String correctChoice;

  QuestionModel({
    required this.id,
    required this.question,
    required this.choices,
    required this.correctChoice,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question': question,
      'choices': choices,
      'correct_choice': correctChoice,
    };
  }

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json['id'],
      question: json['question'],
      choices: List<String>.from(json['choices']),
      correctChoice: json['correct_choice'],
    );
  }

  QuestionModel copyWith({
    int? id,
    String? question,
    List<String>? choices,
    String? correctChoice,
  }) {
    return QuestionModel(
      id: id ?? this.id,
      question: question ?? this.question,
      choices: choices ?? this.choices,
      correctChoice: correctChoice ?? this.correctChoice,
    );
  }
}

// Dummy data:

final dummyQuestions = [
  QuestionModel(
    id: 1,
    question:
        "What is the capital of France? This is a very important question to test your general knowledge. Please answer carefully.",
    choices: ["A. London", "B. Berlin", "C. Paris", "D. Madrid"],
    correctChoice: "C. Paris",
  ),
  QuestionModel(
    id: 2,
    question:
        "Which programming language is Flutter built with? This language is known for its performance and suitability for building cross-platform applications.",
    choices: ["A. Java", "B. Dart", "C. Python", "D. C++"],
    correctChoice: "B. Dart",
  ),
  QuestionModel(
    id: 3,
    question:
        "What is 2 + 2? This is a basic arithmetic question to check your fundamental mathematical skills. Take your time to calculate the correct answer.",
    choices: ["A. 3", "B. 4", "C. 5", "D. 6"],
    correctChoice: "B. 4",
  ),
  QuestionModel(
    id: 4,
    question:
        "Explain the concept of inheritance in object-oriented programming. Provide an example of how inheritance can be used to create a hierarchy of classes with shared properties and methods. Discuss the benefits and drawbacks of using inheritance in software design.",
    choices: [
      "A. It is a type of loop",
      "B. It is a way to create new classes from existing classes",
      "C. It is a way to manage memory",
      "D. It is a way to handle errors",
    ],
    correctChoice: "B. It is a way to create new classes from existing classes",
  ),
  QuestionModel(
    id: 5,
    question:
        "What is the purpose of the 'setState' method in Flutter? Explain how 'setState' triggers a UI update and why it is important for building dynamic and interactive user interfaces. Discuss the potential performance implications of using 'setState' excessively and suggest strategies for optimizing UI updates in Flutter applications.",
    choices: [
      "A. It is a way to define variables",
      "B. It is a way to update the UI",
      "C. It is a way to handle user input",
      "D. It is a way to perform network requests",
    ],
    correctChoice: "B. It is a way to update the UI",
  ),
  QuestionModel(
    id: 6,
    question:
        "Describe the difference between stateless and stateful widgets in Flutter. Explain when you would use each type of widget and provide examples of common use cases. Discuss the lifecycle methods of stateful widgets and how they can be used to manage the state of a widget over time.",
    choices: [
      "A. Stateless widgets can change, stateful widgets cannot",
      "B. Stateless widgets cannot change, stateful widgets can",
      "C. Both can change",
      "D. Neither can change",
    ],
    correctChoice: "B. Stateless widgets cannot change, stateful widgets can",
  ),
  QuestionModel(
    id: 7,
    question:
        "What is the significance of the 'build' method in a Flutter widget? Explain how the 'build' method is used to describe the UI of a widget and how it is called during the rendering process. Discuss the importance of keeping the 'build' method pure and free of side effects to ensure predictable and efficient UI updates.",
    choices: [
      "A. It is used to define the data of a widget",
      "B. It is used to define the UI of a widget",
      "C. It is used to handle user input",
      "D. It is used to perform network requests",
    ],
    correctChoice: "B. It is used to define the UI of a widget",
  ),
  QuestionModel(
    id: 8,
    question:
        "Explain the concept of asynchronous programming in Dart and Flutter. Describe how 'async' and 'await' keywords are used to write asynchronous code and how they can improve the performance and responsiveness of Flutter applications. Discuss the use of 'Future' and 'Stream' classes for handling asynchronous operations and data streams.",
    choices: [
      "A. It is a way to write code that runs in the background",
      "B. It is a way to write code that runs in the foreground",
      "C. It is a way to write code that runs in parallel",
      "D. It is a way to write code that runs in sequence",
    ],
    correctChoice: "A. It is a way to write code that runs in the background",
  ),
];
