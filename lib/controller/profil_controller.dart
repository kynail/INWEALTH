import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:inwealth/model/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/data/user_token_transfert.dart';

class ProfilController extends GetxController {
  String residenceFiscall = "";
  String userId = "";
  String project = "";
  // String maritalstatus = "";
  String locality = "";
  String type = "";
  String marketValue = "";
  String gender = "";
  String name = "";
  String nationality = "";
  String age = "";
  String ageWife = "";
  String maritalStatus = "";
  String childResidenceFisc = "";
  bool haveChild = false;
  String minorChild = "";
  String adultChild = "";
  String wealth = "";
  String grossAnual = "0";
  String annualLoan = "0";
  String loan = "0";
  String netRessources = "";
  String financialBank = "0";
  String pensionsFunds = "0";
  UserTokenTransfert? userToken;
  bool finish = false;
  DateTime? date;
  SharedPreferences? prefs;
  final resFisController = TextEditingController();
}
