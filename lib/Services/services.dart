/*
* @Author : Kishan kumar
* Email : ksbmkishan123@gmail.com
* Function : API calls and cast in model and providers
* Created Date : 11 March 2024
* */

import 'dart:convert';
import 'package:chatwithastrologer/Models/otp_model.dart';
import 'package:chatwithastrologer/Models/register_model.dart';
import 'package:flutter/cupertino.dart';
import '../Models/astrolist_model.dart';
import '../Models/login_model.dart';
import 'package:http/http.dart' as http;
import '../Utils/api_constants.dart';

class Services{
  Future<LoginModel> doLogin(mobile) async{
    try{
      final response = await http.post(Uri.parse('${ApiConstants.userLogin+'?&number='+mobile}&token=&is_register=1'));
      if(response.statusCode == 200){
        final item = json.decode(response.body);
        debugPrint(item.toString());
        return LoginModel.fromJson(item);
      }else{
        throw Exception('Failed to login');
      }
    }catch (e){
      print('Error Occurred$e');
    }
    return LoginModel();
  }
  Future<OtpModel> verifyUser(otp, mobile) async{
    try{
      final response = await http.post(Uri.parse('${ApiConstants.otpVerification+'otp='+otp+'&number='+mobile}&user_token=1235455'));
      if(response.statusCode == 200){
        final item = json.decode(response.body);
        debugPrint(item.toString());
        debugPrint('your otp is=-==========>${otp}');
        debugPrint('your mobile is=-==========>${mobile}');
        return OtpModel.fromJson(item);
      }else{
        throw Exception('Failed to verify');
      }
    }catch (e){
      print('Error Occurred$e');
    }
    return OtpModel();
  }
  Future<RegisterModel> registerUser(mobile, firstName, lastName, email, gender, image, id) async{
    Map<String, String> requestBody = {
      "date_of_birth": '',
      "time_of_birth": '',
      "place_of_birth": '',
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "gender": gender,
      "mobile": mobile,
      "image": image,
      "country": 'India',
      "type": "user",
      "id": id,
    };
    try{
      final response = await http.post(Uri.parse(ApiConstants.updateAccount), body: requestBody);
      if(response.statusCode == 200){
        final item = json.decode(response.body);
        debugPrint(item.toString());
        debugPrint(requestBody.toString());
        return RegisterModel.fromJson(item);
      }else{
        throw Exception('Failed to register');
      }
    }catch (e){
      print('Error Occurred$e');
    }
    return RegisterModel();
  }
  Future<Map<String, dynamic>> fetchData() async {
    final response = await http.get(Uri.parse('${ApiConstants.getBanner}'));
    debugPrint('${response.body.toString()}');
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
  Future<AstrolistModel> getAstrologersList() async{
    try{
      final response = await http.post(Uri.parse(ApiConstants.getAstroList));
      if(response.statusCode == 200){
        final item = json.decode(response.body);
        debugPrint(item.toString());
        return AstrolistModel.fromJson(item);
      }else{
        throw Exception('Failed to load astrologersList');
      }
    }catch (e){
      print('Error Occurred'+e.toString());
    }
    return AstrolistModel();
  }

}