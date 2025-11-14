 import 'package:demopcps/views/chatapp/Chats.dart';
import 'package:demopcps/views/chatapp/conversations.dart';
import 'package:demopcps/views/demoapp/loginpage.dart';
import 'package:demopcps/views/esewatest/esewa.dart';
import 'package:demopcps/views/maps/mapspage.dart';
import 'package:demopcps/views/news/dashboard.dart';
import 'package:demopcps/views/news/detailpage.dart';

class AppRoute{
  AppRoute._();
  static const String loginpageroute = '/login';
  static const String dashboardPageroute = '/dashboardpage';
  static const String detailpageroute = '/detailpage';
  static const String mapspage = '/mapspage';
  static const String esewa = '/esewa';
  static const String chatpage = '/chatpage';
  static const String conversationpage = '/conversation';

  static getAppRoutes()=>{
    loginpageroute: (context) => loginpage(),
    dashboardPageroute: (context) => const dashboard(),
    detailpageroute: (context) =>  const detailpage(),
    mapspage: (context) => const MapsPage(),
    esewa : (context) => const EsewaApp(title: "PCPS"),
    chatpage: (context) => const Chats(),
    conversationpage: (context) => const Conversations()

  };






 }