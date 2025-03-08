import 'package:flutter/material.dart';
import 'package:talentei/models/quiz_model.dart';
import 'package:talentei/utils/general_color.dart';
import 'package:talentei/widgets/options.dart';

class MbtiTestScreen extends StatefulWidget {
  const MbtiTestScreen({super.key});

  @override
  _MbtiTestScreenState createState() => _MbtiTestScreenState();
}

class _MbtiTestScreenState extends State<MbtiTestScreen>
    with SingleTickerProviderStateMixin {
  int _currentQuestion = 0;
  int _selectedOption = -1;
  bool _isNext = true; // To determine the direction of animation

  List<QuestionModel> questionModelList = [
    QuestionModel(
        id: '0',
        text:
            'در یک مهمانی، شما بیشتر وقت خود را صرف صحبت با افراد مختلف می‌کنید.',
        options: [
          OptionModel(id: '0', text: 'کاملاً مخالف'),
          OptionModel(id: '1', text: 'مخالف'),
          OptionModel(id: '2', text: 'موافق'),
        ]),
    QuestionModel(
        id: '1',
        text: 'شما ترجیح می‌دهید برنامه‌های خود را از قبل تنظیم کنید.',
        options: [
          OptionModel(id: '0', text: 'کاملاً مخالف'),
          OptionModel(id: '1', text: 'مخالف'),
          OptionModel(id: '2', text: 'موافق'),
          OptionModel(id: '3', text: 'کاملاً موافق')
        ]),
    QuestionModel(
        id: '2',
        text: 'شما به راحتی می‌توانید احساسات خود را بیان کنید.',
        options: [
          OptionModel(id: '0', text: 'کاملاً مخالف'),
          OptionModel(id: '1', text: 'مخالف'),
          OptionModel(id: '2', text: 'موافق'),
        ]),
    QuestionModel(
        id: '3',
        text: 'شما ترجیح می‌دهید به جای کار گروهی، به تنهایی کار کنید.',
        options: [
          OptionModel(id: '0', text: 'کاملاً مخالف'),
          OptionModel(id: '1', text: 'مخالف'),
        ]),
    QuestionModel(
        id: '4',
        text: 'شما معمولاً تصمیمات خود را بر اساس منطق و تحلیل می‌گیرید.',
        options: [
          OptionModel(id: '0', text: 'کاملاً مخالف'),
          OptionModel(id: '1', text: 'مخالف'),
          OptionModel(id: '2', text: 'موافق'),
          OptionModel(id: '3', text: 'کاملاً موافق')
        ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 30),
                height: 70,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 0),
                          spreadRadius: 10,
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.03))
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: Color(0xFFE7E7E8))),
                child: Center(
                    child: Text(
                  'MBTI تست شخصیت شناسی',
                  style: TextStyle(
                      color: GeneralColor.headerTitleColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 20),
                )),
              ),
              SizedBox(height: 25),
              // Animated Progress Bar
              Row(
                children: [
                  Text('پایان آزمون',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF353639))),
                  Spacer(),
                  SizedBox(
                    width: 220,
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: TweenAnimationBuilder<double>(
                        duration:
                            Duration(milliseconds: 500), // 500ms animation
                        curve: Curves.easeInOut, // Smooth animation curve
                        tween: Tween<double>(
                          begin: 0.0, // Start from 0
                          end: _currentQuestion /
                              questionModelList
                                  .length, // End at current progress
                        ),
                        builder: (context, value, child) {
                          return LinearProgressIndicator(
                            borderRadius: BorderRadius.circular(10),
                            value: value, // Animated value
                            backgroundColor: Color(0xFFC7D3EB),
                            color: Color(0xFF50A2C8),
                            minHeight: 10,
                          );
                        },
                      ),
                    ),
                  ),
                  Spacer(),
                  Text('${_currentQuestion + 1} از ${questionModelList.length}',
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF353639))),
                ],
              ),
              SizedBox(height: 25),
              // Question Text
              Container(
                height: 70,
                decoration: BoxDecoration(
                    color: Color(0xFFE7E8F4),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 1),
                          spreadRadius: 10,
                          blurRadius: 40,
                          color: Color(0xff0c6d950d).withValues(alpha: .05))
                    ]),
                child: Center(
                  child: Text(
                    'لطفا هر یک از عبارات زیر را به دقت مطالعه کرده و سپس در هر سوال عبارتی که شما را بهتر توصیف می کند، انتخاب نمایید.',
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Animated Question and Options
              Expanded(
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 500), // 500ms duration
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    final slideAnimation = Tween<Offset>(
                      begin: _isNext
                          ? Offset(1.0, 0.0) // Left to right for next
                          : Offset(-1.0, 0.0), // Right to left for previous
                      end: Offset.zero,
                    ).animate(
                      CurvedAnimation(
                        parent: animation,
                        curve: Curves.easeInOut,
                      ),
                    );
                    final fadeAnimation = Tween<double>(
                      begin: 0.0,
                      end: 1.0,
                    ).animate(
                      CurvedAnimation(
                        parent: animation,
                        curve: Curves.easeInOut,
                      ),
                    );
                    return FadeTransition(
                      opacity: fadeAnimation,
                      child: SlideTransition(
                        position: slideAnimation,
                        child: child,
                      ),
                    );
                  },
                  child: Column(
                    key: ValueKey<int>(
                        _currentQuestion), // Unique key for each question
                    children: [
                      // Question
                      Text(
                        questionModelList[_currentQuestion].text,
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            height: 1.5,
                            color: Color(0xFF353639)),
                      ),
                      SizedBox(height: 20),
                      // Options
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 2,
                              color: Color(0xFFE7E8F4),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xff0c6d950d)
                                      .withValues(alpha: .05),
                                  offset: Offset(0, 1),
                                  spreadRadius: 8,
                                  blurRadius: 40,
                                  blurStyle: BlurStyle.normal)
                            ]),
                        child: Options(
                          nextQuestion: () {
                            if (_currentQuestion <
                                questionModelList.length - 1) {
                              setState(() {
                                _isNext = true;
                                _currentQuestion++;
                                _selectedOption = -1;
                              });
                            }
                          },
                          currentQuestion: questionModelList[_currentQuestion],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // User Name Tag

              SizedBox(height: 16),
              // Navigation Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_currentQuestion < questionModelList.length - 1) {
                        setState(() {
                          _isNext = true; // Left to right animation
                          _currentQuestion++;
                          _selectedOption = -1;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF51A2C8),
                      minimumSize: Size(110, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 3,
                    ),
                    child: Text(
                      'سوال بعدی',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_currentQuestion > 0) {
                        setState(() {
                          _isNext = false; // Right to left animation
                          _currentQuestion--;
                          _selectedOption = -1;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF51A2C8),
                      minimumSize: Size(110, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 3,
                    ),
                    child: Text(
                      'سوال قبلی',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
