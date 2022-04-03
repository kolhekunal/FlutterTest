import 'dart:convert';

import '../../core/cache_client.dart';






abstract class CacheKeys {
  static final String token = 'token';
  //User Data
  static final String userInfo = 'userInfo';

  static final String isLogin = 'islogin';
  static final String profile = 'profile';
}

abstract class CacheHelper {
  Future<String> getAccessToken();

  Future saveAccessToken(String token);

  Future<String> getUserInfo();

  Future saveUserInfo(String userInfo);
  Future<String> isLogin();

  Future setLogin(String token);
  Future<String> getProfileData();

  Future saveProfileData(String userInfo);

}

class CacheHelperImpl extends CacheHelper {
  CacheHelperImpl(this._cache);

  final CacheClient _cache;



  @override
  Future<String> getProfileData() {
    return _cache.getString(CacheKeys.profile);
  }

  @override
  Future saveProfileData(String token) {
    return _cache.putString(CacheKeys.profile, token);
  }

  @override
  Future<String> isLogin() {
    return _cache.getString(CacheKeys.isLogin);
  }

  @override
  Future setLogin(String islogin) {
    return _cache.putString(CacheKeys.isLogin, islogin);
  }
  @override
  Future<String> getAccessToken() {
    return _cache.getString(CacheKeys.token);
  }

  @override
  Future<String> getUserInfo() {
    return _cache.getString(CacheKeys.userInfo);
  }

  @override
  Future saveAccessToken(String token) {
    return _cache.putString(CacheKeys.token, token);
  }

  @override
  Future saveUserInfo(String userInfo) {

    return _cache.putString(CacheKeys.userInfo, userInfo);
  }

  // static Future<void> setFlowSubscriptionPref(SubscriptionAdd subData) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String subJson = jsonEncode(subData);
  //   await prefs.setString(sharePreferenceSubscriptionKey, subJson);
  // }

  // static Future<SubscriptionAdd?> getFlowSubscriptionPref() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? subscription =
  //       prefs.getString(sharePreferenceSubscriptionKey) ?? null;
  //   if (subscription == null || subscription == "null") {
  //     return null;
  //   } else {
  //     return SubscriptionAdd.fromJson(jsonDecode(subscription));
  //   }
  // }


}
