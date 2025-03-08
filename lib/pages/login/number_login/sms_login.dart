import 'package:flutter/material.dart';
import 'package:talentei/pages/login/username_login/username_login.dart';
import 'package:talentei/widgets/otp.dart';

class SmsFormPage extends StatelessWidget {
  const SmsFormPage({super.key});

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
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Icon(
                                          Icons.arrow_back_ios_new_rounded,
                                          color: Color(0xFF3D5A80)),
                                    ),
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
                                'کد ارسالی به شماره ${ModalRoute.of(context)?.settings.arguments.toString() ?? ''} را وارد کنید',
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
                          const FractionallySizedBox(
                            widthFactor: 1,
                            // You can also checkout the [PinputBuilderExample]
                            child: PinputExample(),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => UsernameLoginFormPage()));
                            },
                            child: Text(
                              'ورود با نام کاربری و رمز عبور',
                              style: TextStyle(
                                color: Color(0xFF1D3E62),
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
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
