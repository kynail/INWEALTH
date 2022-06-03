import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
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
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }
  SharedPreferences? prefs;
  String? userID;
  String? resiFisc;

  Future<void> getProfilId() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> getResiFisc() async {
    prefs = await SharedPreferences.getInstance();
  }

  final storeController = Get.find<StoreController>();
final profileController = Get.put(ProfilController());

  @override
  Widget build(BuildContext context) {
              getProfilId().then((value)
          { userID = prefs?.getString('userID');
            getResiFisc().then(((value) => resiFisc = prefs?.getString('residenceFiscal')));
            profileController.residenceFiscall = resiFisc.toString();
          // if (userID != null) {
          //   FlutterNativeSplash.remove();
          // }
          }
          );
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return CupertinoApp(
      theme: CupertinoThemeData(
          brightness: Brightness.dark,
          primaryColor: CupertinoColors.systemOrange),
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) {
          
          // getProfilId().then((value)
          // { userID = prefs?.getString('userID');
          // // if (userID != null) {
          // // }
          // }
          // );
            FlutterNativeSplash.remove();
          // userID = prefs?.getString('userID');
          print("TEEEEEEST  :  " + userID.toString());
          print("TEEEEEEST22  :  " + userID.toString());
          // print("TEEEEEEST2  :  " + profileController.userId.toString());

          if (userID == null) {
            return OnboardPage();
          }
          else {
            return DashboardPage();
          }

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
      localizationsDelegates: [
        const LocalizationDelegate(),
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''), // English, no country code
        const Locale('fr', ''), // Hebrew, no country code
        const Locale.fromSubtags(languageCode: 'zh')
      ],
    );
  }
}
