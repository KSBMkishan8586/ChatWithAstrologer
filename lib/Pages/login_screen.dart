/*
* @Author : Kishan kumar
* Email : ksbmkishan123@gmail.com
* Function : Login Screen
* Created Date : 11 March 2024
* */
import 'package:chatwithastrologer/Pages/otp_screen.dart';
import 'package:chatwithastrologer/Provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import '../Utils/sharedprefrence_helper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var h = 0.0;
  var w = 0.0;
  TextEditingController mobileController = TextEditingController();
  late LoginProvider? loginProvider;
  Future<void> _initializeSharedPreferences() async {
    await SharedPreferencesHelper.initialize();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharedPreferencesHelper.initialize();
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.sizeOf(context).height;
    w = MediaQuery.sizeOf(context).width;
    loginProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/images/white_rounded_below.png',
                fit: BoxFit.cover,
                height: h / 2.5,
                width: w,
              )),
          Positioned(
              top: h / 13,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/images/app_logo_fiill.png',
              )),
          Positioned(
              top: h / 2.2,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  const Text(
                    'LOGIN',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  Image.asset('assets/images/below_login_text.png')
                ],
              )),
          Positioned(
              top: h / 1.9,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Mobile No',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
                    IntlPhoneField(
                      flagsButtonPadding: const EdgeInsets.all(8),
                      flagsButtonMargin: const EdgeInsets.all(5),
                      dropdownIconPosition: IconPosition.trailing,
                      initialCountryCode: 'IN',
                      disableLengthCheck: true,
                      autovalidateMode: AutovalidateMode.disabled,
                      controller: mobileController,
                      dropdownTextStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                      style:const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                      onChanged: (phone) {
                      },
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(0),
                          hintText: 'Enter Your Mobile No',
                          hintStyle: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(15)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                              ),
                              borderRadius: BorderRadius.circular(15))),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'We are sending OTP for verification',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                      ),
                    ),
                    Center(
                      child: ElevatedButton (
                        onPressed: () async {
                          await _initializeSharedPreferences();
                          if(mobileController.text.length == 10){
                            await Provider.of<LoginProvider>(context, listen: false).doLogin(mobileController.text, context);
                            if(loginProvider!.loginModel.status == '1'){
                              Fluttertoast.showToast(msg: '${loginProvider!.loginModel.message}');
                              SharedPreferencesHelper.setUserMobileNumber('${loginProvider!.loginModel.phone}');
                              SharedPreferencesHelper.setIsNewUser('${loginProvider!.loginModel.newUser}');
                              Navigator.pushReplacement(context, MaterialPageRoute(
                                builder: (context) => OtpScreen(
                                    otp: '${loginProvider!.loginModel.otp}',
                                  mobile: mobileController.text,
                                )
                              )
                              );
                            }
                          }else{
                            Fluttertoast.showToast(msg: 'Enter valid mobile number');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(w, h / 15)),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: h / 20,
                    ),
                    Center(
                        child: TextButton(
                            onPressed: () {},
                            child: Column(
                              children: [
                                const Text(
                                  'Login As Astrologer',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: w / 9, right: w / 9),
                                  color: Colors.white,
                                  height: 1,
                                )
                              ],
                            )))
                  ],
                ),
              )
          ),
      ]
    )
    );
  }
}
