import 'package:flutter/material.dart';
import 'package:talentei/pages/tests/mbi_page.dart';

class Options extends StatefulWidget {
  Options({
    Key? key,
    this.selectedOption = -1,
  }) : super(key: key);
  int selectedOption;

  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Directionality(
        textDirection: TextDirection.rtl,
        child: RadioListTile<int>(
          value: 0,
          groupValue: widget.selectedOption,
          activeColor: Colors.blue,
          onChanged: (value) {
            setState(() {
              widget.selectedOption = value!;
            });
          },
          title: Text(
            'معمولاً احساسات و عواطف خود را در خودم نگه می‌دارم.',
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 29),
          child: Divider(
            thickness: 1,
            color: Color(
              0xFFE7E8F4,
            ),
          ),
        ),
      )
    ]);
  }
}
