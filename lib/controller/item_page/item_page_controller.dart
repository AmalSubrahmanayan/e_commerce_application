
import 'dart:developer';

import 'package:e_commerce/model/home/prodect_model.dart';
import 'package:e_commerce/service/home_service.dart';
import 'package:flutter/cupertino.dart';

import '../../routes/route_names.dart';

class ItemProvider with ChangeNotifier {
  // int selectedSizeIndex = 0;
  ItemProvider() {
    loadingPagae();
  }
  String? productSize;
  int? sizeChartIndex;
  bool loading = false;
  ProductModel? product;
  String? productId;


  void sizeSelect(int index) {
    sizeChartIndex = index;
    notifyListeners();
    productSize = product!.size![index].toString();
    notifyListeners();
  }

  void getAProduct(productId) async {
    loading = true;
    notifyListeners();
    await HomeService().getAProduct(productId!).then((value) {
      if (value != null) {
        sizeChartIndex = null;
        notifyListeners();
        product = value;
        notifyListeners();
        loading = false;
        notifyListeners();
      } else {
        loading = false;
        notifyListeners();
        null;
      }
    });
  }

  
  void goToCart(BuildContext context) {
    Navigator.of(context).pushNamed(RouteNames.cartScreen);
  }

  void toAddressScreen(context) {
    Navigator.of(context).pushNamed(RouteNames.addressScreen);
  }

  void sizeSelected(int index) {
    sizeChartIndex = index;
    notifyListeners();
    productSize = product!.size![index].toString();
    notifyListeners();
    log(productSize.toString());
  }

  void loadingPagae() {
    loading = false;
    notifyListeners();
  }

  // void setSizeIndex(int newValue) {
  //   selectedSizeIndex = newValue;
  //   notifyListeners();
  // }
}
