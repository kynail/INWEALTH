import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:inwealth/model/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/data/user_token_transfert.dart';

class ProfilController extends GetxController {
  String residenceFiscall = "";
  String userId = "";

  //projet générale 
  String project = "";
  bool endProject = false;
  // String maritalstatus = "";


  //projet fr
  String valorisation = "";
  String changementResi = "";
  String elementEtranger = "";
  String secteurActivite = "";
  String immoExploitation = "";
  bool groupe = false;
  String formeJuridique = "";

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


  
  UserTokenTransfert? userToken;
  bool finish = false;
  DateTime? date;
  SharedPreferences? prefs;
  final resFisController = TextEditingController();
}
