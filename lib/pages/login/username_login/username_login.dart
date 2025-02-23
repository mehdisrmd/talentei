import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:talentei/pages/login/number_login/enter_number.dart';
import 'package:talentei/utils/general_color.dart';
import 'package:talentei/widgets/sign_form_inpu.dart';

class UsernameLoginFormPage extends StatefulWidget {
  @override
  State<UsernameLoginFormPage> createState() => _UsernameLoginFormPageState();
}

class _UsernameLoginFormPageState extends State<UsernameLoginFormPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  bool _isBlurred = false;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    // Add a curve to the slide animation
    _slideAnimation = Tween<Offset>(
      begin: Offset(0, -1), // Start off-screen at the top
      end: Offset(0, 0), // End at its final position
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut, // Smooth curve animation
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _showCustomSnackBar(BuildContext context) {
    setState(() {
      _isBlurred = true; // Activate blur
    });

    _animationController.forward(); // Start the animation

    ScaffoldMessenger.of(context)
        .showSnackBar(
          SnackBar(
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height - 100,
              left: 20,
              right: 20,
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            content: SlideTransition(
              position: _slideAnimation,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Color(0xFFDEF7EC),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Color.fromARGB(255, 168, 190, 169),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'ورود شما با موفقیت انجام شد',
                      style: TextStyle(
                        color: Color(0xFF046C4E),
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.check_circle, color: Color(0xFF046C4E)),
                  ],
                ),
              ),
            ),
            duration: Duration(seconds: 3),
          ),
        )
        .closed
        .then((_) {
          _animationController.reverse(); // Reverse animation
          setState(() {
            _isBlurred = false; // Disable blur after SnackBar closes
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Main Content
          Container(
            alignment: Alignment.bottomCenter,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.lightBlueAccent.shade200,
                  Colors.deepPurpleAccent.shade200,
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
                            topRight: Radius.circular(20),
                          ),
                        ),
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 33,
                            horizontal: 31,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 28,
                                    height: 28,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        width: 2,
                                        color: Color(0xFF3D5A80),
                                      ),
                                    ),
                                    child: Center(
                                      child: FittedBox(
                                        child: Icon(
                                          Icons.arrow_back_ios_new_rounded,
                                          color: Color(0xFF3D5A80),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 18),
                                width: 134,
                                height: 103,
                                child: Image.asset(
                                  'assets/images/talent_logo.png',
                                ),
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
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(width: 7),
                                    Container(
                                      height: 33,
                                      width: 2,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(width: 7),
                                    Text(
                                      ' ورود',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
                              SizedBox(height: 20),
                              Form(
                                key: _formKey,
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
                                    SizedBox(height: 10),
                                    SignFormInput(
                                      hint: 'رمز عبور',
                                      controller: passController,
                                      icon: null,
                                      isPassword: false,
                                      textDirection: TextDirection.ltr,
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.right,
                                      validation: null,
                                      isValid: false,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Text(
                                    'رمز عبور خود را فراموش کردید؟',
                                    style: TextStyle(
                                      color: Color(0xFF1D3E62),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    shape: WidgetStatePropertyAll<
                                      RoundedRectangleBorder
                                    >(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    backgroundColor:
                                        WidgetStatePropertyAll<Color>(
                                          GeneralColor.buttonFormColor,
                                        ),
                                  ),
                                  onPressed: () {
                                    if (usernameController.text.isNotEmpty &&
                                        passController.text.isNotEmpty) {
                                      FocusScope.of(context).unfocus();

                                      _showCustomSnackBar(context);
                                    }
                                  },
                                  child: Center(
                                    child: Text(
                                      'ورود',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              ///sfesefsfws
                              SizedBox(height: 20),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (ctx) => NumberFormPage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'ورود با رمز یکبار مصرف',
                                  style: TextStyle(
                                    color: Color(0xFF1D3E62),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Apply blur effect when SnackBar is visible
          if (_isBlurred)
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(color: Colors.black.withOpacity(0.2)),
              ),
            ),
        ],
      ),
    );
  }
}
