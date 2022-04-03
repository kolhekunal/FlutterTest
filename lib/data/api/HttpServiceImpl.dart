import 'package:dio/dio.dart';
import 'package:getinforme/data/api/api_helper.dart';

import 'HttpService.dart';

class HttpServiceImpl implements HttpService{

  late Dio _dio;

  @override
  Future<Response> getRequest(String url) async{
    // TODO: implement getRequest

    Response response;
    try {
      response = await _dio.get(url);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }

  initializeInterceptors(){
    _dio.interceptors.add(InterceptorsWrapper(

    ));
  }

  @override
  void init() {
    _dio = Dio(BaseOptions(
        baseUrl: ApiEndPoints.BASE_URL,
        headers: {"Authorization" : "Bearer "}
    ));

    initializeInterceptors();
  }

}