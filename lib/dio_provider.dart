import 'dart:convert';

import 'package:dio/dio.dart';

class DioProvider {
  String baseUrl =
      'https://apidojo-yahoo-finance-v1.p.rapidapi.com/auto-complete';
//-------Get--------------------
  Future<dynamic> get(String api) async {
    // ignore: no_leading_underscores_for_local_identifiers
    var _dio = baseUrl + api;

    // ignore: no_leading_underscores_for_local_identifiers
    var headers = {
      'X-RapidAPI-Key': 'SIGN-UP-FOR-KEY',
      'X-RapidAPI-Host': 'apidojo-yahoo-finance-v1.p.rapidapi.com'
    };

    var resposnse = await Dio().get(_dio, queryParameters: headers);
    if (resposnse.statusCode == 200) {
      return resposnse.headers;
    } else {
      //throw exepection and catch it in UI
      throw Exception('Failed to load user details');
    }
  }

  //----------update-----------
  Future<dynamic> put(String api, dynamic object) async {
    var url = baseUrl + api;
    // ignore: no_leading_underscores_for_local_identifiers
    var _loading = json.encode(object);
    // ignore: no_leading_underscores_for_local_identifiers
    var _headers = {
      "Authorization": 'Bearer sfie328370428387=',
      'Content-Type': 'application/json',
      'api_key': 'ief873fj38uf38uf83u839898989',
    };

    var resposnse =
        await Dio().put(url, data: _loading, queryParameters: _headers);
    if (resposnse.statusCode == 201) {
      return resposnse.extra;
    } else {
      //throw exepection and catch it in UI
      throw Exception('Failed to load user details');
    }
  }

  Future<dynamic> post(String api, dynamic object) async {
    var url = baseUrl + api;
    var _payload = json.encode(object);
    var _data = {
      'Authorization': 'Bearer sfie328370428387=',
      'Content-Type': 'application/json',
      'api_key': 'ief873fj38uf38uf83u839898989',
    };

    var response = await Dio().post(url, queryParameters: _data);
    if (response.statusCode == 201) {
      return response.data;
    } else {
      //throw exception and catch it in UI
    }
  }

  Future<dynamic> delete(String api) async {
    var url = Uri.parse(baseUrl + api);

    var resposnse = await Dio().delete(baseUrl);
    if (resposnse.statusCode == 200) {
      return resposnse.data;
    } else {
      //throw exepection and catch it in UI
      throw Exception('Failed to load user details');
    }
  }
}
