import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:e_commerce/constants/colors/app_colors.dart';
import 'package:e_commerce/utils/app_toast.dart';
import 'package:flutter/services.dart';

class AppExceptions {
  static void errorHandler(Object e) {
    if (e is SocketException) {
      AppToast.showToast('No Internet Connection', AppColors.redColor);
    } else if (e is TimeoutException) {
      AppToast.showToast('Connection Timedout', AppColors.redColor);
    } else if (e is MissingPluginException) {
      AppToast.showToast('Plugin error occured', AppColors.redColor);
    } else if (e is DioError) {
      if (e.response?.data['message'] != null) {
        AppToast.showToast(
            e.response!.data['message'].toString(), AppColors.redColor);
      } else if (e.error is SocketException) {
        AppToast.showToast('no Internet', AppColors.redColor);
      } else if (e.type == DioErrorType.connectTimeout) {
        AppToast.showToast('Connection timedout', AppColors.redColor);
      } else if (e.type == DioErrorType.receiveTimeout) {
        AppToast.showToast('Response timedout', AppColors.redColor);
      } else if (e.type == DioErrorType.cancel) {
        AppToast.showToast('Request cancelled', AppColors.redColor);
      } else if (e.type == DioErrorType.sendTimeout) {
        AppToast.showToast('Request timedout', AppColors.redColor);
      } else if (e.error is SocketException) {
        AppToast.showToast('No Internet Connection', AppColors.redColor);
      } else if (e.type == DioErrorType.other) {
        AppToast.showToast('Something went wrong', AppColors.redColor);
      }
    }
  }
}
