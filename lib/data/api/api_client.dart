import 'dart:convert';

import 'package:getinforme/data/api/api_helper.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';


class ApiClient {

  dynamic get(String path) async {
    print('${ApiEndPoints.BASE_URL}$path');
    final response = await http.get(
      Uri.parse(ApiEndPoints.BASE_URL+path),
      headers: {
        'Authorization': 'Basic cmVzdFVzZXI6ckVzdEAjMjAyMg==',
      },
    );
    print('path >>>>>>>>>>' + path);
    print('response >>>>>>>>>>' + response.body.toString());
    if (response.statusCode == 200||response.statusCode == 400||response.statusCode == 500) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }


  dynamic post(String path, Map<String, dynamic> map) async {
    // if (await _connectivity.check()) {
    print('API_>>>>${ApiEndPoints.BASE_URL}$path');
    print('body>>>>>>DATA' + map.toString());
    final response = await http.post(Uri.parse(ApiEndPoints.BASE_URL+path),
        headers: {
          'Authorization': 'Basic cmVzdFVzZXI6ckVzdEAjMjAyMg==',
        },
        body : map);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print(response.body);
      return json.decode(response.body);
    }

  }
  dynamic put(String path,  Map<String, dynamic> body,
      ) async {
    print('${ApiEndPoints.BASE_URL}$path');
    print('body' + body.toString());
    final response = await http.put(Uri.parse(ApiEndPoints.BASE_URL+path),
        headers: {
          'Content-Type': 'application/json',

        },
        body: json.encode(body));
    print('response >>>>>>>>>>' + response.body.toString());
    if (response.statusCode == 200||response.statusCode == 400) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  dynamic delete(String path) async {
    print(
      path,
    );
    final response = await http.delete(
      Uri.parse(ApiEndPoints.BASE_URL+path),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    print('path >>>>>>>>>>' + path);
    print('response >>>>>>>>>>' + response.body.toString());
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

}

class NetworkException implements Exception {
  final String message;
  NetworkException({this.message = 'Network error occurred. '});
}
