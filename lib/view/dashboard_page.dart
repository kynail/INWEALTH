import 'dart:io';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inwealth/controller/parameters.dart';
import 'package:inwealth/controller/pisteReflexion_controller.dart';
import 'package:inwealth/model/list.dart';
import 'package:inwealth/utils/data/data_model.dart';
import 'package:inwealth/utils/theme/widgets/category_boxes.dart';
import 'package:inwealth/view/dashboardBody_page.dart';
import 'package:inwealth/view/document_page.dart';
import 'package:inwealth/view/login_page.dart';
import 'package:inwealth/view/meeting_page.dart';
import 'package:inwealth/view/onboard_page.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:collection';
import 'package:flip_card/flip_card.dart';
import 'package:badges/badges.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';
import '../../model/profile.dart';
import '../controller/profil_controller.dart';
import '../controller/store_controller.dart';
import '../utils/customCard.dart';
import '../utils/translations.dart';
import 'package:inwealth/view/projet_page.dart';

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

Color purp1 = Color(0xFF5E5B74);
Color purp2 = Color(0xFF272243);
Color gold1 = Color(0xFFD5C6AC);
Color gold2 = Color(0xFFBAAB90);
Color gold3 = Color(0xFF97876A);

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

final storeController = Get.find<StoreController>();

