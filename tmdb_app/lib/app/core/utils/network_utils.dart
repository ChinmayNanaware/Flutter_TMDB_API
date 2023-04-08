import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tmdb_app/app/core/constants/string_constants.dart';
import 'package:tmdb_app/app/core/models/movies_response_model.dart';

class NetworkUtils {
  // Future<http.Response> requestCallbackApi(Map bodyData) async {
  //   var requestURL = Uri.parse(EndPoints.registerCallbackURL);
  //   var requestBody = json.encode(bodyData);
  //   var requestHeader = {
  //     HttpHeaders.contentTypeHeader: RequestHeaderConstants.requestHeaderString
  //   };

  //   var response = await http.post(
  //     requestURL,
  //     body: requestBody,
  //     headers: requestHeader,
  //   );

  //   return response;
  // }

  // Future<http.Response> attemptSignUp(Map bodyData, String url) async {
  //   var requestURL = Uri.parse(url);
  //   var requestBody = json.encode(bodyData);
  //   var requestHeader = {
  //     HttpHeaders.contentTypeHeader: RequestHeaderConstants.requestHeaderString
  //   };

  //   var response = await http.post(
  //     requestURL,
  //     body: requestBody,
  //     headers: requestHeader,
  //   );

  //   return response;
  // }

  Future<MoviesResponseModel> getResults(String endpoint) async {
    var requestURL = Uri.parse(endpoint);
    // var requestHeader = {
    //   HttpHeaders.authorizationHeader: 'Bearer $token',
    //   HttpHeaders.contentTypeHeader: RequestHeaderConstants.requestHeaderString
    // };

    var response = await http.get(
      requestURL,
    );
    final responseJson = json.decode(response.body);
    return MoviesResponseModel.fromJson(responseJson);
  }
}
