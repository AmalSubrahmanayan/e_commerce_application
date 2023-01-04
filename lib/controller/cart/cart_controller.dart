
import 'dart:developer';

import 'package:e_commerce/constants/colors/app_colors.dart';
import 'package:e_commerce/model/cart/add_cart.dart';
import 'package:e_commerce/model/cart/get_from_cart.dart';
import 'package:e_commerce/routes/route_names.dart';
import 'package:e_commerce/service/cart_service.dart';
import 'package:e_commerce/utils/app_toast.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  CartProvider() {
    getCartItems();
  }
  GetFromCartModel? cartList;
  bool loading = false;
    bool loading1 = false;
  bool countLoading = false;
  int quantity = 1;
  List<String> cartItemsId = [];
  int? totalSave;

  void getCartItems() async {
    log('get c');
    loading = true;
    notifyListeners();
    await CartService().getCartItems().then((value) {
      log("get await");
      if (value != null) {
        log('item');
        cartList = value;
        notifyListeners();
        cartItemsId = cartList!.products.map((e) => e.product.id).toList();
        notifyListeners();
        totalSave =
            cartList!.totalDiscount.toInt() - cartList!.totalPrice.toInt();
        notifyListeners();
        loading = false;
        notifyListeners();
      } else {
        log("item null");
        loading = false;
        notifyListeners();
      }
    });
  }

  void addToCart(String productId, String? productSize) async {
    // log(productSize.toString());
    if (productSize == null) {
      AppToast.showToast('Select size', AppColors.redColor);
    } else {
      final AddToCartModel model = AddToCartModel(
        productId: productId,
        quantity: quantity,
        size: productSize.toString(),
      );
      // log(model.toString());
      await CartService().addToCart(model).then((value) {
        if (value != null) {
          getCartItems();
          notifyListeners();
          if (value == 'product added to cart successfully') {
            AppToast.showToast(
              'Product added to cart',
              AppColors.greenColor,
            );
          } else {
            null;
          }
        } else {
          null;
        }
      });
    }
  }

 void removeFromCart(String productId) async {
  log("controller try");
    loading = true;
    notifyListeners();
    await CartService().removeFromCart(productId).then((value) {
      log("c");
      if (value != null) {
        log("value not null");
        getCartItems();
        AppToast.showToast('Item removed from cart', AppColors.greenColor);
        loading = false;
        notifyListeners();
      } else {
        log("value null");
        loading = false;
        notifyListeners();
      }
    });
  }

  void incrementOrDecrementQuantity(int qty, String productId,
      String productSize, int productquantity) async {
    // log(productquantity.toString());
    final AddToCartModel model = AddToCartModel(
      productId: productId,
      quantity: qty,
      size: productSize.toString(),
    );
    if (qty == 1 && productquantity >= 1 || qty == -1 && productquantity > 1) {
      await CartService().addToCart(model).then((value) async {
        if (value != null) {
          await CartService().getCartItems().then((value) {
            if (value != null) {
              cartList = value;
              notifyListeners();
              cartItemsId =
                  cartList!.products.map((e) => e.product.id).toList();
              notifyListeners();
              totalSave = cartList!.totalDiscount.toInt() -
                  cartList!.totalPrice.toInt();
              notifyListeners();
            } else {
              null;
            }
          });
        } else {
          null;
        }
      });
    } else {
      null;
    }
  }

  void toAddressScreen(context) {
    Navigator.of(context).pushNamed(RouteNames.addressScreen);
  }
}
