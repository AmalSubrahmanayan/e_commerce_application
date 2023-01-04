import 'dart:developer';

import 'package:e_commerce/model/home/category_model.dart';
import 'package:e_commerce/model/home/home_carousal.dart';
import 'package:e_commerce/model/home/prodect_model.dart';
import 'package:e_commerce/routes/route_names.dart';
import 'package:e_commerce/service/home_service.dart';
import 'package:e_commerce/view/item_page/widgets/utils/item_id_model.dart';
import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider() {
    functions();
  }

  final TextEditingController controller = TextEditingController();
  List<CarousalModel> carousalList = [];
  List<CategoryModel> categoryList = [];
  List<ProductModel> productList = [];
  bool loading = false;

  void functions() {
    getCarousals();
    getCategories();
    getAllProducts();
  }

  void toProductScreen(context, productId) {
    final args = ProductIdModel(productId: productId);
    Navigator.of(context).pushNamed(
      RouteNames.itemPage,
      arguments: args,
    );
  }

  void getCarousals() async {
    loading = true;
    notifyListeners();
    await HomeService().getCarousals().then((value) {
      if (value != null) {
        carousalList = value;
        loading = false;
        notifyListeners();
      } else {
        loading = false;
        notifyListeners();
      }
    });
  }

  void getCategories() async {
    loading = true;
    notifyListeners();
    await HomeService().getCategories().then((value) {
      if (value != null) {
        categoryList = value;
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

  void getAllProducts() async {
    log("product in");
    loading = true;
    notifyListeners();
    await HomeService().getAllProducts().then((value) {
      if (value != null) {
        log('products not null');
        productList = value;
        notifyListeners();
        loading = false;
        notifyListeners();
      } else {
        log('products null');
        loading = false;
        notifyListeners();
      }
    });
  }

  void getProductsByCategory(String idCategory) async {
    loading = true;
    notifyListeners();
    await HomeService().getProductsByCategory(idCategory).then((value) {
      if (value != null) {
        productList = value;
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
}
