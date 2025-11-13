import 'package:demopcps/views/chatapp/Chats.dart';
import 'package:demopcps/views/chatapp/conversations.dart';
import 'package:demopcps/views/demoapp/loginpage.dart';
import 'package:demopcps/views/esewatest/esewa.dart';
import 'package:demopcps/views/maps/mapspage.dart';
import 'package:demopcps/views/news/dashboard.dart';
import 'package:demopcps/views/news/detailpage.dart';
import 'package:demopcps/views/webview/webview.dart';

class AppRoute{

  AppRoute._();
  static const String loginroute = '/';
  static const String dashboardroute = '/dashboard';
  static  const String detailPage = '/detailPage';
  static const String conversation = '/conversation';
  static const String chats = '/chats';
  static const String esewa = '/esewa';
  static const String maps = '/maps';
  static const String webview = '/webview';
  static getAppRoutes()=>{
    loginroute: (context) =>  loginpage(),
    dashboardroute: (context) =>  const dashboard(),
    detailPage: (context) => const detailpage(),
    conversation: (context) => const Conversations(),
    chats: (context) => const Chats(),
    esewa: (context) => const EsewaApp(title: "PCPS"),
    maps: (context) => const MapsPage(),
    webview: (context) => const WebViewPage(),

  };
}