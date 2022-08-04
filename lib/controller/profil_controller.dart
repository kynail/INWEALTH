import 'dart:ffi';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:inwealth/controller/pisteReflexion_controller.dart';
import 'package:inwealth/model/profile.dart';
import 'package:inwealth/utils/data/data_model.dart';
import 'package:inwealth/view/dashboardBody_page.dart';
import 'package:inwealth/view/document_page.dart';
import 'package:inwealth/view/meeting_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/data/user_token_transfert.dart';

class ProfilController extends GetxController {
  String residenceFiscall = "";
  String userId = "";
  bool endProject = false;
  String phone = "";
  String indic = "";
  String mdp = "";
  bool islog = false;
  List<String> listProjet = [];
  DateTime? meeting;
  bool cederEntreprise = false;
  bool transmettreEntreprise  = false;
  bool matriserImpot = false;

  //projet générale 
  String project = "";
  String horizon = "";
  String etapeParcours = "reflexion";

  //projet fr
  String valorisation = "";
  String changementResi = "";
  String elementEtranger = "";
  String secteurActivite = "";
  bool groupe = false;
  String formeJuridique = "";
  bool ifHolding = false;
  bool ifImmoExploit = false;
  String immobilierExploitation = "";
  int currentIndex = 0;

  //projet uk
  String locality = "";
  String type = "";
  String marketValue = "";

  //marital question
  String nationality = "";
  String gender = "";
  String name = "";
  String age = "0";
  String ageWife = "0";
  String maritalStatus = "";
  String regimeMatrimonial = "";
  String childResidenceFisc = "";
  bool haveChild = false;
  String minorChild = "0";
  String adultChild = "0";
  bool enfantHandic = false;
  bool petitEnfant = false;
  String nbrpetitEnfant = "0";



  // wealth questions
  String wealth = "";
  String grossAnual = "0";
  String annualLoan = "0";
  String loan = "0";
  String netRessources = "0";
  String financialBank = "0";
  String pensionsFunds = "0";


  List<Widget> widgetOptions = <Widget>[
    dashboardBodyPage(),
    DocumentPage(),
    MeetingPage(),
    Text(
      'Index 3: Settings',
    ),
  ];

  
  List<String> rtnThinking = [];
  List<String> keythink = [];


  File? doc;
  UserTokenTransfert? userToken;
  ProjetTokenTransfert? listProjetEnd;
  bool finish = false;
  DateTime? date;
  SharedPreferences? prefs;
  final resFisController = TextEditingController();
  Brightness? brightness;
}
