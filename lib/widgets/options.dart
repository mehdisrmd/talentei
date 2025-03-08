import 'package:flutter/material.dart';
import '../models/quiz_model.dart';

class Options extends StatefulWidget {
  const Options({super.key, required this.currentQuestion, required this.nextQuestion});
  final QuestionModel currentQuestion;
  final VoidCallback nextQuestion;

  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  int? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: widget.currentQuestion.options.length,
      itemBuilder: (context, index) {
        final option = widget.currentQuestion.options[index];
        return Column(
          children: [
            Directionality(
              textDirection: TextDirection.rtl,
              child: RadioListTile<int>(
                value: index,
                groupValue: _selectedOption,
                activeColor: Colors.blue,
                onChanged: (value) {
                  setState(() {
                    _selectedOption = value;
                    Future.delayed(Duration(milliseconds: 200)).then((d) {
                      widget.nextQuestion();
                    });
                  });
                },
                title: Text(
                  option.text,
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Visibility(
              visible: index != widget.currentQuestion.options.length - 1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 29),
                child: Divider(
                  thickness: 1,
                  color: Color(0xFFE7E8F4),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
