// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:inwealth/controller/langue_controller.dart';
import 'package:inwealth/controller/storeBinding.dart';
import 'package:inwealth/utils/translations.dart';
import 'package:inwealth/utils/localization_delegate.dart';
import 'package:inwealth/model/list.dart';
import 'package:inwealth/view/dashboardBody_page.dart';
import 'package:inwealth/view/dashboard_page.dart';
import 'package:inwealth/view/dashboarddashboard.dart';
import 'package:inwealth/view/onboard_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'controller/profil_controller.dart';
import 'controller/store_controller.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(MyApp());
}

ThemeData _darkTheme = ThemeData(
    accentColor: Color(0xff121421),
    brightness: Brightness.dark,
    textTheme: TextTheme(
        headline1: TextStyle(color: Colors.white),
        headline2: TextStyle(color: Colors.white),
        bodyText1: TextStyle(color: Colors.white),
        bodyText2: TextStyle(color: Colors.white)),
    primaryColor: Color(0xff121421),
    backgroundColor: Color(0xff121421),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.white,
      disabledColor: Colors.grey,
    ));

ThemeData _lightTheme = ThemeData(
    accentColor: Colors.red,
    // colorScheme: ColorScheme(),
    textTheme: TextTheme(
        headline1: TextStyle(color: Colors.black),
        headline2: TextStyle(color: Colors.black),
        headline3: TextStyle(color: Colors.black),
        headline4: TextStyle(color: Colors.black),
        headline5: TextStyle(color: Colors.black),
        headline6: TextStyle(color: Colors.black),
        subtitle1: TextStyle(color: Colors.black),
        subtitle2: TextStyle(color: Colors.black),
        bodyText1: TextStyle(color: Colors.black),
        bodyText2: TextStyle(color: Colors.black)),
    textSelectionColor: Colors.black,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        textTheme: TextTheme(
            headline1: TextStyle(color: Colors.black),
            headline2: TextStyle(color: Colors.black),
            headline3: TextStyle(color: Colors.black),
            headline4: TextStyle(color: Colors.black),
            headline5: TextStyle(color: Colors.black),
            headline6: TextStyle(color: Colors.black),
            subtitle1: TextStyle(color: Colors.black),
            subtitle2: TextStyle(color: Colors.black),
            bodyText1: TextStyle(color: Colors.black),
            bodyText2: TextStyle(color: Colors.black))),
    primaryColor: Colors.red,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.black,
      disabledColor: Colors.grey,
    ));

class MyApp extends StatelessWidget {
  RxBool _isLightTheme = false.obs;

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  _saveThemeStatus() async {
    SharedPreferences pref = await _prefs;
    pref.setBool('theme', _isLightTheme.value);
  }

  _getThemeStatus() async {
    var _isLight = _prefs.then((SharedPreferences prefs) {
      return prefs.getBool('theme') != null ? prefs.getBool('theme') : true;
    }).obs;
    _isLightTheme.value = (await _isLight.value)!;
    Get.changeThemeMode(_isLightTheme.value ? ThemeMode.light : ThemeMode.dark);
  }

  MyApp() {
    _getThemeStatus();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return GetMaterialApp(
            translations: Languages(),
            locale: Get.deviceLocale,
            fallbackLocale: const Locale('en', 'US'),
            title: 'iNwealth',
            theme: _lightTheme,
            darkTheme: _darkTheme,
            themeMode: ThemeMode.system,
            debugShowCheckedModeBanner: false,
            initialBinding: StoreBinding(),
            home: const MyHomePage(title: 'Flutter Demo Home Page'),
            // routes: {
            //   'onboard': (context) => OnboardPage(),
            //   'dashboard': (context) => DashboardPage(),
            // },
          );
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  SharedPreferences? prefs;
  String? userID;
  String? resiFisc;

  Future<void> getProfilId() async {
    prefs = await SharedPreferences.getInstance();

    bool checkValue = prefs!.containsKey('userID');
    if (checkValue == false) {
      // print("no data");
    }
  }

  final storeController = Get.find<StoreController>();
  final profileController = Get.put(ProfilController());

  getResiFisc() async {
    getProfilId().then((value) {
      userID = prefs?.getString('userID');
      resiFisc = prefs?.getString('residenceFiscal');

      if (userID != null && profileController.userId == "") {
        profileController.userId = userID.toString();
      }
    });

    getProfilId()
        .then(((value) => resiFisc = prefs?.getString('residenceFiscal')));

    if (profileController.residenceFiscall == "" && resiFisc != null) {
      profileController.residenceFiscall = resiFisc.toString();
    }
  }

  @override
  void initState() {
    super.initState();
    getProfilId().then((value) {
      userID = prefs?.getString('userID');
      if (userID != null && profileController.userId == "") {
        profileController.userId = userID.toString();
        // print("test main");
        print("id id id id" + profileController.userId);
      }
    });

    getProfilId()
        .then(((value) => resiFisc = prefs?.getString('residenceFiscal')));
    // print("fuck : " + resiFisc.toString());
    // print("awesome fuck : " + profileController.residenceFiscall);
    if (profileController.residenceFiscall == "" && resiFisc != null) {
      // print("oh no ");
      profileController.residenceFiscall = resiFisc.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    getProfilId();
    return CupertinoApp(
      theme: CupertinoThemeData(
          brightness: Brightness.dark,
          primaryColor: CupertinoColors.systemOrange),
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) {
          return (FutureBuilder(
              future: getResiFisc(),
              builder: (context, snapshot) {
                // print('UserID = ' + userID.toString());
                // print('Residence Fiscale = ' + resiFisc.toString());
                // print('Residence Fiscale22 = ' +
                //     profileController.residenceFiscall.toString());
                // FlutterNativeSplash.remove();
ahtchoum();
                return userID == null &&
                        profileController.residenceFiscall == ""
                    ? OnboardPage()
                    : DashboardNavigation();
              }));
        },
        '/next': (BuildContext context) {
          return const CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text('Route'),
            ),
            child: Center(child: Icon(CupertinoIcons.share)),
          );
        }
      },
      // ignore: prefer_const_literals_to_create_immutables
      localizationsDelegates: [
        const LocalizationDelegate(),
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // ignore: prefer_const_literals_to_create_immutables
      supportedLocales: [
        const Locale('en', ''), // English, no country code
        const Locale('fr', ''), // French, no country code
        const Locale.fromSubtags(languageCode: 'zh')
      ],
    );
  }
}

class LoadingPage extends StatefulWidget {
  LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    loadPage();
  }

  loadPage() {
    getProfilId2().then((userStatus) {
      if (userStatus == null) {
        Navigator.of(context).pushNamed('/onboard');
      } else {
        Navigator.of(context).pushNamed('/dashboard');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: CircularProgressIndicator(),
    ));
  }
}

Future<String?> getProfilId2() async {
  prefs = await SharedPreferences.getInstance();
  String? userStatus = prefs?.getString('residenceFiscall');
  // bool checkValue = prefs!.containsKey('residenceFiscal');
  // if (checkValue == false) {
  //   print("no data");
  // }
  print("==On Load Check ==");
  print(userStatus);
  return userStatus;
}
