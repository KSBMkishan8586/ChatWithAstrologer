import 'package:chatwithastrologer/Pages/splash_zero.dart';
import 'package:chatwithastrologer/Provider/astro_list_provider.dart';
import 'package:chatwithastrologer/Provider/banner_provider.dart';
import 'package:chatwithastrologer/Provider/login_provider.dart';
import 'package:chatwithastrologer/Provider/otp_provider.dart';
import 'package:chatwithastrologer/Provider/register_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform
  );
  FirebaseMessaging.instance.getToken().then((String? token) {
    print('FCM Token: $token');
  });
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => LoginProvider(),),
            ChangeNotifierProvider(create: (_) => OtpProvider(),),
            ChangeNotifierProvider(create: (_) => RegisterProvider(),),
            ChangeNotifierProvider(create: (_) => BannerProvider(),),
            ChangeNotifierProvider(create: (_) => AstroListProvider()),
          ],
        child: MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final Color _primaryColor = HexColor('#CC7B25');
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat With Astrologer',
      theme: ThemeData(
        fontFamily: 'Montserrat',
        primaryColor: _primaryColor,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashOne(),
    );
  }
}
