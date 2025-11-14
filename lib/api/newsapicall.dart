import 'dart:convert' as convert;

import 'package:demopcps/core/static.dart';
import 'package:demopcps/model/newsapimodel.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;



class newsapicall{
  //https://newsapi.org/v2/everything
  // ?q=tesla&from=2025-09-28
  // &sortBy=publishedAt&apiKey=a25a0c0b883c4f389ff5c23da0f9dfea
  Future<newsapi?>? getnewsapidata() async {
    try{
      var url = Uri.https(staticfile.baseurl,
          staticfile.path,
          {'q': 'tesla', 'from': "2025-10-29", "apiKey": staticfile.apikey});
      var response = await http.get(url);
      if (response.statusCode.toString().contains("20")) {
        var jsonResponse = convert.jsonDecode(response.body);
        var data = newsapi.fromJson(jsonResponse);
        return data;
      } else {
       return null;
      }
    }catch(e){
       if (kDebugMode) {
         print(e.toString());
       }
       return null;
        }
  }
}