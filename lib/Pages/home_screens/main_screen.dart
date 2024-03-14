import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatwithastrologer/Pages/home_screens/call_astro_screen.dart';
import 'package:chatwithastrologer/Pages/home_screens/chat_astro_screen.dart';
import 'package:chatwithastrologer/Pages/home_screens/home_screen.dart';
import 'package:chatwithastrologer/Pages/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../Utils/sharedprefrence_helper.dart';
import '../../Utils/utils_widgets.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Future<void> _initializeSharedPreferences() async {
    await SharedPreferencesHelper.initialize();
  }
  var h = 0.0;
  var w = 0.0;
  final PageStorageBucket bucket = PageStorageBucket();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Widget currentScreen = const HomeScreen();
  int currentTab = 0;
  String mobile = '';
  String name = '';
  String userImage = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initializeSharedPreferences();
    mobile = SharedPreferencesHelper.getMobileNumber();
    name = SharedPreferencesHelper.getUserName();
    userImage = SharedPreferencesHelper.getUserImage();
  }
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.sizeOf(context).height;
    w = MediaQuery.sizeOf(context).width;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xFFFFF1E1),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF1E1),
        leading: Container(
          width: w * 0.03,
          height: w * 0.03,
          margin: EdgeInsets.all(w/100),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color: Theme.of(context).primaryColor,
                width: 2.0
            ),
          ),
          child: InkWell(
            onTap: (){
              if(_scaffoldKey.currentState!.isDrawerOpen){
                _scaffoldKey.currentState?.openEndDrawer();
              }else{
                _scaffoldKey.currentState?.openDrawer();
              }},
            child: ClipOval(
              child: Image.network(
                SharedPreferencesHelper.getUserImage(),
                fit: BoxFit.cover,
                width: 50.0,
                height: 50.0,
              ),
            ),
          ),
        ),
        title: Text('Welcome\n${SharedPreferencesHelper.getUserName()}',
        style: TextStyle(
          color: Colors.black,
          fontSize: w*0.03,
          fontWeight: FontWeight.w600
        ),),
        actions: [
          InkWell(
              onTap: (){},
            borderRadius: BorderRadius.circular(25.0),
              child: Ink(
                height: w/7,
                width: w/7,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
              ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/images/wallet_icon.png',fit: BoxFit.contain, filterQuality: FilterQuality.high,),
                ),
            ),
          ),
          SizedBox(width: w/90,),
          InkWell(
            onTap: (){},
            borderRadius: BorderRadius.circular(25.0),
            child: Ink(
              height: w/7,
              width: w/7,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/images/notification_bell.png',fit: BoxFit.contain, filterQuality: FilterQuality.high,),
              ),
            ),
          ),
          SizedBox(width: w/90,),
          InkWell(
            onTap: (){},
            borderRadius: BorderRadius.circular(25.0),
            child: Ink(
              height: w/7,
              width: w/7,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/images/search_icon.png',fit: BoxFit.contain, filterQuality: FilterQuality.high,),
              ),
            ),
          ),
        ],
      ),
      body: PopScope(
          child: PageStorage(
            bucket: bucket,
            child: currentScreen,
          ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Image.asset('assets/images/app_logo.png', fit: BoxFit.cover, ),
        backgroundColor: const Color(0xFFFFF1E1),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: h/12,
        color: Colors.white,
        notchMargin: 5,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            Container(
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: currentTab == 0 ? Theme.of(context).primaryColor : Colors.white,
                shape: BoxShape.circle
              ),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Set your desired shadow color here
                      spreadRadius: 2.0, // Set your desired spread radius here
                      blurRadius: 8.0, // Set your desired blur radius here
                      offset: Offset(0, 4), // Set your desired offset here
                    ),
                  ],
                ),
                margin: const EdgeInsets.all(3),
                padding: EdgeInsets.all(5),
                child: InkWell(
                  onTap: (){
                    setState(() {
                      currentScreen = const HomeScreen();
                      currentTab = 0;
                    });
                  },
                  child: Center(
                    child: Image.asset(
                      'assets/images/home_icon.png', fit: BoxFit.cover,),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 5, right: 50, top: 5, bottom: 5),
              decoration: BoxDecoration(
                  color: currentTab == 1 ? Theme.of(context).primaryColor : Colors.white,
                  shape: BoxShape.circle
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Set your desired shadow color here
                      spreadRadius: 2.0, // Set your desired spread radius here
                      blurRadius: 8.0, // Set your desired blur radius here
                      offset: Offset(0, 4), // Set your desired offset here
                    ),
                  ],
                ),
                margin: const EdgeInsets.all(3),
                padding: EdgeInsets.all(5),
                child: InkWell(
                  onTap: (){
                    setState(() {
                      currentScreen = const AstroChatScreen();
                      currentTab = 1;
                    });
                  },
                  child: Center(
                    child: Image.asset(
                      'assets/images/chat_icon.png', fit: BoxFit.cover,),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: currentTab == 2 ? Theme.of(context).primaryColor : Colors.white,
                  shape: BoxShape.circle
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Set your desired shadow color here
                      spreadRadius: 2.0, // Set your desired spread radius here
                      blurRadius: 8.0, // Set your desired blur radius here
                      offset: Offset(0, 4), // Set your desired offset here
                    ),
                  ],
                ),
                margin: const EdgeInsets.all(3),
                padding: EdgeInsets.all(5),
                child: InkWell(
                  onTap: (){
                    setState(() {
                      currentScreen = const AstroCallScreen();
                      currentTab = 2;
                    });
                  },
                  child: Center(
                    child: Image.asset(
                      'assets/images/call_icon.png', fit: BoxFit.cover,),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: currentTab == 3 ? Theme.of(context).primaryColor : Colors.white,
                  shape: BoxShape.circle
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Set your desired shadow color here
                      spreadRadius: 2.0, // Set your desired spread radius here
                      blurRadius: 8.0, // Set your desired blur radius here
                      offset: Offset(0, 4), // Set your desired offset here
                    ),
                  ],
                ),
                margin: const EdgeInsets.all(3),
                padding: EdgeInsets.all(5),
                child: InkWell(
                  onTap: (){
                    if(_scaffoldKey.currentState!.isDrawerOpen){
                      _scaffoldKey.currentState?.openEndDrawer();
                    }else{
                      _scaffoldKey.currentState?.openDrawer();
                    }
                    setState(() {
                      currentTab = 3;
                    });
                  },
                  child: Center(
                    child: Image.asset(
                      'assets/images/account_icon.png', fit: BoxFit.cover,),
                  ),
                ),
              ),
            ),
            /*Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                  ],
                ),
                //Right side pagesroute
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                  ],
                ),*/
          ],
        ),
      ),
      drawer: Drawer(
        child: Stack(
          children: [
            Positioned(
                top: 0, child: Image.asset('assets/images/drawer_above.png')),
            ListView(
              shrinkWrap: true,
              children: [
                Stack(
                  children: [
                    Positioned(
                        right: 10,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              currentScreen = const HomeScreen();
                              currentTab = 0;
                            });
                            if(_scaffoldKey.currentState!.isDrawerOpen){
                              _scaffoldKey.currentState?.openEndDrawer();
                            }else{
                              _scaffoldKey.currentState?.openDrawer();
                            }
                          },
                          child: const Icon(Icons.close_rounded),
                        )),
                    Positioned(
                        right: 10,
                        top: h/10,
                        child: InkWell(
                          onTap: () {

                          },
                          child: Image.asset('assets/images/edit_icon.png', width: w*0.10, height: w*0.10,),
                        )),
                    Container(
                      width: w,
                      height: h / 6,
                      margin: EdgeInsets.only(top: h/17, left: 10),
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Profile',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600
                          ),),
                          SizedBox(
                            height: h/100,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: w*0.2,
                                height: w*0.2,
                                decoration: BoxDecoration(
                                  color: const Color(0xff7c94b6),
                                  shape: BoxShape.circle
                                ),
                                child: ClipOval(
                                  child: CachedNetworkImage(
                                    imageUrl: SharedPreferencesHelper.getUserImage(),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: w/30,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('${SharedPreferencesHelper.getUserName()}',style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,

                                  ),),
                                  Text('${SharedPreferencesHelper.getMobileNumber()} ',style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,

                                  ),),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                ListTile(
                  dense: true,
                  leading: Icon(Icons.wallet),
                  title: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Wallet Balance',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 10.5,
                            fontWeight: FontWeight.w600),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                  visualDensity: const VisualDensity(vertical: -2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  dense: true,
                  leading: Icon(Icons.currency_rupee),
                  title: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Payment Bill History',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 10.5,
                            fontWeight: FontWeight.w600),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                  visualDensity: const VisualDensity(vertical: -2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  dense: true,
                  leading: Icon(Icons.video_camera_back_outlined),
                  title: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Videos',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 10.5,
                            fontWeight: FontWeight.w600),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                  visualDensity: const VisualDensity(vertical: -2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  dense: true,
                  leading: Icon(Icons.question_mark_rounded),
                  title: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'How to use our App?',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 10.5,
                            fontWeight: FontWeight.w600),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                  visualDensity: const VisualDensity(vertical: -2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  dense: true,
                  leading: Icon(Icons.question_mark_rounded),
                  title: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'What i can ask to astrologer',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 10.5,
                            fontWeight: FontWeight.w600),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                  visualDensity: const VisualDensity(vertical: -2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  dense: true,
                  leading: Icon(Icons.share_outlined),
                  title: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Refer & Earn',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 10.5,
                            fontWeight: FontWeight.w600),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                  visualDensity: const VisualDensity(vertical: -2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  dense: true,
                  leading: Icon(Icons.support_agent),
                  title: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Help & Support',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 10.5,
                            fontWeight: FontWeight.w600),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                  visualDensity: const VisualDensity(vertical: -2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  dense: true,
                  leading: Icon(Icons.star_rate_rounded),
                  title: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Rate us',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 10.5,
                            fontWeight: FontWeight.w600),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                  visualDensity: const VisualDensity(vertical: -2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  dense: true,
                  leading: Icon(Icons.info_outline),
                  title: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'About Chat with Astrologer',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 10.5,
                            fontWeight: FontWeight.w600),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                  visualDensity: const VisualDensity(vertical: -2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  dense: true,
                  leading: Icon(Icons.settings),
                  title: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Settings',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 10.5,
                            fontWeight: FontWeight.w600),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                  visualDensity: const VisualDensity(vertical: -2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  dense: true,
                  leading: Icon(Icons.logout),
                  title: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Logout',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 10.5,
                            fontWeight: FontWeight.w600),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                  visualDensity: const VisualDensity(vertical: -2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onTap: () async{
                    await SharedPreferencesHelper.clearAllData();
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const SplashScreen()), (route) => false);                 },
                ),
              ],
            ),
            Positioned(
                bottom: 0, child: Image.asset('assets/images/drawer_bottom.png')),
            const Positioned(
                bottom: 30,
                left: 0,
                right: 0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.power_settings_new),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Log Out')
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
