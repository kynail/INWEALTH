import 'dart:convert';

import 'package:get/get.dart';
import 'package:inwealth/utils/data/data_provider.dart';
import 'package:inwealth/utils/data/user_token_transfert.dart';
import 'package:inwealth/view/onboard_page.dart';




class DataController extends GetxController {

  Future<UserTokenTransfert> modifUser() async {
    print("test" + profileController.userId);

    String path = "/user/updateProfil/"+ profileController.userId;
    // DataProvider.post(path, body: {"residenceFiscale":"France", "nationalite":"france"}).then((response) 
    // {UserTokenTransfert.fromJson(jsonDecode(response.body));
    // profileController.userId = response.body;});
    // print(profileController.userId);
    return DataProvider.put(path, body: {
    "residenceFiscale":profileController.residenceFiscall,  
    "nationalite":profileController.nationality,
    "changementResidence":profileController.changementResi,
    "situationFamille":profileController.maritalStatus,
    "regimeMatrimonial":profileController.regimeMatrimonial,
    "elementEtranger":profileController.elementEtranger,
    "enfantMineur":int.parse(profileController.minorChild),
    "enfantMajeur":int.parse(profileController.adultChild),
    "enfantHandicape":profileController.enfantHandic,
    "petitEnfant":profileController.petitEnfant,
    "nbrePetitEnfant":int.parse(profileController.nbrpetitEnfant),
    "age":int.parse(profileController.age),
    "ageConjoint":int.parse(profileController.ageWife),
    "niveauFortune":profileController.wealth,
    "montantTrainDeVie":int.parse(profileController.grossAnual),
    "revenuNetHorsImpot":int.parse(profileController.annualLoan),
    "revenuNetImposable":int.parse(profileController.loan),
    // "chargeDontImpot":int.parse(profileController.netRessources),
    "ValorisationSteGroupe":int.parse(profileController.financialBank),
    "secteurActivite":profileController.secteurActivite,
    "detentionImmoExploitation":profileController.immoExploitation,
    "groupe":profileController.formeJuridique
    })
    .then(
        (response) => UserTokenTransfert.fromJson(jsonDecode(response.body)));
  }

}