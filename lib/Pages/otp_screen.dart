import 'dart:async';
import 'package:chatwithastrologer/Pages/home_screens/main_screen.dart';
import 'package:chatwithastrologer/Pages/user_registration.dart';
import 'package:chatwithastrologer/Provider/login_provider.dart';
import 'package:chatwithastrologer/Provider/otp_provider.dart';
import 'package:chatwithastrologer/Utils/api_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';

import '../Utils/sharedprefrence_helper.dart';

class OtpScreen extends StatefulWidget {
  String? otp;
  String? mobile;
  OtpScreen({
    required this.otp,
    required this.mobile
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  var h = 0.0;
  var w = 0.0;
  bool resendLoader = false;
  bool resendTextVisibility = false;
  LoginProvider? loginProvider;
  OtpProvider? otpProvider;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _database = FirebaseDatabase.instance.reference();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  Timer? _timer;
  String otp = '';
  OtpFieldController otpController = OtpFieldController();
  Future<void> _initializeSharedPreferences() async {
    await SharedPreferencesHelper.initialize();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer?.cancel();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initializeSharedPreferences();
    Provider.of<OtpProvider>(context, listen: false).startResendTimer();
  }

  @override
  Widget build(BuildContext context) {
    otpProvider = Provider.of<OtpProvider>(context, listen: true);
    loginProvider = Provider.of<LoginProvider>(context, listen: false);
    h = MediaQuery.sizeOf(context).height;
    w = MediaQuery.sizeOf(context).width;
    debugPrint('your otp is====>${widget.otp.toString()}');
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Stack(
        children: [
          Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                  'assets/images/otp_screen_vector.png',
                width: w/1.5,
              )
          ),
          Positioned(
              left: 0,
              right: 0,
              top: h / 10,
              child: Column(
                children: [
                  Text(
                    'Confirmation code has been sent you on your mobile no +91 ${widget.mobile}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
                    child: OTPTextField(
                      length: 4,
                      width: MediaQuery.of(context).size.width,
                      fieldStyle: FieldStyle.box,
                      fieldWidth: 50,
                      obscureText: false,
                      keyboardType: TextInputType.phone,
                      outlineBorderRadius: 5,
                      controller: otpController,
                      otpFieldStyle: OtpFieldStyle(
                        focusBorderColor: Theme.of(context).primaryColor,
                        backgroundColor: Colors.white,
                        enabledBorderColor: Theme.of(context).primaryColor,
                        borderColor: Theme.of(context).primaryColor,
                      ),
                      onCompleted: (v) {
                        debugPrint(v);
                      },
                      onChanged: (value) {
                        debugPrint(value);
                        setState(() {
                          otp = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: h / 15,
                  ),
                  Visibility(
                    visible: !otpProvider!.isTimerFinished,
                    child: Text(
                      '${((otpProvider!.count % 3600) ~/ 60).toString().padLeft(2, '0')}:${(otpProvider!.count % 60).toString().padLeft(2, '0')}',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: h / 15,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      verifyUser(widget.mobile.toString(), otp);
                      otpController.clear();
                      //Navigator.push(context, MaterialPageRoute(builder: (context)=> const UserRegistraton()));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        minimumSize: Size(w / 1.2, h / 16)),
                    child: const Text(
                      'Verify',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h / 55,
                  ),
                  Visibility(
                    visible: otpProvider!.isTimerFinished,
                    child: TextButton(
                      onPressed: () {
                        resendOtp(widget.mobile.toString());
                      },
                      child: const Text(
                        'Resend',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
  void resendOtp(String mobile) async {
    await Provider.of<LoginProvider>(context, listen: false).doLogin(mobile, context);
    Provider.of<OtpProvider>(context, listen: false).resetCounter();
  }
  void verifyUser(String mobile, String otp) async {
    await _initializeSharedPreferences();
    await otpProvider?.verifyUser(context, otp, mobile);
    if(otpProvider?.otpModel.status == '1'){
      Fluttertoast.showToast(msg: '${otpProvider?.otpModel.message}');
      await SharedPreferencesHelper.setUserId('${otpProvider?.otpModel.id}');
      await SharedPreferencesHelper.setUserName('${otpProvider?.otpModel.username}');
      await SharedPreferencesHelper.setGender('${otpProvider?.otpModel.gender}');
      await SharedPreferencesHelper.setUserImage('${ApiConstants.baseUrl}/admin/${otpProvider?.otpModel.image}');
      await SharedPreferencesHelper.setUserEmail('${otpProvider?.otpModel.email}');
      await SharedPreferencesHelper.setUserMobileNumber(widget.mobile.toString());
      await SharedPreferencesHelper.isLoggedIn('loggedIn');
      String firebaseID = '${widget.mobile}@gmail.com';
      loginFirebase(firebaseID, '${otpProvider?.otpModel.id}', '${ApiConstants.baseUrl}/admin/${otpProvider?.otpModel.image}');
      //navigate to main page
      Navigator.push(context, MaterialPageRoute(builder: (context)=> const MainScreen()));
      //existing user hai.
    }
    else if(otpProvider?.otpModel.status == '0'){
      Fluttertoast.showToast(msg: '${otpProvider?.otpModel.message}');
    }
    else if(otpProvider?.otpModel.status == '2'){
      String firebaseID = '${widget.mobile}@gmail.com';
      regFirebase(firebaseID,  '${otpProvider?.otpModel.id}', '${ApiConstants.baseUrl}/admin/${otpProvider?.otpModel.image}');
      Fluttertoast.showToast(msg: '${otpProvider?.otpModel.message}');
      await SharedPreferencesHelper.setUserId('${otpProvider?.otpModel.id}');
      await SharedPreferencesHelper.setUserName('${otpProvider?.otpModel.username}');
      await SharedPreferencesHelper.setGender('${otpProvider?.otpModel.gender}');
      await SharedPreferencesHelper.setUserImage('${ApiConstants.baseUrl}/admin/${otpProvider?.otpModel.image}');
      await SharedPreferencesHelper.setUserEmail('${otpProvider?.otpModel.email}');
      await SharedPreferencesHelper.setUserMobileNumber(widget.mobile.toString());
      Fluttertoast.showToast(msg: 'You have to register your profile');
      //navigate to registration
      Navigator.push(context, MaterialPageRoute(builder: (context)=> UserRegistraton(phoneNumber: '${widget.mobile}',)));
    }
  }
  Future<void> regFirebase(String firebaseIdm, String id, String image) async {
    try{
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: firebaseIdm, password: '12345678'
      );
      User? firebaseUser = userCredential.user;
      if(firebaseUser != null){
        String userId = firebaseUser.uid;
        print(userId);
        Map<String, dynamic> map = {
          "token": await _firebaseMessaging.getToken(),
          "name": "User $firebaseIdm",
          "email": firebaseIdm,
          "phone": widget.mobile,
          "status": "Welcome to my Profile!",
          "image": image,
          "cover": "default",
          "date": ServerValue.timestamp,
        };
        Map<String, dynamic> uimap = {
          id: userId
        };
        print("$uimap");
        FirebaseDatabase.instance.ref("UserId/$id").set(userId);
        FirebaseDatabase.instance.ref("Users/$userId").set(map);
        print("$uimap");
      }
    }catch(e){
      print("createUser failed: $e");
    }
  }
  Future<void> loginFirebase(String number, String id, String image) async {
    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: number,
          password: '12345678'
      );
      if(userCredential.user != null){
        String? token = await _firebaseMessaging.getToken();
        String userId = userCredential.user!.uid;
        print('===========================>${userId}');
        FirebaseDatabase.instance.ref("UserId/$id").set(userId);
        FirebaseDatabase.instance.ref("Users/$userId").child("image").set(image);
        // Updating user device token
        await _database.child("Users").child(userId).child("token").set(token);
        Map<String, dynamic> uimap = {
          id: userId
        };
        print("$uimap");
      }
    }catch(e){
      print("signIn failed: $e");
    }
  }
}
