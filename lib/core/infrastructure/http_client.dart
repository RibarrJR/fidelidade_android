import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class HttpClient {
  static Future<Map<String, dynamic>> getListAsync(String path,
      {required Map<String, String> headers, int timeout = 20}) async {
    var _client = http.Client();

    var myUri = Uri.parse(path);

    headers[HttpHeaders.contentTypeHeader] = "application/json";
    headers[HttpHeaders.acceptHeader] = "application/json";

    try {
      final response = await _client.get(myUri, headers: headers).timeout(
            Duration(seconds: timeout),
          );
      var list = _getResult(
        response: response,
        path: path,
      );

      Map<String, dynamic> json = {
        'ObjectList': list,
      };

      return json;
    } catch (e) {
      throw (e);
    }
  }

  static Future<Map<String, dynamic>> getAsync(String path,
      {required Map<String, String> headers, int timeout = 20}) async {
    var _client = http.Client();

    var myUri = Uri.parse(path);

    headers[HttpHeaders.contentTypeHeader] = "application/json";
    headers[HttpHeaders.acceptHeader] = "application/json";

    try {
      final response = await _client.get(myUri, headers: headers).timeout(
            Duration(seconds: timeout),
          );

      return _getResult(
        response: response,
        path: path,
      );
    } catch (e) {
      throw (e);
    }
  }

  static _getResult({required response, path}) {
    print("url: $path status: ${response.statusCode}");

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      print(data);

      return data;
    } else {
      throw ("fetch_error url: $path status: ${response.statusCode}");
    }
  }

  static Future<http.Response> postAsync(String path,
      {required Map<String, String> headers,
      int timeout = 20,
      required Map<String, dynamic> requestBody}) async {
    var _client = http.Client();

    var myUri = Uri.parse(path);

    headers[HttpHeaders.contentTypeHeader] = "application/json; charset=UTF-8";
    headers[HttpHeaders.acceptHeader] = "application/json";

    try {
      final response = await _client
          .post(myUri, headers: headers, body: jsonEncode(requestBody))
          .timeout(
            Duration(seconds: timeout),
          );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
