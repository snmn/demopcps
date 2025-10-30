import 'package:demopcps/model/newsapimodel.dart';

class staticfile{
  //https://newsapi.org/v2/everything
  // ?q=tesla&from=2025-09-28
  // &sortBy=publishedAt&apiKey=a25a0c0b883c4f389ff5c23da0f9dfea
  //endpoint baseurl
  static String baseurl = "newsapi.org";
  //path
  static String path = "v2/everything";
  //apikey
  static String apikey = "a25a0c0b883c4f389ff5c23da0f9dfea";
  static Articles? clickedarticle ;

}