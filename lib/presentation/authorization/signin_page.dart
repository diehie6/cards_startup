import 'package:cards_startup/presentation/authorization/reset_password.dart';
import 'package:cards_startup/presentation/authorization/signup_page.dart';
import 'package:cards_startup/presentation/landing/landing_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconTextFieldBox extends StatelessWidget {
  final String icon;
  final String hintText;

  IconTextFieldBox({required this.icon, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370.w,
      height: 56.h,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1.w, color: Color(0xFFE4DEDE)),
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
      child: Row(
        children: [
          SizedBox(width: 8.w),
          Image.asset(
            icon,
            color: const Color(0xFF7F7979),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: hintText, // Placeholder text
                border: InputBorder.none, // Remove the border
              ),
              style: TextStyle(fontSize: 16.sp),
            ),
          ),
        ],
      ),
    );
  }
}

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _switchValue = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container (
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 80),
                      width: 350.w,
                      height: 90.h,
                      child: Center(
                        child: Image.asset("assets/logo.jpeg"),
                      ),
                    ),
                    SizedBox(height: 5.h,),

                    //app name
                    Center(
                        child: Text(
                          'NazvaniePrilozheniya',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF37364A),
                            fontSize: 35.sp,
                            fontFamily: 'Airbnb Cereal App',
                            fontWeight: FontWeight.w400,
                          ),
                        )
                    ),
                    SizedBox(height: 50.h,),
                    //sign in text
                    Text(
                      'Вход',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontFamily: 'Merriweather',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    //email and pass boxes
                    SizedBox(height: 20.h,),
                    IconTextFieldBox(icon: "assets/Mail.png", hintText: "abc@email.com"),
                    SizedBox(height: 15.h),
                    //password box
                    IconTextFieldBox(icon: "assets/Lock.png", hintText: "Your password"),
                    SizedBox(height: 15.h),
                    Row(
                      children: [
                        Container(
                          width: 42.30.w,
                          height: 29.h,
                          child: FittedBox(
                            child: CupertinoSwitch(
                              value: _switchValue,
                              onChanged: (value) {
                                setState(() {
                                  _switchValue = value;
                                });
                              },
                              activeColor: Color(0xff6A62B7),
                            ),
                          ),
                        ),
                        SizedBox(width: 5.w,),
                        Text(
                          'Remember Me',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color(0xFF110C26),
                            fontSize: 14.sp,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LandingPage()),
                            );
                          },
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPassPage()));
                            },
                            child: Text(
                              'Forgot Password?',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Color(0xFF110C26),
                                fontSize: 14.sp,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    //sign in button
                    SizedBox(height: 45.h),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SignInPage()),
                          );
                        },
                        child: Container(
                          width: 273.w,
                          height: 56.h,
                          decoration: BoxDecoration(
                            color: Color(0xff6A62B7),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(width: 100.w,),
                              Text(
                                'SIGN IN',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: 30,
                                height: 30,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: ShapeDecoration(
                                          color: Colors.white,
                                          shape: OvalBorder(),
                                        ),
                                        child: Icon(
                                          Icons.arrow_forward,
                                          color: Color(0xff6A62B7),
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10.w,)
                            ],
                          ),
                        ),
                      ),
                    ),
                    //text "OR"
                    SizedBox(height: 20.h,),
                    Center(
                      child: Text(
                        'OR',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF9D9898),
                          fontSize: 16.sp,
                          fontFamily: 'Airbnb Cereal App',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    //login with google
                    SizedBox(height: 20.h,),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          // Handle button tap here
                          print("Sign In with Google button pressed");
                        },
                        child: Container(
                          width: 273.w,
                          height: 56.h,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x3FD2D4E2),
                                blurRadius: 30,
                                offset: Offset(15, 0),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/googleLogo.png",
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 16.0),
                                child: Center(
                                  child: Text(
                                    'Login with Google',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF110C26),
                                      fontSize: 16.sp,
                                      fontFamily: 'Airbnb Cereal App',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          //
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              print("fef");
                            },
                            child: Text(
                              'Войти как гость ',
                              style: TextStyle(
                                color: Color(0xFF403A7A),
                                fontSize: 15.sp,
                                fontFamily: 'Archivo',
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          Text(
                            'или ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.sp,
                              fontFamily: 'Archivo',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                            },
                            child: Text(
                              'Зарегестрируйтесь',
                              style: TextStyle(
                                color: Color(0xFF403A7A),
                                fontSize: 15.sp,
                                fontFamily: 'Archivo',
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
            )

        )
    );
  }

}
