import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task_02/Key/api_key.dart';
import 'package:task_02/models/data_model.dart';

class ApiManager {
  Future<Facebook> getData() async {
    var client = http.Client();
    // ignore: prefer_typing_uninitialized_variables
    var dataModel;
    http.Response response;

    try {
      response = await http.get(ApiUrl.url);
      // ignore: unrelated_type_equality_checks
      if (response.statusCode == 200) {
        var jsonSring = response.body;
        var jsonMap = json.decode(jsonSring);
        dataModel = Facebook.fromJson(jsonMap);
        // dataModel.dataInfo.forEach((element) {
        //   print(element.title);
        // });
      }
    } catch (Exception) {
      print(Exception);
      print("object");
    }
    return dataModel;
  }
}
