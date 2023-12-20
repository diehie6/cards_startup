import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerificationPage extends StatefulWidget {
  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  late List<FocusNode> _focusNodes;
  late List<TextEditingController> _controllers;

  int _seconds = 20;
  Timer? _timer;
  bool _showResend = false;
  bool _showSent = false;

  @override
  void initState() {
    super.initState();

    // Focus nodes and controllers initialization
    _focusNodes = List.generate(4, (index) {
      FocusNode node = FocusNode();
      node.addListener(() {
        setState(() {}); // Rebuild the widget on focus change
      });
      return node;
    });
    _controllers = List.generate(4, (index) => TextEditingController());

    // Timer initialization
    _startTimer();
  }

  _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_seconds == 1) { // Updated this line to make it stop at 1
        _timer!.cancel();
        setState(() {
          _showResend = true;
          _seconds = 0; // Hide the timer once it reaches 1
        });
      } else {
        setState(() {
          _seconds--;
        });
      }
    });
  }

  @override
  void dispose() {
    _focusNodes.forEach((node) {
      node.removeListener(() {});
      node.dispose();
    });
    _controllers.forEach((controller) => controller.dispose());
    _timer?.cancel(); // Cancel the timer
    super.dispose();
  }

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
                'Verification',
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
                  'We’ve send you the verification code on +1 2620 0323 7631',
                  style: TextStyle(
                    color: Color(0xFF110C26),
                    fontSize: 15.sp,
                    fontFamily: 'Airbnb Cereal App',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(4, (index) => _buildOtpBox(index)),
              ),
              SizedBox(height: 45.h,),
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
                        SizedBox(width: 75.w,),
                        Text(
                          'Продолжить',
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
              SizedBox(height: 20.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ... [Rest of your Row code]
                  Text(
                    'Re-send code in ',
                    style: TextStyle(
                      color: Color(0xFF110C26),
                      fontSize: 15.sp,
                      fontFamily: 'Airbnb Cereal App',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  if (_seconds > 0)
                    Text(
                      '$_seconds',
                      style: TextStyle(
                        color: Color(0xFF5669FF), // Highlighted the timer text
                        fontSize: 15.sp,
                        fontFamily: 'Airbnb Cereal App',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  if (_showResend)
                    GestureDetector(
                      onTap: () {
                        print('Resend button has been tapped!');
                        setState(() {
                          _showSent = true;
                          _showResend = false;
                        });
                      },
                      child: Text(
                        _showSent ? 'Sent!' : 'Resend',
                        style: TextStyle(
                          color: Color(0xFF5669FF),
                        ),
                      ),
                    ),
                  if (_showSent && !_showResend)
                    Text(
                      'Sent!',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOtpBox(int index) {
    return Container(
      width: 50.w,
      height: 50.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: _focusNodes[index].hasFocus ? Color(0xff6A62B7) : Colors.grey,
          width: 2.0.w,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: TextField(
          cursorColor: Color(0xff6A62B7),
          controller: _controllers[index],
          focusNode: _focusNodes[index],
          maxLength: 1,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24.sp, color: Color(0xff6A62B7)),
          decoration: InputDecoration(
            counterText: '',
            border: InputBorder.none,
          ),
          onChanged: (value) {
            if (value.isNotEmpty && index < 3) {
              FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
            }
          },
        ),
      ),
    );
  }
}
