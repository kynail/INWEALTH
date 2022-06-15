import 'package:get/get.dart';

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

  List<DataModel> thinkings = [
    DataModel(
      key: "fboImmoEntreprise",
      name: "Céder l'immobilier d'entreprise à une SCI familiale",
    ),
    DataModel(
      key: "donationPetitEnfant",
      name: "Donner en faveur de vos petits-enfants",
    ),
    DataModel(
      key: "donationAvantCessionEnfant",
      name: "Donner aux enfants des titres avant leur cession",
    ),
    DataModel(
      key: "paiementDiffere",
      name: "Acquitter les droits de donation en différé et fractionné",
    ),
    DataModel(
      key: "remploiPdtCessionScpCapi",
      name:
          "Souscrire un contrat de capitalisation : remploi du produit de cession démembré",
    ),
    DataModel(
      key: "dutreil",
      name:
          "Conclure un Pacte Dutreil : 75% d'abattement sur l'assiette taxable",
    ),
    DataModel(
      key: "simplificationGroupe",
      name: "Simplifier l'organigramme du groupe",
    ),
    DataModel(
      key: "ddv",
      name:
          "Augmenter les droits du conjoint dans la succession : la donation au dernier vivant",
    ),
    DataModel(
      key: "steAcquet",
      name: "Aménager votre régime séparatiste : la clause de société acquêts",
    ),
    DataModel(
      key: "donationPpConjoint",
      name: "Donner en faveur de votre conjoint",
    ),
    DataModel(
      key: "signerPacs",
      name: "Conclure un PACS",
    ),
    DataModel(
      key: "assVieAvant70Sdb",
      name: "Souscrire un contrat d'assurance-vie pour protéger vos proches",
    ),
    DataModel(
      key: "assVieAvant70Cte",
      name: "Souscrire un contrat d'assurance-vie pour protéger vos proches",
    ),
    DataModel(
      key: "assuranceVie",
      name: "Souscrire un contrat d'assurance-vie",
    ),
    DataModel(
      key: "assVieIr",
      name: "Effectuer des rachats périodiques sur un contrat d'assurance-vie",
    ),
    DataModel(
      key: "garantieActifPassif",
      name: "Rédiger la clause de  garantie d'actif-passif",
    ),
    DataModel(
      key: "ipvFiscalite",
      name: "Améliorer votre fiscalité",
    ),
    DataModel(
      key: "nlleActivite",
      name:
          "Apporter vos titres à une société pour démarrer une nouvelle activité",
    ),
    DataModel(
      key: "devPatImmoEndettement",
      name: "Acquérir un bien immobilier locatif",
    ),
    DataModel(
      key: "fboImmo",
      name: "Céder l'immobilier locatif à une SCI familiale",
    ),
  ];

  List<DataModel> fortuneLevels = [
    DataModel(name: "Inférieur à 2 M €", key: "inf2"),
    DataModel(name: "Entre 2 et 5 M €", key: "entre2et5"),
    DataModel(name: "Entre 5 et 10 M €", key: "entre5et10"),
    DataModel(
        name: "Entre 10 et 20 M €", key: "entre10et20"),
    DataModel(name: "Supérieur à 20 M €", key: "sup20"),
  ];

}
