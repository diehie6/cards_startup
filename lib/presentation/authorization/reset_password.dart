import 'package:cards_startup/presentation/authorization/signin_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPassPage extends StatefulWidget {
  @override
  _ResetPassPageState createState() => _ResetPassPageState();
}

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

class _ResetPassPageState extends State<ResetPassPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
              SizedBox(height: 40.h,),
              Text(
                'Восстановление пароля',
                style: TextStyle(
                  color: Color(0xFF110C26),
                  fontSize: 24,
                  fontFamily: 'Airbnb Cereal App',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10.h),
              SizedBox(
                width: 244.w,
                child: Text(
                  'Please enter your email address to request a password reset',
                  style: TextStyle(
                    color: Color(0xFF110C26),
                    fontSize: 15.sp,
                    fontFamily: 'Airbnb Cereal App',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              IconTextFieldBox(icon: "assets/Mail.png", hintText: "abc@email.com"),
              SizedBox(height: 45.h,),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignInPage())
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
                        SizedBox(width: 80.w,),
                        Text(
                          'Отправить',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: 30.w,
                          height: 30.h,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 30.w,
                                  height: 30.h,
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
            ],
          ),
        ),
      ),
    );
  }
}
