import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce/constants/api_endpoints.dart';
import 'package:e_commerce/model/cart/add_cart.dart';
import 'package:e_commerce/model/cart/get_from_cart.dart';
import 'package:e_commerce/utils/app_exceptions.dart';
import 'package:e_commerce/utils/dio/interceptors.dart';

import '../constants/api_url.dart';

class CartService {
  Future<GetFromCartModel?> getCartItems() async {
    Dio dios = await Interceptorapi().getApiUser();
    try {
      log("try");
      final Response response =
          await dios.get(ApiUrl.apiUrl + ApiEndPoints.cart);

      if (response.statusCode == 200) {
        log("ok 200");
        log(response.data.toString());
        final GetFromCartModel model = GetFromCartModel.fromJson(response.data);
        log(model.toString());

        return model;
      }
    } catch (e) {
      log("catch");
      AppExceptions.errorHandler(e);
    }
    return null;
  }

  Future<String?> addToCart(AddToCartModel model) async {
    log("addToCart");
    Dio dios = await Interceptorapi().getApiUser();

    try {
      log("addToCart try");
      final Response response = await dios.post(
          ApiUrl.apiUrl + ApiEndPoints.cart,
          data: jsonEncode(model.toJson()));
      if (response.statusCode == 201) {
       log("status");
        final String resp = response.data['message'];
        return resp;
      }
    } catch (e) {
      log("addToCart catch");
      AppExceptions.errorHandler(e);
    }
    log("addToCart null");
    return null;
  }

  Future<String?> removeFromCart(String productId) async {
    log('removeFromCart');
    Dio dios = await Interceptorapi().getApiUser();
    try {
      log("removeFromCart try");
      final Response response = await dios.patch(
        ApiUrl.apiUrl + ApiEndPoints.cart,
        data: {'product': productId},
      );
      log(response.statusCode.toString());
      if (response.statusCode == 201) {
        log("200");
        final String resp = response.data['message'];
        return resp;
      }
    } catch (e) {
      log("removeFromCart catch");
      AppExceptions.errorHandler(e);
    }
    return null;
  }
}
