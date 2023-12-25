import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmPage extends StatefulWidget {
  const ConfirmPage({Key? key}) : super(key: key);

  @override
  State<ConfirmPage> createState() => _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 60, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset("assets/fi_menu.png"),
                  Spacer(),
                  Text(
                    'Все темы',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 27.sp,
                      fontFamily: 'Merriweather',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Spacer(),
                  Image.asset("assets/Avatar 1.png")
                ],
              ),
              SizedBox(height: 60.h,),
              Center(
                child: Container(
                  width: 360.w,
                  height: 518.h,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x336A6A6A),
                        blurRadius: 30.90,
                        offset: Offset(0, 2),
                        spreadRadius: 4,
                      )
                    ],
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Column(
                          children: [
                            SizedBox(height: 30.h,),
                            Container(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 156.w,
                                    height: 146.92.h,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFFC6C1F8),
                                      shape: OvalBorder(),
                                    ),
                                    child: Image.asset("assets/check_icon.png"),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 40.h,),
                            Text(
                              'Вопрос\nна модерации',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 26.46.sp,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 20.h,),
                            Text(
                              'Мы немедленно рассмотрим\nтвой вопрос и опубликуем его',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.62.sp,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.23,
                              ),
                            ),
                            SizedBox(height: 40.h,),
                            Container(
                              width: 245.w,
                              height: 45.27.h,
                              padding: const EdgeInsets.symmetric(horizontal: 37.28, vertical: 13.32),
                              decoration: ShapeDecoration(
                                color: Color(0xFFC6C1F8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.65.r),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Отлично!',
                                    style: TextStyle(
                                      color: Color(0xFF1C1F24),
                                      fontSize: 17.75.sp,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
