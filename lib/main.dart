import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scraper_wallpaper_app/modals/my_routes.dart';
import 'package:sky_scraper_wallpaper_app/views/scrrens/home_page.dart';
import 'package:sky_scraper_wallpaper_app/views/scrrens/splash_screen.dart';
import 'package:sky_scraper_wallpaper_app/views/scrrens/wallpaper_detail_page.dart';

import 'controllers/api_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ApiControllers(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.splash_Screen,
      routes: {
        MyRoutes.HomePage: (context) => HomePage(),
        MyRoutes.WallPaperDetailedPage: (context) => WallPaperDetailedPage(),
        MyRoutes.splash_Screen: (context) => splash_Screen(),
      },
    );
  }
}
