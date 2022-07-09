// ignore_for_file: prefer_const_constructors

import 'package:badges/badges.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:inwealth/view/dashboardProject_page.dart';
import 'package:inwealth/view/interproject_page.dart';
import 'package:inwealth/view/meeting_page.dart';
import 'package:inwealth/view/onboard_page.dart';
import 'package:inwealth/view/projectFr_page.dart';
import 'dart:developer';
import '../view/dashboard_page.dart';
import '../view/projet_page.dart';

class Cardhome extends StatelessWidget {
  final String project;
  final String keys;
  final String temps;
  final String question;
  Cardhome({
    required this.project,
    required this.keys,
    required this.temps,
    required this.question,
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

  String chooseImg() {
    if (profileController.residenceFiscall == "france") {
      return ('assets/france.jpg');
    } else if (profileController.residenceFiscall == "uk") {
      return ('assets/Uk-image.jpg');
    } else {
      return ('assets/suisse.jpg');
    }
  }

  @override
  Widget build(BuildContext context) {
    FlipCardController controller = FlipCardController();
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 20, top: 15, bottom: 20, right: 10),
          // padding: const EdgeInsets.all(15),
          child: GestureDetector(
            onTap: () {
              profileController.project = keys;
              print(keys);
              if (profileController.project == "Purchasing real estate") {
                if (profileController.endProject == true) {
                  Get.to(dashboardProjectPage());
                } else {
                  Get.to(ProjetPage());
                }
              } else if (profileController.project == "cederEntreprise") {
                print("if projet fini");
                print("test print hum");
                log("testteeeeeeeeeeeest");
                print(profileController.endProject);
                if (profileController.endProject == true) {
                  Get.to(dashboardProjectPage());
                } else {
                  Get.to(ProjectFrPage());
                }
              }
            },
            child: Container(
              // decoration: BoxDecoration(boxShadow: [
              //   BoxShadow(
              //     color: Colors.black.withOpacity(0.2),
              //     spreadRadius: 2,
              //     blurRadius: 8,
              //     offset: Offset(4, 6),
              //   ),
              // ]),
              // height: 150,
              child: FlipCard(
                key: cardkey,
                fill: Fill.fillBack,
                flipOnTouch: false,
                // controller: controller,
                direction: FlipDirection.HORIZONTAL,
                front: Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: Offset(4, 6),
                    ),
                  ]),
                  child: Badge(
                    elevation: 10,
                    position: BadgePosition.topEnd(top: -9, end: -5),
                    badgeContent: Text(question,
                        style: const TextStyle(fontWeight: FontWeight.w500)),
                    badgeColor: const Color(0xFF7F7A93),
                    child: Stack(
                      fit: StackFit.passthrough,
                      children: [
                        Container(
                          height: 150.0,
                          width: 200.0,
                          decoration: BoxDecoration(
                            color: const Color(0xFF5E5B74),
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: Colors.black.withOpacity(0.2),
                            //     spreadRadius: 4,
                            //     blurRadius: 4,
                            //     offset: Offset(4, 8),
                            //   ),
                            // ],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            image: DecorationImage(
                                // colorFilter: ColorFilter.mode(
                                //     const Color(0xFFD5C6AC).withOpacity(1.0),
                                //     BlendMode.srcATop),
                                image: AssetImage(chooseImg()),
                                fit: BoxFit.cover),
                            shape: BoxShape.rectangle,
                          ),
                        ),

                        Positioned(
                          left: -15,
                          top: -5,
                          child: TextButton(
                            onPressed: () => cardkey.currentState?.toggleCard(),
                            style: const ButtonStyle(),
                            // padding: EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                const Icon(Icons.info_rounded,
                                    color: Colors.white)
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                              height: 40,
                              width: 200,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomRight: const Radius.circular(20),
                                    bottomLeft: const Radius.circular(20)),
                              )),
                        ),
                        Positioned(
                          // top: 100,
                          left: 30,
                          bottom: 10,

                          child: Center(
                            // child: Obx( () =>
                            child: Text(
                              project,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14),
                            ),
                            // ),
                          ),
                        ),
                        // Text("test", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
                back: Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: Offset(4, 6),
                    ),
                  ]),
                  child: Badge(
                    elevation: 10,
                    position: BadgePosition.topEnd(top: -9, end: -5),
                    badgeContent: Text(question,
                        style: const TextStyle(fontWeight: FontWeight.w500)),
                    badgeColor: const Color(0xFF7F7A93),
                    child: Stack(
                      children: [
                        Container(
                          height: 200.0,
                          width: 200.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                            // image: DecorationImage(
                            //     colorFilter: ColorFilter.mode(
                            //         const Color(0xFFD5C6AC).withOpacity(1.0),
                            //         BlendMode.srcATop),
                            //     image: AssetImage(chooseImg()),
                            //     fit: BoxFit.cover),
                            shape: BoxShape.rectangle,
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: 150,
                            width: 150,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 30, bottom: 20, left: 10, right: 10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Estimation du parcours: " + temps,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      "Nombres de questions: " + question,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: -15,
                          top: -5,
                          child: TextButton(
                            onPressed: () => cardkey.currentState?.toggleCard(),
                            style: const ButtonStyle(),
                            // padding: EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                const Icon(Icons.info_rounded,
                                    color: Colors.white)
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
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: const Text(
            "3202 vues",
            // style: TextStyle(color: Colors.white),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: RatingBar.builder(
            initialRating: 3,
            itemSize: 20,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              // size: 1.9,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
        )
      ],
    );
  }
}

