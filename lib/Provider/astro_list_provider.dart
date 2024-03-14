import 'package:chatwithastrologer/Models/astrolist_model.dart';
import 'package:flutter/cupertino.dart';
import '../Services/services.dart';

class AstroListProvider with ChangeNotifier{
  late AstrolistModel _astrolistModel;
  bool loading = false;
  String catId = '';
  Services services = Services();

  AstroListProvider(){
    _astrolistModel = AstrolistModel();
  }
  AstrolistModel get astrolistModel => _astrolistModel;

   getAstrolist() async{
     loading = true;
     notifyListeners();
     _astrolistModel = await services.getAstrologersList();
     loading = false;
     notifyListeners();
   }
}