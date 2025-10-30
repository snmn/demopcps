import 'package:demopcps/core/static.dart';
import 'package:http/http.dart' as http;
import '../model/newsapi.dart';
import 'dart:convert' as convert;

class newsApiCall{

  Future<Newsapi?>? getapicall() async {
    try{
      var url =
      Uri.https(StaticValue.baseurl,
          StaticValue.path,
          {'q': 'tesla',
          'from': '2025-10-29',
          'sortBy': 'publishedAt',
          'apiKey': StaticValue.apikey});
      var response = await http.get(url);
      if (response.statusCode.toString().contains("20")) {
        var jsonResponse = convert.jsonDecode(response.body);
        var data = Newsapi.fromJson(jsonResponse);
        return data;
      } else {
        return null;
      }
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}