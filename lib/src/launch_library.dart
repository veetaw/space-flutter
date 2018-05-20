import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'launch_event.dart';

class LaunchLibrary {
  LaunchLibrary();

  static const String API_URL = "https://launchlibrary.net/1.4/launch";

  Client client = Client();

  Future<List> getNextLaunches({int n: 50}) async {
    const String METHOD = "/next/";
    Response response = await client.get(API_URL + METHOD + n.toString());
    List data = JSON.decode(response.body)["launches"];
    return data.map((j) => LaunchEventModel.fromJson(j)).toList();
  }
}
