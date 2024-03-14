import 'package:chatwithastrologer/Services/services.dart';
import 'package:flutter/material.dart';

import '../Models/banner_model.dart';

class BannerProvider with ChangeNotifier {
  List<Data>? _banners;
  final Services apiService = Services();
  bool loading = false;

  List<Data>? get banners => _banners;

  set banners(List<Data>? value) {
    _banners = value;
    notifyListeners();
  }

  Future<void> getBanner() async {
    loading = true;
    /*notifyListeners();*/
    try {
      final Map<String, dynamic> responseData = await apiService.fetchData();
      final BannerModel bannerModel = BannerModel.fromJson(responseData);
      banners = bannerModel.data;
    } catch (error) {
      print('Error Occurred: $error');
      throw Exception('Failed to load banners');
    }
    loading = false;
    notifyListeners();
  }
}
