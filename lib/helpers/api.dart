import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<List<dynamic>> get({required String url}) async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> responseList = jsonDecode(response.body);
      return responseList;
    } else {
      throw Exception(
          "There is an error with StatusCode ${response.statusCode} at Api().get(...)");
    }
  }

  Future<Map<String, dynamic>> post(
      {required String url,
      required Map<String, dynamic> body,
      @required token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response =
        await http.post(Uri.parse(url), body: body, headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> responseList = jsonDecode(response.body);
      return responseList;
    } else {
      throw Exception(
          "There is an error with StatusCode ${response.statusCode} at Api().post(...) while the body is ${response.body}");
    }
  }

  Future<Map<String, dynamic>> put(
      {required String url,
      required Map<String, dynamic> body,
      @required token}) async {
    Map<String, String> headers = {};
    headers.addAll({'Content-Type': 'Content-Type'});
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response =
        await http.put(Uri.parse(url), body: body, headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> responseList = jsonDecode(response.body);
      return responseList;
    } else {
      throw Exception(
          "There is an error with StatusCode ${response.statusCode} at Api().post(...) while the body is ${response.body}");
    }
  }
}
