import 'package:get/get.dart';
import 'package:inwealth/controller/pisteReflexion_controller.dart';
import 'package:inwealth/controller/thinking_transfert.dart';

import 'data/data_model.dart';

class Parameters {
  // liste business sectors
  List<DataModel> businessSectors = [
    DataModel(
      name: "Industrie",
      key: "industrie",
    ),
    DataModel(
      name: "BTP",
      key: "BTP",
    ),
    DataModel(
      name: "Négoce et distribution",
      key: "Negoce",
    ),
    DataModel(
      name: "Santé",
      key: "sante",
    ),
    DataModel(
      name: "Restauration",
      key: "restauration",
    ),
    DataModel(
      name: "Hôtellerie",
      key: "hotellerie",
    ),
    DataModel(
      name: "Services",
      key: "services",
    ),
    DataModel(
      name: "Informatique",
      key: "informatique",
    ),
    DataModel(
      name: "Autres",
      key: "autre",
    ),
  ];

  List<ProjectModel> purposesfr = [
    ProjectModel(name: "Ceder son entreprise", key: "cederEntreprise", temps: "8", question: "12"),
    ProjectModel(name: "transmettre son entreprise à un tier", key: "france", temps: "8", question: "12"),
    ProjectModel(name: "maitriser son impot sur la fortune", key: "france",  temps: "8", question: "12"),
    // AppLocalizations.of(context)?.translate('selling_biz', 0) ?? "humk ",
  ];

  // list pays + traduction
  List<DataModel> country = [
    DataModel(name: 'France'.tr, key: "france"),
    DataModel(name: 'Suisse'.tr, key: "suisse"),
    DataModel(name: 'Belgique'.tr, key: "belgique"),
    DataModel(name: 'Luxembourg'.tr, key: "luxembourg"),
    DataModel(name: 'Monaco'.tr, key: "monaco"),
    DataModel(name: 'Royaume-Uni'.tr, key: "uk"),
    DataModel(name: 'Russie'.tr, key: "russie"),
    DataModel(name: 'Italie'.tr, key: "italie"),
    DataModel(name: 'Espagne'.tr, key: "espagne"),
    DataModel(name: 'Allemagne'.tr, key: "allemagne"),
  ];

  List<DataModel> nationality = [
    DataModel(name: 'French', key: "france"),
    DataModel(name: 'Swiss', key: "suisse"),
    DataModel(name: 'Belgian', key: "belgique"),
    DataModel(name: 'Luxembourgish', key: "luxembourg"),
    DataModel(name: 'Monegasque', key: "monaco"),
    DataModel(name: 'British', key: "uk"),
    DataModel(name: 'Russian', key: "russie"),
    DataModel(name: 'Italian', key: "italie"),
    DataModel(name: 'Spanish', key: "espagne"),
    DataModel(name: 'German', key: "allemagne"),
  ];

  List<DataModel> familySituations = [
    DataModel(
      name: "Célibataire",
      // hasPartner: false,
      // hasMatrimonialPropertyRegime: false,
      key: "celibataire",
    ),
    DataModel(
      name: "Divorcé(e)",
      // hasPartner: false,
      // hasMatrimonialPropertyRegime: false,
      key: "divorce",
    ),
    DataModel(
      name: "Veuf(ve)",
      // hasPartner: false,
      // hasMatrimonialPropertyRegime: false,
      key: "veuf",
    ),
    DataModel(
      name: "Marié(e)",
      // hasPartner: true,
      // hasMatrimonialPropertyRegime: true,
      key: "marie",
    ),
    DataModel(
      name: "Pacsé(e)",
      // hasPartner: true,
      // hasMatrimonialPropertyRegime: false,
      key: "pacse",
    ),
    DataModel(
      name: "Concubinage",
      // hasPartner: true,
      // hasMatrimonialPropertyRegime: false,
      key: "concubinage",
    ),
  ];

  List<DataModel> matrimonialRegimes = [
    DataModel(
      name: "Communauté réduite aux acquêts",
      key: "communauteReduite",
    ),
    DataModel(
      name: "Séparation de biens",
      key: "separationBien",
    ),
    DataModel(
      name: "Participation aux acquêts",
      key: "participationAcquet",
    ),
    DataModel(
      name: "Communauté universelle",
      key: "communauteUniverselle",
    ),
  ];

  List<DataModel> legalForms = [
    DataModel(
      name: "Société Anonyme (SA)",
      key: "sa",
    ),
    DataModel(
      name: "Société à Responsabilité Limitée (SARL)",
      key: "sarl",
    ),
    DataModel(
      name: "Société Anonyme Simplifiée (SAS)",
      key: "sas",
    ),
    DataModel(
      name: "Société en Nom Collectif (SNC)",
      key: "snc",
    ),
    DataModel(
      name: "Société Civile (SC)",
      key: "sc",
    ),
  ];

