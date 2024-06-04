import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:project3/core/class/statusrequest.dart';

class Crud {
  Future<Either<StatusRequest, List>> getRequest(String url, Map data) async {
    try {
      var response = await http.get(
        Uri.parse(url),
      );
      print("$response.................crud");
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.statusCode);
        print("$response ..................................1");
        var responsebody = jsonDecode(response.body);
        print("$response ....................................2");

        return Right(responsebody);
      } else {
        print("$response............crud ");
        return const Left(StatusRequest.serverfailure);
      }
      // else {
      //   return const Left(StatusRequest.offlinefailure);
      // }
    } catch (_) {
      return const Left(StatusRequest.serverfailure);
    }
  }

  ///////////////////////////////////////////////////////////////////////////////
  Future<Either<StatusRequest, Map>> postData(String url, Map body) async {
    try {
      var response = await http.post(
        Uri.parse(url),
        body: body,
      );
      print("$response.................crudtripssssssss");
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.statusCode);
        print("$response ..................................1");
        var responsebody = jsonDecode(response.body);
        print("$response ....................................2");

        return Right(responsebody);
      } else {
        print("$response............crud ");
        return const Left(StatusRequest.serverfailure);
      }
      // else {
      //   return const Left(StatusRequest.offlinefailure);
      // }
    } catch (_) {
      return const Left(StatusRequest.serverfailure);
    }
  }

  // Future<Either<StatusRequest, List>> postData(String linkurl, Map data) async {
  //   try {
  //     //  if (await chackInternet()) {
  //     var response = await http.post(Uri.parse(linkurl));
  //     print("$response.................crud");
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       print("crud.......................");
  //       print(response);
  //       Map responsebody = jsonDecode(response.body);
  //       print(response);
  //       return Right(responsebody as List);
  //     } else {
  //       print("$response............crud ");
  //       return const Left(StatusRequest.serverfailure);
  //     }
  //     // else {
  //     //   return const Left(StatusRequest.offlinefailure);
  //     // }
  //   } catch (_) {
  //     return const Left(StatusRequest.serverfailure);
  //   }
  // }

  // Future<dynamic> post(
  //     {required String url,
  //     required Map<String, dynamic> body,
  //     dynamic token}) async {
  //   Map<String, String> header = {};
  //   if (token != null) {
  //     header.addAll({'Authorization': "Bearer$token"});
  //     print("$token");
  //   }
  //   http.Response response =
  //       await http.post(Uri.parse(url), body: body, headers: header);
  //
  //   if (response.statusCode == 201 || response.statusCode == 200) {
  //     dynamic data = jsonDecode(response.body);
  //
  //     return data;
  //   } else {
  //     print(".....${response.statusCode}");
  //   }
  // }
}
