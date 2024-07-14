import 'package:bhagvatgita_departure/screens/detail/view/detail_screen.dart';
import 'package:bhagvatgita_departure/screens/home/view/home_screen.dart';
import 'package:bhagvatgita_departure/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

Map<String,WidgetBuilder> app_routes =
{
  "/" : (c1) => const SplashScreen(),
  "home" : (c1) => const HomeScreen(),
  "detail" : (c1) => const DetailScreen(),
};