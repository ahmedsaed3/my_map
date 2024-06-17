import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_maps/business_logic/cubit/phone_auth_cubit.dart';
import 'package:my_maps/constants/strings.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../constants/my_colors.dart';
import 'map_screen.dart';

class OtpScreen extends StatelessWidget {
  late String otpCode;
  final phoneNumber;

  OtpScreen({Key? key, required this.phoneNumber}) : super(key: key);

  Widget BuildIntroText() {
    return Container(
      child: Text(
        "Verify your phone number",
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }

  Widget BuildText() {
    return Container(
      child: Column(
        children: [
          Text(
            "Enter your 6 digit code numbers sent to",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          Text(
            "$phoneNumber-",
            style: TextStyle(color: Colors.blueAccent),
          ),
        ],
      ),
    );
  }

  Widget buildPinCodeFields(BuildContext context) {
    return Container(
      child: PinCodeTextField(
        appContext: context,
        autoFocus: true,
        cursorColor: Colors.black,
        keyboardType: TextInputType.number,
        length: 6,
        obscureText: false,
        animationType: AnimationType.scale,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 50,
          fieldWidth: 40,
          borderWidth: 1,
          activeColor: MyColors.blue,
          inactiveColor: MyColors.blue,
          inactiveFillColor: Colors.white,
          activeFillColor: MyColors.lightBlue,
          selectedColor: MyColors.blue,
          selectedFillColor: Colors.white,
        ),
        animationDuration: Duration(milliseconds: 300),
        backgroundColor: Colors.white,
        enableActiveFill: true,
        onCompleted: (submitedCode) {
          otpCode = submitedCode;
          print("Completed");
        },
        onChanged: (value) {
          print(value);
        },
      ),
    );
  }

  Widget BuildButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        child: Text(
          "Verify",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        onPressed: () {
          showProgressIndicator(context);
          login(context);
        },
        style: ElevatedButton.styleFrom(
            minimumSize: Size(110, 50),
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            )),
      ),
    );
  }

  void showProgressIndicator(BuildContext context) {
    AlertDialog alertDialog = AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
        ),
      ),
    );

    showDialog(
      barrierColor: Colors.white.withOpacity(0),
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return alertDialog;
      },
    );
  }

  Widget buildPhoneVerificationBloc() {
    return BlocListener<PhoneAuthCubit, PhoneAuthState>(
        listenWhen: (previous, current) {
      ///??????????????????
      return previous != current;
    }, listener: (context, state) {
      if (state is Loading) {
        showProgressIndicator(context);
      }
      if (state is PhoneOTPVerified) {
        Navigator.pop(context);
        Navigator.of(context).pushReplacementNamed(mapScreen);
      }
      if (state is ErrorOccurred) {
        Navigator.pop(context);
        String errorMsg = (state).errorMsg;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMsg),
            backgroundColor: Colors.black,
            duration: Duration(seconds: 3),
          ),
        );
      }
    });
  }

  void login(BuildContext context) {
    BlocProvider.of<PhoneAuthCubit>(context).submitOTP(otpCode);
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 88, horizontal: 32),
              child: Column(
                children: [
                  BuildIntroText(),
                  SizedBox(
                    height: 50,
                  ),
                  buildPinCodeFields(context),
                  SizedBox(
                    height: 20,
                  ),
                  BuildButton(context),
                  buildPhoneVerificationBloc(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