class Card2home extends StatelessWidget {
  Card2home({
    Key? key,
  }) : super(key: key);

  String chooseImg() {
    if (profileController.residenceFiscall == "france") {
      return ('assets/Uk-image.jpg');
    } else if (profileController.residenceFiscall == "uk") {
      return ('assets/france.jpg');
    } else {
      return ('assets/suisse.jpg');
    }
  }

  GlobalKey<FlipCardState> cardkey = GlobalKey<FlipCardState>();
  bool cardIsFlipped = false;
  @override
  Widget build(BuildContext context) {
    FlipCardController controller = FlipCardController();

    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 20, top: 5, bottom: 15),
          child: GestureDetector(
            onTap: () => Get.to(InterProjectPage()),
            child: FlipCard(
              key: cardkey,
              fill: Fill.fillBack,
              flipOnTouch: false,
              direction: FlipDirection.HORIZONTAL,
              //flipOnTouch: false,
              front: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: Offset(4, 6),
                  ),
                ]),
                child: Badge(
                  elevation: 10,
                  position: BadgePosition.topEnd(top: -9, end: -5),
                  badgeContent: Text("8",
                      style: const TextStyle(fontWeight: FontWeight.w500)),
                  badgeColor: const Color(0xFF7F7A93),
                  child: Stack(
                    fit: StackFit.passthrough,
                    children: [
                      Container(
                        height: 190.0,
                        width: 280.0,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              // spreadRadius: ,
                              blurRadius: 4,
                              offset: Offset(4, 8),
                            ),
                          ],
                          borderRadius:
                              const BorderRadius.all(const Radius.circular(16)),
                          image: DecorationImage(
                              // colorFilter: ColorFilter.mode(
                              //     const Color(0xFF7F7A93).withOpacity(1.0),
                              //     BlendMode.srcATop),
                              image: AssetImage(chooseImg()),
                              fit: BoxFit.cover),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 190,
                          width: 250,
                          child: const Center(
                            child: Text(
                              " ",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -5,
                        right: -5,
                        // top: -5,
                        child: TextButton(
                          onPressed: () => cardkey.currentState?.toggleCard(),
                          style: const ButtonStyle(),
                          // padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              const Icon(Icons.info_rounded,
                                  color: Colors.white)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              back: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: Offset(4, 6),
                  ),
                ]),
                child: Badge(
                  elevation: 10,
                  position: BadgePosition.topEnd(top: -9, end: -5),
                  badgeContent: Text("8",
                      style: const TextStyle(fontWeight: FontWeight.w500)),
                  badgeColor: const Color(0xFF7F7A93),
                  child: Stack(
                    //fit: StackFit.passthrough,
                    children: [
                      Container(
                        height: 190.0,
                        width: 320.0,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          image: DecorationImage(
                              // colorFilter: ColorFilter.mode(
                              //     Colors.black.withOpacity(0.2),
                              //     BlendMode.srcATop),
                              image: AssetImage(chooseImg()),
                              fit: BoxFit.cover),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 190.0,
                          width: 250.0,
                          child: const Center(
                            child: const Text(
                              "BACK",
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -5,
                        right: -5,
                        // top: -5,
                        child: TextButton(
                          onPressed: () => cardkey.currentState?.toggleCard(),

                          style: const ButtonStyle(),
                          // padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              const Icon(Icons.info_rounded,
                                  color: Colors.white)
                            ],
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
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: profileController.residenceFiscall == "uk"
                      ? Text(
                          "Marché France",
                          // style: TextStyle(color: Colors.white),
                        )
                      : Text("Marché Royaume-Uni"),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text("Votre ingénieur patrimonial"),
                )
              ],
            ),
            SizedBox(
              width: 10,
            ),
            ClipOval(
              child: Image.asset(
                expertController.experts[1]!.url,
                height: 40,
                width: 40,
              ),
            )
          ],
        ),
      ],
    );
  }
}

