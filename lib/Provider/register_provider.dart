import 'package:chatwithastrologer/Models/register_model.dart';
import 'package:chatwithastrologer/Services/services.dart';
import 'package:flutter/cupertino.dart';

import '../Utils/loading.dart';

class RegisterProvider with ChangeNotifier{
  late RegisterModel _registerModel;
  String mobile = '';
  String firstName = '';
  String lastName = '';
  String email = '';
  String gender = '';
  String image = '';
  String id = '';
  Services services = Services();
  bool loading = false;

  RegisterProvider(){
    _registerModel = RegisterModel();
  }
  RegisterModel get registerModel => _registerModel;
  registerUser(BuildContext context, String firstName, String lastName, String email, String gender, String mobile, String image, String id) async{
    loading = true;
    GlobalLoader.show(context, 'please wait..', false);
    notifyListeners();
    _registerModel = await services.registerUser(mobile, firstName, lastName, email, gender, image, id);
    loading = false;
    GlobalLoader.hide(context);
    notifyListeners();
  }
}