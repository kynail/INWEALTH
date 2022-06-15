import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:inwealth/controller/langue_controller.dart';
import 'package:inwealth/controller/storeBinding.dart';
import 'package:inwealth/utils/translations.dart';
import 'package:inwealth/utils/localization_delegate.dart';
import 'package:inwealth/model/list.dart';
import 'package:inwealth/view/dashboard_page.dart';
import 'package:inwealth/view/onboard_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controller/profil_controller.dart';
import 'controller/store_controller.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Languages(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      title: 'INWEALTH',
      initialBinding: StoreBinding(),
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // routes: {
      //   'onboard': (context) => OnboardPage(),
      //   'dashboard': (context) => DashboardPage(),
      // },
    );
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
      print("no data");
    }
  }



  final storeController = Get.find<StoreController>();
  final profileController = Get.put(ProfilController());

  getResiFisc() async {
    getProfilId().then((value) {
      userID = prefs?.getString('userID');

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
        print("test main");
        print(profileController.userId);
      }
    });

    getProfilId()
        .then(((value) => resiFisc = prefs?.getString('residenceFiscal')));
    // print("fuck : " + resiFisc.toString());
    // print("awesome fuck : " + profileController.residenceFiscall);
    if (profileController.residenceFiscall == "" && resiFisc != null) {
      print("oh no ");
      profileController.residenceFiscall = resiFisc.toString();
    }

  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(
          brightness: Brightness.dark,
          primaryColor: CupertinoColors.systemOrange),
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) {
          return (FutureBuilder(
              future: getResiFisc(),
              builder: (context, snapshot) {
                print('UserID = ' + userID.toString());
                print('Residence Fiscale = ' +
                    profileController.residenceFiscall.toString());
            FlutterNativeSplash.remove();

                // if (snapshot.hasData) {
                  return userID == null &&
                          profileController.residenceFiscall == ""
                      ? OnboardPage()
                      : DashboardPage();
                // } else if (snapshot.hasError) {
                //   return SizedBox();
                //   print("main error aaaaaaaaaaaaaah");
                // } else {
                //   return 
                //     SizedBox(
                //       width: 60,
                //       height: 60,
                //       child: CircularProgressIndicator(),
                //     );
                // }
                // return Container();
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