class Card3home extends StatelessWidget {
  const Card3home({
    Key? key,
  }) : super(key: key);

  String chooseImg() {
    if (profileController.residenceFiscall == "france") {
      return ('assets/Uk-image.jpg');
    } else if (profileController.residenceFiscall == "uk") {
      return ('assets/france.jpg');
    } else {
      return ('assets/suisse.jpg');
    }
  }

  @override
  Widget build(BuildContext context) {
    FlipCardController controller = FlipCardController();

    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 20, top: 5, bottom: 15),
          child: GestureDetector(
            onTap: () => Get.to(const DashboardPage()),
            child: FlipCard(
              fill: Fill.fillBack,
              direction: FlipDirection.HORIZONTAL,
              //flipOnTouch: false,
              front: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: Offset(4, 6),
                  ),
                ]),
                child: Badge(
                  elevation: 10,
                  position: BadgePosition.topEnd(top: -9, end: -5),
                  badgeContent: Text("6",
                      style: const TextStyle(fontWeight: FontWeight.w500)),
                  badgeColor: const Color(0xFF7F7A93),
                  child: Stack(
                    fit: StackFit.passthrough,
                    children: [
                      Container(
                        height: 190.0,
                        width: 280.0,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.9),
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: Offset(8, 16),
                            ),
                          ],
                          borderRadius:
                              const BorderRadius.all(const Radius.circular(16)),
                          image: DecorationImage(
                              // colorFilter: ColorFilter.mode(
                              //     const Color(0xFF7F7A93).withOpacity(1.0),
                              //     BlendMode.srcATop),
                              image: AssetImage('assets/suisse.jpg'),
                              fit: BoxFit.cover),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 190,
                          width: 250,
                          child: const Center(
                            child: Text(
                              " ",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -5,
                        right: -5,
                        // top: -5,
                        child: TextButton(
                          onPressed: () => controller.toggleCard(),
                          style: const ButtonStyle(),
                          // padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              const Icon(Icons.info_rounded,
                                  color: Colors.white)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              back: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: Offset(4, 6),
                  ),
                ]),
                child: Badge(
                  elevation: 10,
                  position: BadgePosition.topEnd(top: -9, end: -5),
                  badgeContent: Text("6",
                      style: const TextStyle(fontWeight: FontWeight.w500)),
                  badgeColor: const Color(0xFF7F7A93),
                  child: Stack(
                    //fit: StackFit.passthrough,
                    children: [
                      Container(
                        height: 190.0,
                        width: 320.0,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          image: DecorationImage(
                              // colorFilter: ColorFilter.mode(
                              //     Colors.black.withOpacity(0.2),
                              //     BlendMode.srcATop),
                              image: AssetImage(chooseImg()),
                              fit: BoxFit.cover),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 190.0,
                          width: 250.0,
                          child: const Center(
                            child: const Text(
                              "BACK",
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.white),
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
        const Text("Marché Suisse"),
        Text("Votre ingénieur patrimonial"),
      ],
    );
  }
}
