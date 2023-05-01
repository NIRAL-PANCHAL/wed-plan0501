import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner_project/screen/login_screen.dart';
import 'package:wedding_planner_project/screen/splash%20screen.dart';
final getStorage = GetStorage();
void main()async{
  await GetStorage.init();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Sizer',
          theme: ThemeData.light(),
          home: SplashScreen() ,
        );
      },
    );
  }
}

/*
Variant: release
Config: debug
Store: C:\Users\LENOVO\.android\debug.keystore
Alias: AndroidDebugKey
MD5: 9A:83:4F:43:E1:4F:D2:9A:2A:E8:A9:F3:56:CE:17:D9
SHA1: D5:30:66:BB:CD:DB:85:B5:AB:5A:71:71:6E:69:DF:2F:6F:4A:3B:DF
SHA-256: C7:CC:9B:6F:AF:5A:8C:A3:60:E5:1C:8D:EC:A2:65:72:52:1A:43:CA:6B:98:A5:D6:29:08:B6:14:12:2E:D7:0A
Valid until: Saturday, 30 December, 2051
*/
