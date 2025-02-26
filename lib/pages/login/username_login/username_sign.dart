import 'package:flutter/material.dart';
import 'package:talentei/utils/general_color.dart';
import 'package:talentei/widgets/sign_form_inpu.dart';

class UsernameSignFormPage extends StatefulWidget {
  @override
  State<UsernameSignFormPage> createState() => _UsernameSignFormPageState();
}

class _UsernameSignFormPageState extends State<UsernameSignFormPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.bottomCenter,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.lightBlueAccent.shade200,
                Colors.deepPurpleAccent.shade200
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // TimerCounter(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .7,
                    child: Card(
                      margin: EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      color: const Color.fromARGB(255, 255, 255, 255),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 33, horizontal: 31),
                        child: Column(children: [
                          Row(
                            children: [
                              Container(
                                width: 28,
                                height: 28,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 2, color: Color(0xFF3D5A80))),
                                child: Center(
                                  child: FittedBox(
                                    child: Icon(
                                        Icons.arrow_back_ios_new_rounded,
                                        color: Color(0xFF3D5A80)),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 18),
                            width: 134,
                            height: 103,
                            child: Image.asset(
                                'assets/images/talent_logo.png'), //this is my imgage name talent_logo.png
                          ),
                          SizedBox(
                            height: 33,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'عضویت',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.grey),
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                Container(
                                  height: 33, // Adjust height as needed
                                  width: 2, // Exact width of line
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                Text(
                                  ' ورود',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.grey),
                                )
                              ],
                            ),
                          ),
                          // SizedBox(
                          //   height: 80,
                          // ),
                          Spacer(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text(
                                'نام کاربری و رمز عبور مورد نظر خود را وارد کنید',
                                style: TextStyle(
                                  color: Color(0xFF1D3E62),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Form(
                              key: _formKey,
                              onChanged: () {},
                              child: Column(
                                children: [
                                  SignFormInput(
                                    hint: 'نام کاربری',
                                    controller: usernameController,
                                    icon: null,
                                    isPassword: false,
                                    textDirection: TextDirection.ltr,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.right,
                                    validation: null,
                                    isValid: false,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SignFormInput(
                                    hint: 'رمز عبور',
                                    controller: usernameController,
                                    icon: null,
                                    isPassword: false,
                                    textDirection: TextDirection.ltr,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.right,
                                    validation: null,
                                    isValid: false,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SignFormInput(
                                    hint: 'تکرار رمز عبور',
                                    controller: usernameController,
                                    icon: null,
                                    isPassword: false,
                                    textDirection: TextDirection.ltr,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.right,
                                    validation: null,
                                    isValid: false,
                                  ),
                                ],
                              )),

                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                  shape: WidgetStatePropertyAll<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  backgroundColor:
                                      WidgetStatePropertyAll<Color>(
                                          GeneralColor.buttonFormColor),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    // Form is valid, proceed with your logic
                                    debugPrint('Form is valid');

                                    // Add your navigation or API call here
                                  } else {
                                    // Form is invalid
                                    debugPrint('Form is invalid');
                                  }
                                },
                                child: Center(
                                  child: Text(
                                    'ثبت‌نام',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                        color: Colors.white),
                                  ),
                                )),
                          ),

                          Spacer()
                        ]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
