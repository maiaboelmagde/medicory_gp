
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<Map<String, dynamic>> getMap({required String url}) async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map<String, dynamic> responseList = jsonDecode(response.body);
      return responseList;
    } else {
      throw Exception(
          "There is an error with StatusCode ${response.statusCode} at Api().get(...)");
    }
  }

  Future<List<dynamic>> getList({required String url}) async {
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
     headers.addAll({'Content-Type': 'application/json'});
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response =
        await http.post(Uri.parse(url), body: json.encode(body), headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> responseList = jsonDecode(response.body);
      return responseList;
    } else {
      return
      throw Exception(
          "There is an error with StatusCode ${response.statusCode} at Api().post(...) while the body is ${response.body}");
    }
  }

  Future<String> postReturnString(
      {required String url,
      required Map<String, dynamic> body,
      @required token}) async {
    Map<String, String> headers = {};
    headers.addAll({'Content-Type': 'application/json'});
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
     
       http.Response  response = await http.post(Uri.parse(url),
        body: json.encode(body), headers: headers);
  
   

    if (response.statusCode == 201) {
      // String responseString = jsonDecode(response.body);
      return response.body;
    } else {
      throw Exception(
          "There is an error with StatusCode ${response.statusCode} at Api().post(...) while the body is ${body} and response is ${response.body}");
    }
  }

  Future<String> postReturnString200(
      {required String url,
      required Map<String, dynamic>? body,
      @required token}) async {
    Map<String, String> headers = {};
    headers.addAll({'Content-Type': 'application/json'});
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
     http.Response 
     
        response = await http.post(Uri.parse(url),
        body: json.encode(body), headers: headers);
   
   

    if (response.statusCode == 200) {
      // String responseString = jsonDecode(response.body);
      return response.body;
    } else {
      throw Exception(
          "There is an error with StatusCode ${response.statusCode} at Api().post(...) while the body is ${body} and response is ${response.body}");
    }
  }


  Future<String> postGetListReturnString(
      {required String url,
      required List<Map<String, dynamic>> body,
      @required token}) async {
    Map<String, String> headers = {};
    headers.addAll({'Content-Type': 'application/json'});
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.post(Uri.parse(url),
        body: json.encode(body), headers: headers);

    if (response.statusCode == 201) {
      // String responseString = jsonDecode(response.body);
      return response.body;
    } else {
      throw Exception(
          "There is an error with StatusCode ${response.statusCode} at Api().post(...) while the body is ${response.body}");
    }
  }

  Future<num> postReturnNum(
      {required String url,
      required Map<String, dynamic> body,
      @required token}) async {
    Map<String, String> headers = {};
    headers.addAll({'Content-Type': 'application/json'});
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.post(Uri.parse(url),
        body: json.encode(body), headers: headers);

    if (response.statusCode == 200) {
      num myresponse = jsonDecode(response.body);
      
      return myresponse;
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

  Future<String> putString(
      {required String url,
      required Map<String, dynamic> body,
      @required token}) async {
    Map<String, String> headers = {};
    headers.addAll({'Content-Type': 'application/json'});
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.put(Uri.parse(url),
        body: json.encode(body), headers: headers);

    if (response.statusCode == 202) {
      // String responseString = jsonDecode(response.body);
      return response.body;
    } else {
      throw Exception(
          "There is an error with StatusCode ${response.statusCode} at Api().post(...) while the body is ${response.body}");
    }
  }

  Future<String> deleteReturnString({required String url}) async {
    http.Response response = await http.delete(Uri.parse(url));

    if (response.statusCode == 202) {
      // String responseString = jsonDecode(response.body);
      return response.body;
    } else {
      throw Exception(
          "There is an error with StatusCode ${response.statusCode} at Api().post(...) while the body is ${response.body}");
    }
  }
}
