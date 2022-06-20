import 'dart:io';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:inwealth/controller/data_controller.dart';
import 'package:inwealth/model/list.dart';
import 'package:inwealth/view/dashboardProject_page.dart';
import 'package:inwealth/view/document_page.dart';
import 'package:inwealth/view/onboard_page.dart';
import 'package:inwealth/view/pisteReflexion_page.dart';
import 'package:inwealth/view/ressources_page.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:collection';
import 'package:flip_card/flip_card.dart';
import 'package:badges/badges.dart';
import 'package:dio/dio.dart';
import 'dart:math';
import '../../model/profile.dart';
import '../controller/expert_controller.dart';
import '../controller/profil_controller.dart';
import '../controller/store_controller.dart';
import '../utils/customCard.dart';
import '../utils/translations.dart';
import 'package:inwealth/view/projet_page.dart';

import 'meeting_page.dart';

class dashboardBodyPage extends StatefulWidget {
  dashboardBodyPage({Key? key}) : super(key: key);

  @override
  State<dashboardBodyPage> createState() => _dashboardBodyPageState();
}

DataController test = DataController();

ahtchoum() {
  test.getPistes().then((value) {
    if (thinking.think == null) {
      thinking.think = value;
      print("think token : " + thinking.think.toString());
      thinking.pisteExperte = value.expertThinkings;
      print("Piste experte : " + thinking.pisteExperte.toString());
      thinking.pistePrioritaire = value.priorityThinkings;
      print("Piste prioritaire : " + thinking.pisteNonPrioritaire.toString());
      thinking.pisteNonPrioritaire = value.nonPriorityThinkings;
      print("Piste non prioritaire : " + thinking.pisteNonPrioritaire.toString());

    }
      print("Piste experte : " + thinking.pisteExperte.toString());

    // thinking.piste = value.retainedThinkings[1];
    print("test récupération pistes ok ");
    // print(thinking.piste);
    // thinking.piste = va
    // profileController.userId = value.id;
    // prefs!.setString('userID', profileController.userToken!.id);
    // print("valuuuue : " + value.id.toString());
    // print("value 2 : " + profileController.userToken!.id);
  });
}



class _dashboardBodyPageState extends State<dashboardBodyPage> {
  Color purp1 = Color(0xFF5E5B74);
  Color purp2 = Color(0xFF272243);
  Color gold1 = Color(0xFFD5C6AC);
  Color gold2 = Color(0xFFBAAB90);
  Color gold3 = Color(0xFF97876A);
  Expert? expert = expertController.experts[1];
  
  @override
void initState() {
  print("humhumhumhum");
  ahtchoum();
  super.initState();
  
}
  
  @override
  Widget build(BuildContext context) {
    expertController.docu = false;
    // expertController.appbarCalendar = false;
    return Scaffold(
      body: Column(children: [
        Container(
          height: 20,
        ),
        Container(
          width: 400,
          decoration: BoxDecoration(
            color: gold1,
            border: Border.all(
              color: purp1,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child:
              Center(child: Text("My project\n" + profileController.project)),
        ),
        Container(
          height: 20,
        ),
        TextButton(
          onPressed: () {
            Get.to(RessourcesPage());
          },
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                child: ClipOval(
                  child: Image.asset(
                    expert!.url,
                    height: 75,
                    width: 75,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        expert!.name,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Ingénieur Patrimonial",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 5),
                      ),
                      Text(
                        "Expert Marché France",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Icon(
                  Icons.chevron_right,
                  color: gold2,
                ),
              )
            ],
          ),
        ),
        Container(
          height: 40,
        ),
        TextButton(
            onPressed: () {
              expertController.docu = true;
              Get.to(DocumentPage());
            },
            child: Row(children: [
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          AppLocalizations.of(context)
                                  ?.translate('Button_Doc_fini', 1) ??
                              "Consulter mon document Solution Patrimoniale",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 40,
                        child: Row(
                          children: [
                            Expanded(
                              child: Image.asset(
                                "assets/icons/efl_colored_new.png",
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(5)),
                            Expanded(
                              child: Image.asset(
                                "assets/icons/mazars_colored.png",
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  decoration: BoxDecoration(
                      color: gold1, borderRadius: BorderRadius.circular(25)),
                  child: Icon(Icons.arrow_forward, color: Colors.white),
                ),
              )
            ])),
        Container(
          height: 40,
        ),
        TextButton(
          child: Text(
            "View and add for thought",
            style: TextStyle(
              color: gold3,
            ),
          ),
          onPressed: () {
            print("clic bouton think : " + thinking.pisteExperte.toString());
            Get.to(pisteReflexion());
            },
        )
      ]),
    );
  }
}
