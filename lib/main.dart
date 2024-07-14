import 'package:bhagvatgita_departure/screens/home/provider/home_provider.dart';
import 'package:bhagvatgita_departure/utils/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main()
{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: HomeProvider()),

        ],child: Consumer<HomeProvider>(builder: (context, value, child) {
      value.getThemeData();

      value.theme = value.isTheme;
      value.isOn == value.theme;
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: app_routes,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: value.mode,
      );
    }),
    ),);
}