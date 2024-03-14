import 'dart:convert';
import 'dart:io';
import 'package:chatwithastrologer/Provider/register_provider.dart';
import 'package:chatwithastrologer/Utils/api_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Utils/sharedprefrence_helper.dart';
import 'home_screens/main_screen.dart';

class UserRegistraton extends StatefulWidget {
  String? phoneNumber;
  UserRegistraton({
    required this.phoneNumber
});

  @override
  State<UserRegistraton> createState() => _UserRegistratonState();
}

class _UserRegistratonState extends State<UserRegistraton> {
  var h = 0.0;
  var w = 0.0;
  File? imageFile;
  String image_base64 = '';
  String name = '';
  String mobile = '';
  String email = '';
  String gender = '';
  RegisterProvider? registerProvider;
  bool termsCondition = false;
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  Future<void> _initializeSharedPreferences() async {
    await SharedPreferencesHelper.initialize();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initializeSharedPreferences();
    mobileController.text = widget.phoneNumber.toString();
  }
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.sizeOf(context).height;
    w = MediaQuery.sizeOf(context).width;
    registerProvider = Provider.of<RegisterProvider>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            top: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  height: h/4.8,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/user_reg_vector.png'),
                      fit: BoxFit.cover
                    )
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 15,
                          left: w/17,
                          child: Text('Create Your \nAccount',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.italic
                            ),
                          )
                      )
                    ],
                  ),
                )
              )
          ),
          Positioned(
            left: 0,
              right: 0,
              top: h/4,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: MediaQuery.sizeOf(context).width/9,
                      backgroundColor: Colors.grey.shade700,
                      child: InkWell(
                        onTap: (){
                          _getFromGallery();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(2), // Border radius
                          child: ClipOval
                            (child: imageFile == null? Image.asset('assets/images/app_logo.png', fit: BoxFit.cover, width: w/5,height: w/5,):Image.file(imageFile!, fit: BoxFit.cover, width: w/5,height: w/5,),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 25, 10, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Enter Your Name', style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600
                          ),),
                          TextFormField(
                            inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]"))],
                            controller: nameController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                borderSide: new BorderSide(
                                  color: Colors.deepOrangeAccent,
                                  width: 2,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 2
                                )
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                      width: 2
                                  )
                              ),
                              hintText: 'Enter Your Name',
                              hintStyle: TextStyle(
                                color: Colors.grey.shade500,
                                fontStyle: FontStyle.italic
                              )
                            ),
                            validator: (val){
                              if(val!.isEmpty){
                                return 'Name Cannot be blank';
                              }
                              return null;
                            },
                            onChanged: (value){
                              name = value;
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 25, 10, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Enter Your Mobile No', style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600
                          ),),
                          TextFormField(
                            keyboardType: TextInputType.phone,
                            controller: mobileController,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                enabled: false,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                  borderSide: new BorderSide(
                                    color: Colors.deepOrangeAccent,
                                    width: 2,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor,
                                        width: 2
                                    )
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor,
                                        width: 2
                                    )
                                ),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor,
                                        width: 2
                                    )
                                ),
                                hintText: 'Enter Your Mobile No',
                                hintStyle: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontStyle: FontStyle.italic
                                )
                            ),
                            validator: (val){
                              if(val!.isEmpty){
                                return 'mobile Cannot be blank';
                              }
                              return null;
                            },
                            onChanged: (value){
                              mobile = value;
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 25, 10, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Enter Your Email', style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600
                          ),),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                  borderSide: new BorderSide(
                                    color: Colors.deepOrangeAccent,
                                    width: 2,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor,
                                        width: 2
                                    )
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor,
                                        width: 2
                                    )
                                ),
                                hintText: 'Enter Your Email',
                                hintStyle: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontStyle: FontStyle.italic
                                )
                            ),
                            validator: (val){
                              if(val!.isEmpty){
                                return 'email Cannot be blank';
                              }
                              return null;
                            },
                            onChanged: (value){
                              email = value;
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: h/35,
                    ),
                    Container(
                      height: h/30,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Radio(
                            value: 'Male',
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value.toString();
                              });
                            },
                          ),
                          Text('Male'),
                          SizedBox(width: 20), // Add some spacing between the radio buttons
                          Radio(
                            value: 'Female',
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value.toString();
                              });
                            },
                          ),
                          Text('Female'),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          activeColor: Theme.of(context).primaryColor,
                          value: this.termsCondition,
                          onChanged: (value){
                            setState(() {
                              this.termsCondition = value!;
                            });
                          },
                        ),
                        Container(
                          child: Text.rich(
                              TextSpan(
                                  children: [
                                    TextSpan(text: "I agree to the our ", style: TextStyle(fontSize: 10)),
                                    TextSpan(
                                      text: 'Privacy Policy ',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {
                                          //privacy policy page
                                          final Uri url = Uri.parse('https://astrofriends.in/privacy.html');
                                          if (!await launchUrl(url)) {
                                            throw Exception('Could not launch $url');
                                          }
                                        },
                                      style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 10, decoration: TextDecoration.underline),
                                    ),
                                    TextSpan(text: " and ", style: TextStyle(fontSize: 10)),
                                    TextSpan(
                                      text: ' Terms of Use',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = ()async {
                                          final Uri url = Uri.parse('https://astrofriends.in/terms.html');
                                          if (!await launchUrl(url)) {
                                            throw Exception('Could not launch $url');
                                          }
                                        },
                                      style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 10, decoration: TextDecoration.underline),
                                    ),
                                  ]
                              )
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
          ),
          Positioned(
            bottom: 10,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () async{
                        if(nameController.text.isEmpty){
                          Fluttertoast.showToast(msg: 'Enter your name');
                        }else if(mobileController.text.isEmpty){
                          Fluttertoast.showToast(msg: 'Enter your mobile number');
                        }else if(emailController.text.isEmpty){
                          Fluttertoast.showToast(msg: 'Enter your email');
                        }else if(gender.isEmpty){
                          Fluttertoast.showToast(msg: 'select your gender');
                        }else if(imageFile == null){
                          Fluttertoast.showToast(msg: 'Please Choose Profile Image');
                        }else{
                          await registerProvider?.registerUser(context, nameController.text, '', emailController.text, gender, widget.phoneNumber.toString(), image_base64, SharedPreferencesHelper.getUserID());
                          Fluttertoast.showToast(msg: '${registerProvider?.registerModel.message}');
                          if(registerProvider?.registerModel.status == '1'){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const MainScreen()));
                            await SharedPreferencesHelper.isLoggedIn('loggedIn');
                            await SharedPreferencesHelper.setUserEmail('${registerProvider?.registerModel.data?.email}');
                            await  SharedPreferencesHelper.setGender('${registerProvider?.registerModel.data?.gender}');
                            await  SharedPreferencesHelper.setUserName('${registerProvider?.registerModel.data?.username}');
                            await  SharedPreferencesHelper.setUserImage('${ApiConstants.baseUrl}admin/${registerProvider?.registerModel.data?.userProfileImage}');
                            await  SharedPreferencesHelper.setReferCode('${registerProvider?.registerModel.data?.referralCode}');
                          }
                        }
                      },
                      child: Text(
                        'Create',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                        side: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 1.5
                        )
                      ),
                      minimumSize: Size(w/1.2, h/15)
                    ),
                  ),
                  SizedBox(height: h/55,),
                  Text('Already a member ? Login')
                ],
              )
          )
        ],
      ),
    );
  }
  _getFromGallery() async {
    XFile? pickedFile = (await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxWidth: 3000,
        maxHeight: 3000
    ));
    if (pickedFile != null) {
      File imageFiledata = File(pickedFile.path);
      List<int> imageBytes = await imageFiledata.readAsBytes();
      setState(() {
        imageFile = imageFiledata;
        image_base64 = base64Encode(imageBytes);
        print('image_file===-> $image_base64');
      });
    }else{
      debugPrint('Image not picked!');
    }
  }
}