class _DashboardPageState extends State<DashboardPage>
    with WidgetsBindingObserver {
  Brightness? _brightness;

  String Project = "";
  int _currentIndex = 1;
  int _currentIndex2 = 0;

  bool _isLoading = false;
  String Country = "";
  String Projets = "";

  static List<Widget> _widgetOptions = <Widget>[
    DashboardPage(),
    DocumentPage(),
    MeetingPage(),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];
  // ScrollController _dashboardController = new ScrollController();
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex2 = index;
    });
  }

  void getUserCountry(Profile profile) async {
    int? profil;
    profil = profile.countryId;
    if (profil == 1) {
      setState(() {
        Country = "assets/images/france.png";
      });
    } else {
      setState(() {
        Country = "assets/images/switzerland.png";
      });
    }
  }

  // Future<String> getProjet(Profile profile) async {
  //   Response reponse;
  //   var dio = Dio();

  //   reponse =
  //       await dio.get('http://51.158.107.134:3000/inwealth/parcours/getAll/');
  //   // print(reponse.data[1]['typeParcours']);
  //   return reponse.data[1]['typeParcours'];
  // }

  final profileController = Get.put(ProfilController());
  final thinkingController = Get.put(ThinkingController());

  getprojet2() {}

  String? resific;
  bool? endproject = false;

  Future<void> getResiFisc() async {
    prefs = await SharedPreferences.getInstance();
  }

  ahtchoum() {
    // print("brightnessssssss : ");
    // print(_brightness);
    getResiFisc()
        .then(((value) => resific = prefs?.getString('residenceFiscal')));
    // while (resific == null) {
    if (resific != null && profileController.residenceFiscall == "") {
      // print("humhumhum : " + resific.toString());
      profileController.residenceFiscall = resific.toString();
    }
    getResiFisc().then(((value) => endproject = prefs?.getBool('endProject')));
    print("test bool end project 11111");
    // log("testteeeeeeeeeeeest");
    print(profileController.endProject.toString() + " 11");
    print(endproject);
    if (endproject != null) {
      // profileController.endProject = prefs!.getBool('endProject')!;

      // print("humhumhum : " + endproject.toString());
      profileController.endProject = endproject!;
      print("test bool end project 2");
      // log("testteeeeeeeeeeeest");
      print(profileController.endProject);
      log(10);
      // print("profile endproject !! : " + _isLightTheme.value.toString());
    }
  }

  @override
  void initState() {
    ahtchoum();
    // print("testestest");
    // debugPrint("testtestest");
    // _getThemeStatus();
    print("test bool end project 11");
    // log("testteeeeeeeeeeeest");
    print(profileController.endProject);

    print("if project end on end form 22");
    // print(prefs!.getBool('endProject'));
    WidgetsBinding.instance.addObserver(this);
    _brightness = WidgetsBinding.instance.window.platformBrightness;
    profileController.brightness = _brightness;
    // print("brightnessssssss : ");
    // print(_brightness);
    //     if (_brightness == Brightness.light) {
    //   Get.changeThemeMode(ThemeMode.light);
    // }
    // else {
    //   Get.changeThemeMode(ThemeMode.light);
    // }
    super.initState();
    // print("testestest");
  }

  @override
  Widget build(BuildContext context) {
    print("brightnessssssss : ");
    ahtchoum();

    // if (_brightness == Brightness.light) {
    //   Get.changeThemeMode(ThemeMode.light);
    // }
    // else {
    //   Get.changeThemeMode(ThemeMode.light);
    // }
    // Get.changeThemeMode(
    //   _isLightTheme.value
    //       ? ThemeMode.light
    //       : ThemeMode.dark,
    // );
    // _saveThemeStatus();

    List<String> _purposesuk = [
      AppLocalizations.of(context)?.translate('local_realEstate', 0) ??
          "Purchasing real estate",
      AppLocalizations.of(context)?.translate('restructuring', 0) ??
          "Restructuring the compagny",
      AppLocalizations.of(context)?.translate('selling_biz', 0) ??
          "Selling your business",
      // AppLocalizations.of(context)?.translate('selling_biz', 0) ?? "humk ",
    ];

    // }
    // print("humhumhum2 : " + resific.toString());
    if (resific != null && profileController.residenceFiscall == "") {
      // print("humhumhum : " + resific.toString());
      profileController.residenceFiscall = resific.toString();
    }
    // print("resifical profilecontrol : " + profileController.residenceFiscall);
    // print("resific dashboard : " + profileController.residenceFiscall);
    // print("user id dashboard : " + profileController.userId);
    // print("user id2 dashboard : " + profileController.userToken!.id);
    // print("brightnessssssss : ");
    // print(_brightness);
    // print("test dashboard");
    // print(profileController.userId);
    return Scaffold(
      // backgroundColor: Color(0xff121421),
      // appBar: AppBar(
      //   // backgroundColor: Color(0xFF665840),
      //   title: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       Align(
      //         alignment: Alignment.center,
      //         child: Center(
      //           child: Text(
      //             "iNwealth",
      //             style: TextStyle(
      //                 // fontFamily: 'assets/fonts/SFPRODISPLAYBOLD.OTF',
      //                 fontSize: 34,
      //                 // color: Colors.black,
      //                 fontWeight: FontWeight.bold),
      //             textAlign: TextAlign.center,
      //           ),
      //         ),
      //       ),
      //       FutureBuilder(
      //           future: ahtchoum(),
      //           builder: (context, snapshot) {
      //             return Image(
      //               image: AssetImage(
      //                   profileController.residenceFiscall == "france"
      //                       ? "assets/images/france.png"
      //                       : profileController.residenceFiscall == "uk"
      //                           ? "assets/royaume-uni.png"
      //                           : "assets/images/switzerland.png"),
      //               height: 40,
      //               width: 40,
      //             );
      //           }),

      //       // SizedBox(width: 80,),

      //       // const SizedBox(
      //       //   width: 40,
      //       // ),
      //     ],
      //   ),
      //   centerTitle: true,
      //   // backgroundColor: Color(0xff121421),

      //   // backgroundColor: const Color(0xFFFFFFFF),
      //   // backgroundColor: const Color(0xFFBAAB90),
      // ),
      // This is handled by the search bar itself.
      resizeToAvoidBottomInset: false,
      body: Container(
        // decoration: const BoxDecoration(color: Color(0xFFFFFFFF)),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListView(
                children: <Widget>[
                  Container(
                    height: 50.h,
                    child: ListView(
                      children: <Widget>[
                        Container(
                          height: 50.h,
                          child: ListView(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            children: [
                              SizedBox(
                                width: 28.w,
                              ),
                              CategoryBoxes(
                                text: "Prive".tr,
                                onPressed: (value) => print(value),
                              ),
                              CategoryBoxes(
                                text: "Professionnel".tr,
                                onPressed: (value) => print(value),
                              ),
                              //                               CategoryBoxes(
                              //   text: "Privé",
                              //   onPressed: (value) => print(value),
                              // ),
                              // CategoryBoxes(
                              //   text: "Immobilier",
                              //   onPressed: (value) => print(value),
                              // ),
                              // CategoryBoxes(
                              //   text: "Privé",
                              //   onPressed: (value) => print(value),
                              // ),
                              // CategoryBoxes(
                              //   text: "Immobilier",
                              //   onPressed: (value) => print(value),
                              // ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        // const SizedBox(
                        //   height: 25,
                        // ),
                        Container(
                          height: 20,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              AppLocalizations.of(context)
                                      ?.translate('projet', 0) ??
                                  "Enjeux patrimoniaux",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color(0xff515979),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.w),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  // const SizedBox(
                  //   height: 25,
                  // ),
                  Container(
                    height: 20,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                            "projet".tr,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color(0xff515979),
                            fontWeight: FontWeight.w500,
                            fontSize: 14.w),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 0,
                  ),
                  Container(
                    height: 230,
                    // width: 4500,
                    // margin: const EdgeInsets.symmetric(vertical: 10.0),
                    child: ListView.builder(
                      // padding: const EdgeInsets.all(8),
                      itemCount: _purposesuk.length,
                      itemBuilder: (BuildContext context, int index) {
                        // print("test: " + _purposes[index]);
                        // print("hum: " + _purposes[1]);
                        return profileController.residenceFiscall == "uk"
                            ? Cardhome(
                                project: _purposesuk[index],
                                keys: _purposesuk[index],
                                temps: parameters.purposesfr[index].temps,
                                question: parameters.purposesfr[index].question)
                            : Cardhome(
                                project: parameters.purposesfr[index].name,
                                keys: parameters.purposesfr[index].key,
                                temps: parameters.purposesfr[index].temps,
                                question:
                                    parameters.purposesfr[index].question);
                        // profileController.residenceFiscall == "United Kingdom"
                      },
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 30,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                            "iSolution".tr,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color(0xff515979),
                            fontWeight: FontWeight.w500,
                            fontSize: 14.w),
                      ),
                    ),
                  ),
                  Container(
                    height: 260,
                    // margin: const EdgeInsets.symmetric(vertical: 0.0),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        SizedBox(
                          height: 5,
                          width: 10,
                        ),
                        Card2home(),
                        SizedBox(
                          height: 5,
                          width: 0,
                        ),
                        Card3home(),
                        SizedBox(
                          height: 5,
                          width: 0,
                        ),
                        // Card2home(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    // decoration:
                    // const BoxDecoration(color: Color(0xFFFFFFF)),
                    child: Column(children: <Widget>[
                      profileController.islog == false
                          ? Container(
                              child: Row(children: <Widget>[
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Container(
                                    color: const Color(0xFF494661),
                                    height: 2,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Image(
                                  image:
                                      AssetImage('assets/images/inw-logo.png'),
                                  height: 30,
                                  width: 30,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Container(
                                    color: const Color(0xFF494661),
                                    height: 2,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                              ]),
                            )
                          : Container(),
                      const SizedBox(
                        height: 20,
                      ),
                      // profileController.islog == false
                      //     ? TextButton(
                      //         onPressed: () => Get.to(LoginPage()),
                      //         child: const Text(
                      //           'INwealth ? Connectez-vous',
                      //           // style: TextStyle(color: Colors.white),
                      //           textAlign: TextAlign.center,
                      //         ),
                      //       )
                      //     : BottomNavigationBar(
                      //         items: <BottomNavigationBarItem>[
                      //           BottomNavigationBarItem(
                      //             icon: Icon(Icons.home),
                      //             label: 'Home',
                      //             backgroundColor: gold1,
                      //           ),
                      //           BottomNavigationBarItem(
                      //             icon: Icon(Icons.list_alt_outlined),
                      //             label: 'Business',
                      //             backgroundColor: purp1,
                      //           ),
                      //           BottomNavigationBarItem(
                      //             icon: Icon(Icons.calendar_month),
                      //             label: 'Meeting',
                      //             backgroundColor: gold3,
                      //           ),
                      //           BottomNavigationBarItem(
                      //             icon: Icon(Icons.document_scanner),
                      //             label: 'Settings',
                      //             backgroundColor: purp2,
                      //           ),
                      //           BottomNavigationBarItem(
                      //             icon: Icon(Icons.notification_important),
                      //             label: 'Settings',
                      //             backgroundColor: purp2,
                      //           ),
                      //         ],
                      //         currentIndex:
                      //             _currentIndex2,
                      //         selectedItemColor: Colors.amber[800],
                      //         onTap: _onItemTapped,
                      //       ),
                      // Obx(
                      //   () => Text(
                      //     'Click on switch to change to ${_isLightTheme.value ? 'Dark' : 'Light'} theme',
                      //   ),
                      // ),
                      // ObxValue(
                      //   (data) => Switch(
                      //     value: _isLightTheme.value,
                      //     onChanged: (val) {
                      //       _isLightTheme.value = val;
                      //       Get.changeThemeMode(
                      //         _brightness == Brightness.light
                      //             ? ThemeMode.light
                      //             : ThemeMode.dark,
                      //       );
                      //       _saveThemeStatus();
                      //     },
                      //   ),
                      //   false.obs,
                      // ),
                    ]),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      // Stack(
      //     clipBehavior: Clip.none,
      //     alignment: new FractionalOffset(0.5, 1.0),
      //     children: [
      //       Container(
      //         height: 80,
      //         padding: EdgeInsets.symmetric(vertical: 10),
      //         decoration: BoxDecoration(
      //           border: Border.symmetric(
      //             horizontal: BorderSide(
      //               color: Colors.grey.shade200,
      //             ),
      //           ),
      //         ),
      //         child: Row(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //           children: [
      //             Container(
      //               height: 80,
      //               padding: EdgeInsets.symmetric(vertical: 10),
      //               decoration: BoxDecoration(
      //                 border: Border.symmetric(
      //                   horizontal: BorderSide(
      //                     color: Colors.grey.shade200,
      //                   ),
      //                 ),
      //               ),
      //               child: Row(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                 children: [

      //                 ],
      //               ),
      //             )
      //           ],
      //         ),
      //       ),
      //     ]
      // ),
    );
  }
}
