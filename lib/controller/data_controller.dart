import 'dart:convert';

import 'package:get/get.dart';
import 'package:inwealth/controller/pisteReflexion_controller.dart';
import 'package:inwealth/utils/data/data_provider.dart';
import 'package:inwealth/utils/data/retained_thinking_transformer.dart';
import 'package:inwealth/utils/data/retained_thinkings_transfert.dart';
import 'package:inwealth/utils/data/user_token_transfert.dart';
import 'package:inwealth/view/onboard_page.dart';

class DataController extends GetxController {
  Future<UserTokenTransfert> modifUser() async {
    print("test ID ID " + profileController.userId);

    String path = "/user/updateProfil/" + profileController.userId;
    // DataProvider.post(path, body: {"residenceFiscale":"France", "nationalite":"france"}).then((response)
    // {UserTokenTransfert.fromJson(jsonDecode(response.body));
    // profileController.userId = response.body;});
    // print(profileController.userId);
    return DataProvider.put(path, body: {
      "residenceFiscale": profileController.residenceFiscall,
      "nationalite": profileController.nationality,
      "changementResidence": profileController.changementResi,
      "situationFamille": profileController.maritalStatus,
      "regimeMatrimonial": profileController.regimeMatrimonial,
      "elementEtranger": profileController.elementEtranger,
      "enfantMineur": int.parse(profileController.minorChild),
      "enfantMajeur": int.parse(profileController.adultChild),
      "enfantHandicape": profileController.enfantHandic,
      "petitEnfant": profileController.petitEnfant,
      "nbrePetitEnfant": int.parse(profileController.nbrpetitEnfant),
      "age": int.parse(profileController.age),
      "ageConjoint": int.parse(profileController.ageWife),
      "niveauFortune": profileController.wealth,
      "montantTrainDeVie": int.parse(profileController.grossAnual),
      "revenuNetHorsImpot": int.parse(profileController.annualLoan),
      "revenuNetImposable": int.parse(profileController.loan),
      // "chargeDontImpot":int.parse(profileController.netRessources),
      "ValorisationSteGroupe": int.parse(profileController.financialBank),
      "secteurActivite": profileController.secteurActivite,
      "detentionImmoExploitation": profileController.immobilierExploitation,
      "groupe": profileController.ifHolding,
      "formeJuridique": profileController.formeJuridique,
      "locality": profileController.locality,
      "type": profileController.type,
      "marketValue": profileController.marketValue,
      "cederEntreprise": profileController.cederEntreprise,
      "transmettreEntreprise": profileController.transmettreEntreprise,
      "matriserImpot": profileController.matriserImpot
    }).then(
        (response) => UserTokenTransfert.fromJson(jsonDecode(response.body)));
  }

  Future<UserTokenTransfert> addParcours() async {
    print("test " + profileController.userId);

    String path = "/parcours/save/" + profileController.userId;
    // DataProvider.post(path, body: {"residenceFiscale":"France", "nationalite":"france"}).then((response)
    // {UserTokenTransfert.fromJson(jsonDecode(response.body));
    // profileController.userId = response.body;});
    // print(profileController.userId);
    return DataProvider.post(path, body: {
      "typeParcours": profileController.project,
      "horizon": profileController.horizon,
      "etapeParcours": profileController.etapeParcours,
    }).then(
        (response) => UserTokenTransfert.fromJson(jsonDecode(response.body)));
  }

  Future<PisteTokenTransfert> getPistes() async {
    print("test " + profileController.userId);

    String path = "/user/listePiste/" + profileController.userId;
    // DataProvider.post(path, body: {"residenceFiscale":"France", "nationalite":"france"}).then((response)
    // {UserTokenTransfert.fromJson(jsonDecode(response.body));
    // profileController.userId = response.body;});
    // print(profileController.userId);
    return DataProvider.fetch(path).then(
        (response) => PisteTokenTransfert.fromJson(jsonDecode(response.body)));
  }

  Future<PisteTokenTransfert> getParcoursThinkings(String userGuid) async {
    String path = "/user/listePiste/$userGuid";
    return DataProvider.fetch(path).then(
        (response) => PisteTokenTransfert.fromJson(jsonDecode(response.body)));
  }

  // Future<PisteTokenTransfert> postRetainedThinking(String userGuid) async {
  //   String path = "/savePiste/$userGuid";
  //   return DataProvider.post(path, body: {
  //     "pisteReflexion":
  //       profileController.rtnThinking
  //       ,

  //   }).then(
  //       (response) => PisteTokenTransfert.fromJson(jsonDecode(response.body)));
  // }

  Future<bool> postRetainedThinking(
    String userGuid,
    // List<Thinking> retainedThinkings,
  ) {
    String path = "/piste/savePiste/$userGuid";
    // RetainedThinkingTransfert body =
    //     RetainedThinkingTransformer.toRetainedThinkingTransfert(
    //         retainedThinkings);
    // print("save thinking");
    List<Thinking>;
    String jsonTags =
        jsonEncode({"pisteReflexion": profileController.keythink});
    print("print save thinking : " + jsonTags);
    return DataProvider.post2(path, body: profileController.keythink)
        .then((_) => true);
  }

  Future<UserTokenTransfert> postFinishProject(
    String userGuid,
  ) {
    String path = "/france/saveProject/$userGuid";
    print("ceder entreprise TESTEST : " +
        profileController.cederEntreprise.toString());
    return DataProvider.post(path, body: {
      "cederEntreprise": profileController.cederEntreprise,
      "transmettreEntreprise": profileController.transmettreEntreprise,
      "matriserImpot": profileController.matriserImpot
    }).then(
        (response) => UserTokenTransfert.fromJson(jsonDecode(response.body)));
  }

  Future<ProjetTokenTransfert> getListeProjet(String userGuid) async {
    String path = "/france/getInfoProjet/$userGuid";
    return DataProvider.fetch(path).then(
        (response) => ProjetTokenTransfert.fromJson(jsonDecode(response.body)));
  }

  Future<MeetingTokenTransfert> postMeeting(
    String userGuid,
  ) {
    String path = "/meeting/saveMeeting/$userGuid";
    print("ceder entreprise TESTEST : " + profileController.date.toString());
    return DataProvider.post(path, body: {
      "meeting": profileController.date!.millisecondsSinceEpoch,
    }).then(
        (response) => MeetingTokenTransfert.fromJson(jsonDecode(response.body)));
  }

  Future<MeetingTokenTransfert> getMeeting(String userGuid) async {
    String path = "/meeting/getMeeting/$userGuid";
    return DataProvider.fetch(path).then(
        (response) => MeetingTokenTransfert.fromJson(jsonDecode(response.body)));
  }

    Future<LoginTokenTransfert> postLogin(
    String userGuid,
  ) {
    String path = "/login/saveLogin/$userGuid";
    print("ceder entreprise TESTEST : " + profileController.date.toString());
    return DataProvider.post(path, body: {
      "phone": profileController.phone,
      "indic": profileController.indic,
      "mdp": profileController.mdp,
      "iflog": profileController.iflog,
    }).then(
        (response) => LoginTokenTransfert.fromJson(jsonDecode(response.body)));
  }

  Future<LoginTokenTransfert> getLogin(String userGuid) async {
    String path = "/login/getLogin/$userGuid";
    return DataProvider.fetch(path).then(
        (response) => LoginTokenTransfert.fromJson(jsonDecode(response.body)));
  }
}
