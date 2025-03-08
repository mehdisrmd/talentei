// quiz_model.dart

class OptionModel {
  final String id;
  final String text;

  OptionModel({required this.id, required this.text});

  factory OptionModel.fromJson(Map<String, dynamic> json) {
    return OptionModel(
      id: json['id'],
      text: json['text'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
    };
  }
}

class QuestionModel {
  final String id;
  final String text;
  final List<OptionModel> options;
  String? selectedOptionId;

  QuestionModel({
    required this.id,
    required this.text,
    required this.options,
    this.selectedOptionId,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json['id'],
      text: json['text'],
      options: (json['options'] as List)
          .map((option) => OptionModel.fromJson(option))
          .toList(),
      selectedOptionId: json['selectedOptionId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'options': options.map((option) => option.toJson()).toList(),
      'selectedOptionId': selectedOptionId,
    };
  }
}

class Quiz {
  final String id;
  final String title;
  final List<QuestionModel> questions;

  Quiz({
    required this.id,
    required this.title,
    required this.questions,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      id: json['id'],
      title: json['title'],
      questions: (json['questions'] as List)
          .map((question) => QuestionModel.fromJson(question))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'questions': questions.map((question) => question.toJson()).toList(),
    };
  }
}
