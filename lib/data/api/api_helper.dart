import 'package:dartz/dartz.dart';
import 'package:getinforme/Model/SettingModel.dart';
import 'package:getinforme/Model/VillageModel.dart';
import 'package:getinforme/data/api/api_client.dart';



import '../../Model/DistrictModel.dart';



import '../../Model/LanguageList.dart';

import '../../Model/LoginModel.dart';
import '../../Model/MandalModel.dart';


import '../../Model/SignupModel.dart';


import '../../core/exceptions/custom_exception.dart';

class ApiEndPoints {

  static const String BASE_URL =
      "http://sanproinfotech.com/projects/informee/rest_apis/ApiController/";

  static const String API_KEY = "";

  //GetInfoUrl
  static final String setting = 'settings';
  static final String signupUrl = 'user_signup';
  static final String loginUrl = 'user_login';
  static final String getDistrictUrl = 'district';
  static final String getMandalUrl = 'mandal';
  static final String getVillageUrl = 'village';
}

abstract class ApiHelper {
  Future<Either<CustomException, LoginModel>> executeLogin(
      String mobile, String password);

  Future<Either<CustomException, SignupModel>> executeSignup(
      String name,
      String mobile,
      String password,
      String confirmPassword,
      var district,
      var mandal,
      var village);



  Future<Either<CustomException, DistrictModel>> getDistrictList();

  Future<Either<CustomException, MandalModel>> getMandalList(String districtID);

  Future<Either<CustomException, VillageModel>> getVillageList(
      String districtID, String mandalID);

  Future<Either<CustomException, Language>> executeLanguages();

  Future<Either<CustomException, SettingModel>> getSetting();


}
//Model Change

class ApiHelperImpl extends ApiHelper {
  ApiHelperImpl(this._api);

  final ApiClient _api;

  @override
  Future<Either<CustomException, SettingModel>> getSetting() async {
    try {
      final response = await _api.get(ApiEndPoints.setting);
      if (response['status'] == 200) {
        return Right(SettingModel.fromJson(response));
      } else {
        return Left(throw CustomException(
            200,
            response['error'] == null
                ? response['error']['message']
                : response['message'],
            "'"));
      }
    } on CustomException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<CustomException, DistrictModel>> getDistrictList() async {
    try {
      final response = await _api.get(ApiEndPoints.getDistrictUrl);
      if (response['status'] == 200) {
        return Right(DistrictModel.fromJson(response));
      } else {
        return Left(throw CustomException(
            200,
            response['error'] == null
                ? response['error']['message']
                : response['message'],
            "'"));
      }
    } on CustomException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<CustomException, MandalModel>> getMandalList(
      String districtID) async {
    try {
      final response =
          await _api.get(ApiEndPoints.getMandalUrl + "/" + districtID);
      if (response['status'] == 200) {
        return Right(MandalModel.fromJson(response));
      } else {
        return Left(throw CustomException(
            200,
            response['error'] == null
                ? response['error']['message']
                : response['message'],
            "'"));
      }
    } on CustomException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<CustomException, VillageModel>> getVillageList(
      String districtID, String mandalID) async {
    try {
      final response = await _api
          .get(ApiEndPoints.getVillageUrl + "/" + districtID + "/" + mandalID);
      if (response['status'] == 200) {
        return Right(VillageModel.fromJson(response));
      } else {
        return Left(throw CustomException(
            200,
            response['error'] == null
                ? response['error']['message']
                : response['message'],
            "'"));
      }
    } on CustomException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<CustomException, SignupModel>> executeSignup(
      String nameTxt,
      String mobileTxt,
      String passwordTxt,
      String confirmPasswordTxt,
      var districtTxt,
      var mandalTxt,
      var villageTxt) async {
    try {
      var map = new Map<String, dynamic>();
      map['name'] = nameTxt;
      map['mobile'] = mobileTxt;
      map['password'] = passwordTxt;
      map['confirm_password'] = confirmPasswordTxt;
      map['district'] = districtTxt;
      map['mandal'] = mandalTxt;
      map['village'] = villageTxt;

      final response = await _api.post(ApiEndPoints.signupUrl, map);
      if (response['status'] == 200) {
        print('mobilesuccess>>' + mobileTxt);
        return Right(SignupModel.fromJson(response));
      } else {
        print('mobilesuccess ffff>>' + mobileTxt);
        print('>>>>> msg>>' + response['msg']);
        return Left(throw CustomException(200,
            response['msg'] != null ? response['msg'] : 'Invalid request', ""));
      }
    } on CustomException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<CustomException, LoginModel>> executeLogin(
      String mobile, String password) async {
    print('mobile>>' + mobile);
    try {
      var map = new Map<String, dynamic>();
      map['username'] = mobile;
      map['password'] = password;

      final response = await _api.post(ApiEndPoints.loginUrl, map);
      if (response['status'] == 200) {
        print('mobilesuccess>>' + mobile);
        return Right(LoginModel.fromJson(response));
      } else {
        print('mobilesuccess ffff>>' + mobile);
        return Left(throw CustomException(
            response['status'],
            response['msg'] != null ? response['msg'] : 'Invalid request',
            "'"));
      }
    } on CustomException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<CustomException, Language>> executeLanguages() {
    // TODO: implement executeLanguages
    throw UnimplementedError();
  }

}
