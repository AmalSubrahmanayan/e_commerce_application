// import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce/constants/api_endpoints.dart';
import 'package:e_commerce/constants/api_url.dart';
import 'package:e_commerce/model/home/category_model.dart';
import 'package:e_commerce/model/home/home_carousal.dart';
import 'package:e_commerce/model/home/prodect_model.dart';
import 'package:e_commerce/utils/app_exceptions.dart';
import 'package:e_commerce/utils/dio/interceptors.dart';

class HomeService {
  Future<List<CarousalModel>?> getCarousals() async {
    Dio dios = await Interceptorapi().getApiUser();
    try {
      final Response response = await dios.get(
        ApiUrl.apiUrl + ApiEndPoints.carousal,
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        // log(response.data.toString());
        final List<CarousalModel> carousals = (response.data as List)
            .map((e) => CarousalModel.fromJson(e))
            .toList();
        return carousals;
      } else {
        return null;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }

  Future<List<CategoryModel>?> getCategories() async {
    Dio dios = await Interceptorapi().getApiUser();
    try {
      final Response response =
          await dios.get(ApiUrl.apiUrl + ApiEndPoints.categories);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        final List<CategoryModel> categories = (response.data as List)
            .map((e) => CategoryModel.fromJson(e))
            .toList();
        return categories;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }

  Future<List<ProductModel>?> getProductsByCategory(String categoryId) async {
    Dio dios = await Interceptorapi().getApiUser();
    try {
      final Response response = await dios
          .get('${ApiUrl.apiUrl + ApiEndPoints.product}?category=$categoryId');
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        final List<ProductModel> products = (response.data as List)
            .map((e) => ProductModel.fromJson(e))
            .toList();
        return products;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }

  Future<List<ProductModel>?> getAllProducts() async {
    Dio dios = await Interceptorapi().getApiUser();
    try {
      final Response response =
          await dios.get(ApiUrl.apiUrl + ApiEndPoints.product);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
         List<ProductModel> products = (response.data as List)
            .map((e) => ProductModel.fromJson(e))
            .toList();
        // log("get all products${products.toString()}");
        return products;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }

  Future<ProductModel?> getAProduct(String productId) async {
    Dio dios = await Interceptorapi().getApiUser();
    try {
      final Response response =
          await dios.get('${ApiUrl.apiUrl + ApiEndPoints.product}/$productId');
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        final ProductModel product = ProductModel.fromJson(response.data);
        // log(product.id.toString());
        // log(response.toString());

        return product;
      }
    } catch (e) {
      // log(e.toString());
      AppExceptions.errorHandler(e);
    }
    return null;
  }
}
