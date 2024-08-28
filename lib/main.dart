import 'package:crowd_funding_sample_app/binding/splashscreen_binding.dart';
import 'package:crowd_funding_sample_app/helper/database_path.dart';
import 'package:crowd_funding_sample_app/helper/hive_adapters.dart';
import 'package:crowd_funding_sample_app/helper/hive_openboxes.dart';
import 'package:crowd_funding_sample_app/route/app_route.dart';
import 'package:crowd_funding_sample_app/ui/main_page/chart_page.dart';
import 'package:crowd_funding_sample_app/ui/main_page/home_page.dart';
import 'package:crowd_funding_sample_app/ui/profile_pages/personal_info/personal_info_page.dart';
import 'package:crowd_funding_sample_app/ui/main_page/search_page.dart';
import 'package:crowd_funding_sample_app/ui/splashscreen/splash_screen_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitUp,
  ]);
  initHIVE();
  runApp(const MyApp());
}

Future<void> initHIVE() async {
  Hive.init(await databasePath);
  await HIVEAdapters().register();
  await HIVEOpenBoxes().open();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Crowd App Sample',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: AppRoute().getPages,
      initialRoute: SplashScreenPage.routeName,
      initialBinding: SplashscreenBinding(),
    );
  }
}
