import 'dart:async';

import 'package:chatwithastrologer/Pages/home_screens/main_screen.dart';
import 'package:chatwithastrologer/Pages/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Utils/sharedprefrence_helper.dart';

class SplashOne extends StatefulWidget {
  const SplashOne({Key? key}) : super(key: key);

  @override
  State<SplashOne> createState() => _SplashOneState();
}

class _SplashOneState extends State<SplashOne> {
  Future<void> _initializeSharedPreferences() async {
    await SharedPreferencesHelper.initialize();
  }
  _SplashOneState(){
    Timer(const Duration(milliseconds: 2000), () async{
      if(SharedPreferencesHelper.getIsLoggedIn() == 'loggedIn'){
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const MainScreen()), (route) => false);
      }else{
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const SplashScreen()), (route) => false);
      }
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initializeSharedPreferences();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Center(
          child: Image.asset('assets/images/app_logo_fiill.png'),
        ),
      )
    );
  }
}