  List<DataModel> operatingRealEstateTypes = [
    DataModel(
      name: "À l'actif de la Société",
      key: "societe",
    ),
    DataModel(
      name: "En dehors de la Société",
      key: "horsSociete",
    ),
    DataModel(
      name: "À l'actif et en dehors de la Société",
      key: "societeEtHorsSociete",
    ),
  ];

  List<DataModel> horizons = [
    DataModel(
      name: "Inférieur à 1 an",
      key: "inf1",
    ),
    DataModel(
      name: "Entre 1 et 3 ans",
      key: "entre1et3",
    ),
    DataModel(
      name: "Entre 3 et 4 ans",
      key: "entre3et4",
    ),
    DataModel(
      name: "Entre 4 et 6 ans",
      key: "entre4et6",
    ),
    DataModel(
      name: "Supérieur à 6 ans",
      key: "sup6",
    ),
  ];

  static List<ThinkingTransfert> thinkings = [
    ThinkingTransfert(
      id: 1,
      key: "fboImmoEntreprise",
      name: "Céder l'immobilier d'entreprise à une SCI familiale",
      url:
          "https://www.canva.com/design/DAEpvaZyq1k/1B5cGae1ehLiFHBRg2NK4Q/watch?utm_content=DAEpvaZyq1k&utm_campaign=designshare&utm_medium=link&utm_source=publishsharelink",
    ),
    ThinkingTransfert(
      id: 2,
      key: "donationPetitEnfant",
      name: "Donner en faveur de vos petits-enfants",
      url:
          "https://www.canva.com/design/DAEpvJ5kH7I/nj6wJLV4JkaVs46eiaQn1A/watch?utm_content=DAEpvJ5kH7I&utm_campaign=designshare&utm_medium=link&utm_source=publishsharelink",
    ),
    ThinkingTransfert(
      id: 3,
      key: "donationAvantCessionEnfant",
      name: "Donner aux enfants des titres avant leur cession",
      url:
          "https://www.canva.com/design/DAEptQXgzlU/nMHh9U4QO0P3NlkpRheF-w/watch?utm_content=DAEptQXgzlU&utm_campaign=designshare&utm_medium=link&utm_source=publishsharelink",
    ),
    ThinkingTransfert(
      id: 4,
      key: "paiementDiffere",
      name: "Acquitter les droits de donation en différé et fractionné",
      url:
          "https://www.canva.com/design/DAEpttdzj-s/94e2dZwdgMtAVQ9kjjkmIQ/watch?utm_content=DAEpttdzj-s&utm_campaign=designshare&utm_medium=link&utm_source=publishsharelink",
    ),
    ThinkingTransfert(
      id: 6,
      key: "remploiPdtCessionScpCapi",
      name:
          "Souscrire un contrat de capitalisation : remploi du produit de cession démembré",
      url:
          "https://www.canva.com/design/DAEptjlVauI/K_zJQrLXOJnJK2KIOuyhLQ/watch?utm_content=DAEptjlVauI&utm_campaign=designshare&utm_medium=link&utm_source=publishsharelink",
    ),
    ThinkingTransfert(
      id: 7,
      key: "dutreil",
      name:
          "Conclure un Pacte Dutreil : 75% d'abattement sur l'assiette taxable",
      url:
          "https://www.canva.com/design/DAEpt-ttYU4/qTED8O7cMVr0V5u1bbovfg/watch?utm_content=DAEpt-ttYU4&utm_campaign=designshare&utm_medium=link&utm_source=publishsharelink",
    ),
    ThinkingTransfert(
      id: 8,
      key: "simplificationGroupe",
      name: "Simplifier l'organigramme du groupe",
      url:
          "https://www.canva.com/design/DAEpucnQrp8/sJxM3xaeGPjKohgteboMKQ/watch?utm_content=DAEpucnQrp8&utm_campaign=designshare&utm_medium=link&utm_source=publishsharelink",
    ),
    ThinkingTransfert(
      id: 9,
      key: "ddv",
      name:
          "Augmenter les droits du conjoint dans la succession : la donation au dernier vivant",
      url:
          "https://www.canva.com/design/DAEpuKhxjRQ/lBn-tM2f14NCQcVWIj4Pyw/watch?utm_content=DAEpuKhxjRQ&utm_campaign=designshare&utm_medium=link&utm_source=publishsharelink",
    ),
    ThinkingTransfert(
      id: 10,
      key: "steAcquet",
      name: "Aménager votre régime séparatiste : la clause de société acquêts",
      url:
          "https://www.canva.com/design/DAEpxzxv_u8/rvKbPI6TZHmT9geq7BHz-Q/watch?utm_content=DAEpxzxv_u8&utm_campaign=designshare&utm_medium=link&utm_source=publishsharelink",
    ),
    ThinkingTransfert(
      id: 11,
      key: "donationPpConjoint",
      name: "Donner en faveur de votre conjoint",
      url:
          "https://www.canva.com/design/DAEpt-yztIA/Kp09XmhJK7ozNp7iGo1cAQ/watch?utm_content=DAEpt-yztIA&utm_campaign=designshare&utm_medium=link&utm_source=publishsharelink",
    ),
    ThinkingTransfert(
      id: 12,
      key: "signerPacs",
      name: "Conclure un PACS",
      url:
          "https://www.canva.com/design/DAEpuY9s0Ds/AF8l_EWmt_b4e_NeUHhbew/watch?utm_content=DAEpuY9s0Ds&utm_campaign=designshare&utm_medium=link&utm_source=publishsharelink",
    ),
    ThinkingTransfert(
      id: 13,
      key: "assVieAvant70Sdb",
      name: "Souscrire un contrat d'assurance-vie pour protéger vos proches",
      url:
          "https://www.canva.com/design/DAEpuEzCiu0/Gv9s85jZDUMRRPRsMu3i1w/watch?utm_content=DAEpuEzCiu0&utm_campaign=designshare&utm_medium=link&utm_source=publishsharelink",
    ),
    ThinkingTransfert(
      id: 14,
      key: "assVieAvant70Cte",
      name: "Souscrire un contrat d'assurance-vie pour protéger vos proches",
      url:
          "https://www.canva.com/design/DAEpuH58O7U/KX2xDGZ3OW_NAs12XlO6Ug/watch?utm_content=DAEpuH58O7U&utm_campaign=designshare&utm_medium=link&utm_source=publishsharelink",
    ),
    ThinkingTransfert(
      id: 15,
      key: "assuranceVie",
      name: "Souscrire un contrat d'assurance-vie",
      url:
          "https://www.canva.com/design/DAEptBDOPtk/Vj5epqlOVFgxuOFzKfhYFQ/watch?utm_content=DAEptBDOPtk&utm_campaign=designshare&utm_medium=link&utm_source=publishsharelink",
    ),
    ThinkingTransfert(
      id: 16,
      key: "assVieIr",
      name: "Effectuer des rachats périodiques sur un contrat d'assurance-vie",
      url:
          "https://www.canva.com/design/DAEpuJ0m3n8/6p2iU2m92JUxrnUfDrcYNg/watch?utm_content=DAEpuJ0m3n8&utm_campaign=designshare&utm_medium=link&utm_source=publishsharelink",
    ),
    ThinkingTransfert(
      id: 17,
      key: "garantieActifPassif",
      name: "Rédiger la clause de  garantie d'actif-passif",
      url:
          "https://www.canva.com/design/DAEpWCYhHuw/oITZPYfb1biVBNN5I_dM0Q/watch?utm_content=DAEpWCYhHuw&utm_campaign=designshare&utm_medium=link&utm_source=publishsharelink",
    ),
    ThinkingTransfert(
      id: 18,
      key: "ipvFiscalite",
      name: "Acquisition costs and real estate wealth tax 'IFI'",
      url:
          "https://www.canva.com/design/DAFAsPOA4e8/stgcfq5QqgtTdPmx58NUYQ/watch?utm_content=DAFAsPOA4e8&utm_campaign=designshare&utm_medium=link&utm_source=publishsharelink",
    ),
    ThinkingTransfert(
      id: 19,
      key: "nlleActivite",
      name:
          "Apporter vos titres à une société pour démarrer une nouvelle activité",
      url:
          "https://www.canva.com/design/DAElXu5ykP8/H9ps5ZxnqLZfqt-lMNxy3g/watch?utm_content=DAElXu5ykP8&utm_campaign=designshare&utm_medium=link&utm_source=publishsharelink",
    ),
    ThinkingTransfert(
      id: 20,
      key: "devPatImmoEndettement",
      name: "Acquérir un bien immobilier locatif",
      url:
          "https://www.canva.com/design/DAEpuF1loR0/AdVOVWgf3NnqOZqwH2TkVg/watch?utm_content=DAEpuF1loR0&utm_campaign=designshare&utm_medium=link&utm_source=publishsharelink",
    ),
    ThinkingTransfert(
      id: 21,
      key: "fboImmo",
      name: "Céder l'immobilier locatif à une SCI familiale",
      url:
          "https://www.canva.com/design/DAEptpd0TyU/nvS2xq0DJAzcyHXyBoeYjw/watch?utm_content=DAEptpd0TyU&utm_campaign=designshare&utm_medium=link&utm_source=publishsharelink",
    ),
  ];

  List<DataModel> fortuneLevels = [
    DataModel(name: "Inférieur à 2 M €", key: "inf2"),
    DataModel(name: "Entre 2 et 5 M €", key: "entre2et5"),
    DataModel(name: "Entre 5 et 10 M €", key: "entre5et10"),
    DataModel(name: "Entre 10 et 20 M €", key: "entre10et20"),
    DataModel(name: "Supérieur à 20 M €", key: "sup20"),
  ];
}
