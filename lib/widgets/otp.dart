import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:smart_auth/smart_auth.dart';
import 'package:talentei/utils/general_color.dart';
import 'package:talentei/widgets/timer_counter.dart';

class PinputExample extends StatefulWidget {
  final Function(String)? onCompleted;
  const PinputExample({super.key, this.onCompleted});

  @override
  State<PinputExample> createState() => _PinputExampleState();
}

class _PinputExampleState extends State<PinputExample> {
  late final SmsRetriever smsRetriever;
  late final TextEditingController pinController;
  late final FocusNode _focusNode;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    pinController = TextEditingController();
    _focusNode = FocusNode();
    smsRetriever = SmsRetrieverImpl(SmartAuth());
    _initSmsListener();
  }

  void _initSmsListener() async {
    final signature = await smsRetriever.getSmsCode();
    if (signature != null) {
      pinController.setText(signature);
      widget.onCompleted?.call(signature);
    }
  }

  @override
  void dispose() {
    pinController.dispose();
    _focusNode.dispose();
    smsRetriever.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xFF3D5A80)),
      ),
    );

    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: Pinput(
              smsRetriever: smsRetriever,
              controller: pinController,
              focusNode: _focusNode,
              length: 5,
              defaultPinTheme: defaultPinTheme,
              separatorBuilder: (index) => const SizedBox(width: 16),
              validator: (value) {
                return value?.length == 5 ? null : 'کد اشتباه است';
              },
              onCompleted: (pin) {
                widget.onCompleted?.call(pin);
                debugPrint('onCompleted: $pin');
              },
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 9),
                    width: 22,
                    height: 1,
                    color: GeneralColor.focusedBorderColor,
                  ),
                ],
              ),
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: GeneralColor.focusedBorderColor),
                ),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  color: GeneralColor.fillColor,
                  borderRadius: BorderRadius.circular(19),
                  border: Border.all(color: GeneralColor.focusedBorderColor),
                ),
              ),
              errorPinTheme: defaultPinTheme.copyBorderWith(
                border: Border.all(color: Colors.redAccent),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Color(0xFF1D3E62),
                      size: 16,
                    ),
                    Text(
                      'تغییر شماره',
                      style: TextStyle(
                          color: Color(0xFF1D3E62),
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () {},
                child: SizedBox(
                  height: 20,
                ),
              ),
              Row(
                children: [
                  Text(
                    ' ارسال مجدد کد',
                    style: TextStyle(
                        color: Color(0xFF1D3E62),
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  TimerCounter(), // Proper way to include the widget
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF3D5A80),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Add radius here
                ),
                minimumSize: Size(270, 50),
              ),
              onPressed: () {
                _focusNode.unfocus();
                _formKey.currentState!.validate();
              },
              child: Center(
                  child: Text(
                'ثبت نام',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              )))
        ],
      ),
    );
  }
}

class SmsRetrieverImpl implements SmsRetriever {
  const SmsRetrieverImpl(this.smartAuth);
  final SmartAuth smartAuth;

  @override
  Future<void> dispose() {
    return smartAuth.removeSmsListener();
  }

  @override
  Future<String?> getSmsCode() async {
    try {
      final signature = await smartAuth.getAppSignature();
      debugPrint('App Signature: $signature');
      final res = await smartAuth.getSmsCode(
        useUserConsentApi: true,
      );
      if (res.succeed && res.codeFound) {
        return res.code!;
      }
    } catch (e) {
      debugPrint('Error getting SMS code: $e');
    }
    return null;
  }

  @override
  bool get listenForMultipleSms => false;
}
