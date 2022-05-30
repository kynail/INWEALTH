import 'dart:io';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:inwealth/model/list.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:collection';
import 'package:flip_card/flip_card.dart';
import 'package:badges/badges.dart';
import 'package:dio/dio.dart';
import 'dart:math';
import '../../model/profile.dart';
import '../controller/profil_controller.dart';
import '../controller/store_controller.dart';
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
  bool _isLoading = false;
  String Country = "";
  String Projets = "";
  Color purp1 = Color(0xFF5E5B74);
  Color purp2 = Color(0xFF272243);
  Color gold1 = Color(0xFFD5C6AC);
  Color gold2 = Color(0xFFBAAB90);
  Color gold3 = Color(0xFF97876A);

  // ScrollController _dashboardController = new ScrollController();

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

  @override
  Widget build(BuildContext context) {
    List<String> _purposes = [
      AppLocalizations.of(context)?.translate('local_realEstate', 0) ?? "Purchasing real estate.",
      AppLocalizations.of(context)?.translate('restructuring', 0) ?? "Restructuring the compagny.",
      AppLocalizations.of(context)?.translate('selling_biz', 0) ?? "Selling your business.",
      // AppLocalizations.of(context)?.translate('selling_biz', 0) ?? "humk ",

    ];

    var rng = new Random();
    // String project;

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Color(0xFF665840),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image(
              image: AssetImage(profileController.residenceFiscall == "France"
                  ? "assets/images/france.png"
                  : "assets/royaume-uni.png"),
              height: 40,
              width: 40,
            ),
            // SizedBox(width: 80,),
            Align(
              alignment: Alignment.center,
              child: Center(
                child: const Text(
                  "INWEALTH",
                  style: TextStyle(
                      fontFamily: 'assets/fonts/SFPRODISPLAYBOLD.OTF',
                      color: Color(0xFF524D69)),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              width: 40,
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFBAAB90),
      ),
      // This is handled by the search bar itself.
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(color: Color(0xFFFFFFFF)),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: ListView(
                children: <Widget>[
                  //buildMap(),
                  //buildBottomNavigationBar(),
                  SizedBox(
                    height: 5,
                  ),

                  // Container(
                  //   height: 80,
                  //   child: Stack(fit: StackFit.expand, children: [
                  //     buildFloatingSearchBar(context)
                  //   ]),
                  // ),

                  Container(
                    height: 40,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        AppLocalizations.of(context)?.translate('projet', 0) ??
                            "Project",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 28,
                            color: Color(0xFF4E4965),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 0,
                  ),

                  Container(
                    height: 200,
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    child: ListView.builder(
                      // padding: const EdgeInsets.all(8),
                      itemCount: _purposes.length,
                      itemBuilder: (BuildContext context, int index) {
                        print("test: " + _purposes[index]);
                        print("hum: " + _purposes[1]);
                        return Cardhome(project: _purposes[index]);
                      },
                      scrollDirection: Axis.horizontal,
                    ),
                  ),

                  Container(
                    height: 50,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        AppLocalizations.of(context)
                                ?.translate('iSolution', 0) ??
                            "International Solutions",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 25,
                          color: Color(0xFF524D69),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 240,
                    margin: EdgeInsets.symmetric(vertical: 1.0),
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
                        Card2home(),
                        SizedBox(
                          height: 5,
                          width: 0,
                        ),
                        Card2home(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    decoration: BoxDecoration(color: Color(0xFFFFFFF)),
                    child: Column(children: <Widget>[
                      Container(
                        child: Row(children: <Widget>[
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Container(
                              color: Color(0xFF494661),
                              height: 2,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Image(
                            image: AssetImage('assets/images/inw-logo.png'),
                            height: 30,
                            width: 30,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              color: Color(0xFF494661),
                              height: 2,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ]),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
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
    );
  }
}

class Cardhome extends StatelessWidget {
  final String project;
  Cardhome({
    required this.project,
    Key? key,
  }) : super(key: key);

  GlobalKey<FlipCardState> cardkey = GlobalKey<FlipCardState>();
  bool cardIsFlipped = false;

  void updateCardIsFlipped() => cardIsFlipped = !cardIsFlipped;

  Future<void> turnCard() async {
    if (cardIsFlipped) {
      cardkey.currentState?.toggleCard();
    }
  }

  @override
  Widget build(BuildContext context) {
    FlipCardController controller = FlipCardController();
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(15),
          child: GestureDetector(
            onTap: () => Get.to(ProjetPage()),
            child: FlipCard(
              key: cardkey,
              fill: Fill.fillBack,
              flipOnTouch: false,
              // controller: controller,
              direction: FlipDirection.HORIZONTAL,
              front: Container(
                child: Badge(
                  elevation: 10,
                  position: BadgePosition.topEnd(top: -9, end: -5),
                  badgeContent:
                      Text('7', style: TextStyle(fontWeight: FontWeight.w500)),
                  badgeColor: Color(0xFF7F7A93),
                  child: Stack(
                    fit: StackFit.passthrough,
                    children: [
                      Container(
                        height: 150.0,
                        width: 150.0,
                        decoration: BoxDecoration(
                          color: Color(0xFF5E5B74),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          image: DecorationImage(
                              colorFilter: ColorFilter.mode(
                                  Color(0xFFD5C6AC).withOpacity(1.0),
                                  BlendMode.srcATop),
                              image: AssetImage('assets/test.png'),
                              fit: BoxFit.cover),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 150,
                          width: 150,
                          child: Center(
                            // child: Obx( () =>
                            child: Text(
                              project,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                            // ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -8,
                        right: -5,
                        child: TextButton(
                          onPressed: () => cardkey.currentState?.toggleCard(),
                          style: ButtonStyle(),
                          // padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Icon(Icons.info_rounded, color: Colors.white)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              back: Container(
                child: Badge(
                  position: BadgePosition.topEnd(top: -9, end: -5),
                  badgeContent: Text('7'),
                  badgeColor: Color(0xFF5E5B74),
                  child: Stack(
                    children: [
                      Container(
                        height: 150.0,
                        width: 150.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          image: DecorationImage(
                              colorFilter: ColorFilter.mode(
                                  Color(0xFFD5C6AC).withOpacity(1.0),
                                  BlendMode.srcATop),
                              image: AssetImage('assets/test.png'),
                              fit: BoxFit.cover),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 150,
                          width: 150,
                          child: Center(
                            child: Text(
                              "BACK",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -8,
                        right: -5,
                        child: TextButton(
                          onPressed: () => cardkey.currentState?.toggleCard(),
                          style: ButtonStyle(),
                          // padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Icon(Icons.info_rounded, color: Colors.white)
                            ],
                          ),
                        ),
                      )
                      // Align(
                      //   alignment: Alignment.topRight,
                      //   child: Badge(
                      //     badgeContent: Text('7'),
                      //     position: BadgePosition.topEnd(),
                      //     badgeColor: Color(0xFF5E5B74),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Text("test"),
      ],
    );
  }
}

class Card2home extends StatelessWidget {
  const Card2home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FlipCardController controller = FlipCardController();

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(15),
          child: GestureDetector(
            onTap: () => Get.to(DashboardPage()),
            child: FlipCard(
              fill: Fill.fillBack,
              direction: FlipDirection.HORIZONTAL,
              //flipOnTouch: false,
              front: Container(
                child: Badge(
                  position: BadgePosition.topEnd(top: -9, end: -5),
                  badgeContent: Text('6'),
                  badgeColor: Color(0xFF5E5B74),
                  child: Stack(
                    fit: StackFit.passthrough,
                    children: [
                      Container(
                        height: 190.0,
                        width: 250.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          image: DecorationImage(
                              colorFilter: ColorFilter.mode(
                                  Color(0xFF7F7A93).withOpacity(1.0),
                                  BlendMode.srcATop),
                              image: AssetImage('assets/test.png'),
                              fit: BoxFit.cover),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 190,
                          width: 250,
                          child: Center(
                            child: Text(
                              "FRONT",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -6,
                        right: -5,
                        child: TextButton(
                          onPressed: () => controller.toggleCard(),
                          style: ButtonStyle(),
                          // padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Icon(Icons.info_rounded, color: Colors.white)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              back: Container(
                child: Badge(
                  position: BadgePosition.topEnd(top: -9, end: -5),
                  badgeContent: Text('6'),
                  badgeColor: Color(0xFF5E5B74),
                  child: Stack(
                    //fit: StackFit.passthrough,
                    children: [
                      Container(
                        height: 190.0,
                        width: 250.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          image: DecorationImage(
                              colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.2),
                                  BlendMode.srcATop),
                              image: AssetImage('assets/test.png'),
                              fit: BoxFit.cover),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 190.0,
                          width: 250.0,
                          child: Center(
                            child: Text(
                              "BACK",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Text("test"),
      ],
    );
  }
}
