/*
* @Author : Kishan kumar
* Email : ksbmkishan123@gmail.com
* Function : OTP Provider class
* Created Date : 11 March 2024
* */
import 'dart:async';

import 'package:chatwithastrologer/Models/otp_model.dart';
import 'package:chatwithastrologer/Services/services.dart';
import 'package:flutter/cupertino.dart';

import '../Utils/loading.dart';

class OtpProvider with ChangeNotifier{
  late OtpModel _otpModel;
  bool loading = false;
  Services services = Services();
  int _counter = 30; // Set the initial duration for OTP resend (in seconds)
  int get count => _counter;
  bool get isTimerFinished => _counter == 0;

  void startResendTimer() {
    const oneSecond = Duration(seconds: 1);
    Timer.periodic(oneSecond, (Timer timer) {
      if (_counter > 0) {
        _counter--;
        notifyListeners();
        debugPrint('${_counter}');
      } else {
        timer.cancel(); // Stop the timer when it reaches 0
        // Optionally, you can trigger the OTP resend logic here
      }
    });
  }

  void resetCounter() {
    _counter = 30; // Reset the counter to the initial duration
    notifyListeners();
    const oneSecond = Duration(seconds: 1);
    Timer.periodic(oneSecond, (Timer timer) {
      if (_counter > 0) {
        _counter--;
        notifyListeners();
        debugPrint('${_counter}');
      } else {
        timer.cancel(); // Stop the timer when it reaches 0
        // Optionally, you can trigger the OTP resend logic here
      }
    });
  }

  OtpProvider(){
    _otpModel = OtpModel();
  }

  OtpModel get otpModel => _otpModel;

  verifyUser(BuildContext context, String otp, String mobile) async{
    loading = true;
    GlobalLoader.show(context, 'please wait..', false);
    notifyListeners();
    _otpModel = await services.verifyUser(otp, mobile);
    loading = false;
    GlobalLoader.hide(context);
    notifyListeners();
  }
}