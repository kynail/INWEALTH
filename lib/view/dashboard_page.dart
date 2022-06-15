import 'dart:io';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:inwealth/controller/parameters.dart';
import 'package:inwealth/model/list.dart';
import 'package:inwealth/view/dashboardBody_page.dart';
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

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);


  @override
  _DashboardPageState createState() => _DashboardPageState();
}

final storeController = Get.find<StoreController>();

class _DashboardPageState extends State<DashboardPage> {
  String Project = "";
  int _currentIndex = 1;
  int _currentIndex2 = 0;

  bool _isLoading = false;
  String Country = "";
  String Projets = "";
  Color purp1 = Color(0xFF5E5B74);
  Color purp2 = Color(0xFF272243);
  Color gold1 = Color(0xFFD5C6AC);
  Color gold2 = Color(0xFFBAAB90);
  Color gold3 = Color(0xFF97876A);

  // ScrollController _dashboardController = new ScrollController();
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    dashboardBodyPage(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    MeetingPage(),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

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

  getprojet2() {}

  String? resific;
  bool? endproject = false;

  Future<void> getResiFisc() async {
    prefs = await SharedPreferences.getInstance();
  }

  ahtchoum() {
    getResiFisc()
        .then(((value) => resific = prefs?.getString('residenceFiscal')));
    // while (resific == null) {
    if (resific != null && profileController.residenceFiscall == "") {
      // print("humhumhum : " + resific.toString());
      profileController.residenceFiscall = resific.toString();
    }
    getResiFisc()
        .then(((value) => endproject = prefs?.getBool('endProject')));
        if (endproject != null) {
      print("humhumhum : " + endproject.toString());
      profileController.endProject = endproject!;
      print("profile endproject : " + profileController.endProject.toString());
    }
  }

  @override
  // void initState() {
  //   super.initState();
  //   getResiFisc()
  //       .then(((value) => resific = prefs?.getString('residenceFiscal')));
  //   // while (resific == null) {
  //   if (resific != null && profileController.residenceFiscall == "") {
  //     print("humhumhum : " + resific.toString());
  //     profileController.residenceFiscall = resific.toString();
  //   }
  //   // TODO: implement initState
  // }

  @override
  Widget build(BuildContext context) {
    List<String> _purposesuk = [
      AppLocalizations.of(context)?.translate('local_realEstate', 0) ??
          "Purchasing real estate.",
      AppLocalizations.of(context)?.translate('restructuring', 0) ??
          "Restructuring the compagny.",
      AppLocalizations.of(context)?.translate('selling_biz', 0) ??
          "Selling your business.",
      // AppLocalizations.of(context)?.translate('selling_biz', 0) ?? "humk ",
    ];


    List<String> _purposesfr = [
      "Ceder son entreprise",
      "transmettre son entreprise à un tier",
      "maitriser son impot sur la fortune",
      // AppLocalizations.of(context)?.translate('selling_biz', 0) ?? "humk ",
    ];

    // }
    // print("humhumhum2 : " + resific.toString());
    if (resific != null && profileController.residenceFiscall == "") {
      // print("humhumhum : " + resific.toString());
      profileController.residenceFiscall = resific.toString();
    }
    // print("resifical profilecontrol : " + profileController.residenceFiscall);
    print("resific dashboard : "+ profileController.residenceFiscall);
    print("user id dashboard : " + profileController.userId);
    // print("user id2 dashboard : " + profileController.userToken!.id);


        // print("test dashboard");
        // print(profileController.userId);
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Color(0xFF665840),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FutureBuilder(
                future: ahtchoum(),
                builder: (context, snapshot) {
                  return Image(
                    image: AssetImage(profileController.residenceFiscall ==
                            "France"
                        ? "assets/images/france.png"
                        : profileController.residenceFiscall == "United Kingdom"
                            ? "assets/royaume-uni.png"
                            : "assets/images/switzerland.png"),
                    height: 40,
                    width: 40,
                  );
                }),

            // SizedBox(width: 80,),
            const Align(
              alignment: Alignment.center,
              child: Center(
                child: Text(
                  "INWEALTH",
                  style: TextStyle(
                      fontFamily: 'assets/fonts/SFPRODISPLAYBOLD.OTF',
                      color: Color(0xFF524D69)),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(
              width: 40,
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFBAAB90),
      ),
      // This is handled by the search bar itself.
      resizeToAvoidBottomInset: false,
      body: profileController.finish != false
          ? _widgetOptions.elementAt(_currentIndex2)
          : Container(
              decoration: const BoxDecoration(color: Color(0xFFFFFFFF)),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: ListView(
                      children: <Widget>[
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 40,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              AppLocalizations.of(context)
                                      ?.translate('projet', 0) ??
                                  "Project.",
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  fontSize: 28,
                                  color: const Color(0xFF4E4965),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 0,
                        ),
                        Container(
                          height: 200,
                          margin: const EdgeInsets.symmetric(vertical: 10.0),
                          child: ListView.builder(
                            // padding: const EdgeInsets.all(8),
                            itemCount: _purposesuk.length,
                            itemBuilder: (BuildContext context, int index) {
                              // print("test: " + _purposes[index]);
                              // print("hum: " + _purposes[1]);
                              return  profileController.residenceFiscall == "United Kingdom"
                              ? Cardhome(project: _purposesuk[index])
                              : Cardhome(project: _purposesfr[index]);
                              // profileController.residenceFiscall == "United Kingdom" 
                                
                            },
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                        Container(
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              AppLocalizations.of(context)
                                      ?.translate('iSolution', 0) ??
                                  "International Solutions",
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontSize: 25,
                                color: const Color(0xFF524D69),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 240,
                          margin: const EdgeInsets.symmetric(vertical: 1.0),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: const <Widget>[
                              SizedBox(
                                height: 5,
                                width: 10,
                              ),
                              Card2home(),
                              SizedBox(
                                height: 5,
                                width: 0,
                              ),
                              Card2home(),
                              SizedBox(
                                height: 5,
                                width: 0,
                              ),
                              Card2home(),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Container(
                          decoration:
                              const BoxDecoration(color: Color(0xFFFFFFF)),
                          child: Column(children: <Widget>[
                            Container(
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
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'INwealth ? Connectez-vous',
                              textAlign: TextAlign.center,
                            ),
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
