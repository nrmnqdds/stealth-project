import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stealth/configurations/app_router.dart';
import 'package:stealth/utils/stealth_utils.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();

  HttpOverrides.global = MyHttpOverrides();

  // initialize app local database
  await Hive.initFlutter();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: stealthAppRouter,
      scaffoldMessengerKey: StealthUtils.scaffoldMessengerKey,
      title: 'MUIS App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        splashFactory: InkSparkle.splashFactory,
        //colorScheme: ColorScheme.fromSeed(seedColor: MuisTheme.primaryColor),
        useMaterial3: true,
        //fontFamily: 'Satoshi',
        fontFamily: 'Inter',
      ),
    );
  }
}

/// To avoid invalid Cert Error
/// https://github.com/iqfareez/iium_schedule/issues/10
/// https://stackoverflow.com/a/61312927/13617136
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (_, String host, __) => true;
  }
}
