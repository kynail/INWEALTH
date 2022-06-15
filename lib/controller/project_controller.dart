import 'package:get/get.dart';

class Project {
  String name = "";
  String nbrquestions = "";
  String nbrtemps  = "";
  int complete = 0;
  bool isfinish = false;
}

class ProjectController extends GetxController {
  Project? cederEntreprise;
  Project? purchaseEstate;
}