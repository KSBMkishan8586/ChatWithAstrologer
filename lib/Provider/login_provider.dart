/*
* @Author : Kishan kumar
* Email : ksbmkishan123@gmail.com
* Function : Login Provider class
* Created Date : 11 March 2024
* */
import 'package:chatwithastrologer/Models/login_model.dart';
import 'package:chatwithastrologer/Services/services.dart';
import 'package:chatwithastrologer/Utils/loading.dart';
import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier{
  late LoginModel _loginModel;
  bool loading = false;
  String mobileNumber = '';
  Services services = Services();

  LoginProvider(){
    _loginModel = LoginModel();
  }
  LoginModel get loginModel => _loginModel;
  doLogin(String mobilenNumber, BuildContext context) async{
    loading = true;
    GlobalLoader.show(context, 'please wait..', false);
    notifyListeners();
    _loginModel = await services.doLogin(mobilenNumber);
    loading = false;
    GlobalLoader.hide(context);
    notifyListeners();
  }
}