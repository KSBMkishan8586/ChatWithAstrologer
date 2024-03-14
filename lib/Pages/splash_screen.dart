import 'package:chatwithastrologer/Pages/user_registration.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var h = 0.0;
  var w = 0.0;

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.sizeOf(context).height;
    w = MediaQuery.sizeOf(context).width;
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Image.asset(
              'assets/images/splash_image.png',
              fit: BoxFit.cover,
            )),
        Positioned(
            bottom: h / 25,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  'Chat with Astrologer',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: h / 30,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: h / 130,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    'Your personal horoscope in your mobile know more about your self with our expert calculation',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: h / 70,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                SizedBox(
                  height: h / 40,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 30.0, right: 30, top: 8.0, bottom: 8.0),
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: h / 30,
                      ),
                    ),
                  ),
                )
              ],
            ))
      ],
    ));
  }
}
