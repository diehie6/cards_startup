import 'package:cards_startup/presentation/authorization/signin_page.dart';
import 'package:cards_startup/presentation/authorization/signup_verification.dart';
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
          borderRadius: BorderRadius.circular(12),
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


class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container (
            margin: EdgeInsets.only(left: 20, right: 20, top: 60),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                      child: Icon(Icons.chevron_left_outlined, size: 32,)
                  ),
                  SizedBox(height: 30.h,),
                  Text(
                    'Регистрация',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontFamily: 'Merriweather',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  IconTextFieldBox(icon: "assets/Profile.png" , hintText: "Full name"),
                  SizedBox(height: 15.h),
                  IconTextFieldBox(icon: "assets/Mail.png", hintText: "abc@email.com"),
                  SizedBox(height: 15.h),
                  IconTextFieldBox(icon: "assets/Lock.png", hintText: "Your password"),
                  SizedBox(height: 15.h),
                  IconTextFieldBox(icon: "assets/Lock.png", hintText: "Confirm your password"),
                  SizedBox(height: 45.h),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => VerificationPage()),
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
                              'SIGN UP',
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
                  SizedBox(height: 50.h,),
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
                  //already have account?
                  SizedBox(height: 10.sp,),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Уже есть аккаунт? ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.sp,
                            fontFamily: 'Archivo',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage()));
                          },
                          child: Text(
                            'Залогинтесь!',
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
              ),
            )
        )
    );
  }
}
