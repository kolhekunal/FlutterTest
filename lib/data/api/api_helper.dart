import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../Model/ProductListResponseModel.dart';
import '../../core/exceptions/custom_exception.dart';
import 'api_client.dart';

class ApiEndPoints {
  
  static const String BASE_URL =
      "http://205.134.254.135/~mobile/MtProject/public/api/";

  static const String API_KEY = "";


  static final String product_list = 'product_list.php';

}

abstract class ApiHelper {
  Future<Either<CustomException, ProductListResponseModel>> executeProductList(String page, String pageSize);
}
//Model Change

class ApiHelperImpl extends ApiHelper {
  ApiHelperImpl(this._api);

  final ApiClient _api;



  @override
  Future<Either<CustomException, ProductListResponseModel>> executeProductList(String page, String pageSize) async {
    try {
      var map = new Map<String, dynamic>();
      map['page'] = page;
      map['pageSize'] = pageSize;
      final response = await _api.post(ApiEndPoints.product_list, map);
      if (response['status'] == 200) {
        return Right(ProductListResponseModel.fromJson(response));
      }else if  (response['status'] == 404) {
        return Right(ProductListResponseModel.fromJson(response));
      } else {
        return Left(throw CustomException(
            404,
            response['error'] == null
                ? response['error']['message']
                : response['message'],
            "'"));
      }
    } on CustomException catch (e) {
      return Left(e);
    }
  }
}
