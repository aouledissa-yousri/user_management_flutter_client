import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';

import '../dialogs/InfoDialog.dart';
import '../dialogs/LoadingDialog.dart';
import '../models/User.dart';
import "package:http/http.dart" as Http;

const URL = "http://localhost:8000";

void addDefaultHeaders(HttpClientRequest request){
  request.headers.add(
    "content-type", "application/json",
  );

  request.headers.add(
    "connection", "keep-alive"
  );
}

Map<String, dynamic> getResponseBody(Http.Response response){
  return json.decode(response.body);
}

class ApiService {
  static LoadingDialog loadingBox = new LoadingDialog();
  static InfoDialog infoBox = new InfoDialog();

  static Future<Map<String, dynamic>> signUp(User user, BuildContext context) async{
    loadingBox.loading(context);
    
    var response = await Http.post(
      Uri.parse(URL+"/manageUser/signUp/"), 
      body: json.encode(user.getData())
    );

    await loadingBox.hideLoading(context);
    infoBox.showInfoDIalog(context, getResponseBody(await response)["signed up"], "Alert!!");
    
    return getResponseBody(await response);

  }

}