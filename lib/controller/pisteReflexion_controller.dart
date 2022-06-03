import 'package:equatable/equatable.dart';
import 'package:get/get.dart';

class Thinking extends Equatable {
  int id = 0;
  String name = "";
  String url = "";
  String key = "";

  Thinking({
    required this.id,
    required this.name,
    required this.url,
    required this.key,
  });

      @override
  List<Object?> get props => [id, name, url, key];
}

class ThinkingController extends GetxController {

  List<Thinking> thinkings = [
    Thinking(
      id: 1,
      key: "fboImmoEntreprise",
      name: "Céder l'immobilier d'entreprise à une SCI familiale",
      url:
          "https://www.canva.com/design/DAEpvaZyq1k/1B5cGae1ehLiFHBRg2NK4Q/watch?utm_content=DAEpvaZyq1k&utm_campaign=designshare&utm_medium=link&utm_source=publishsharelink",
    ),
    Thinking(
      id: 2,
      key: "donationPetitEnfant",
      name: "Donner en faveur de vos petits-enfants",
      url:
          "https://www.canva.com/design/DAEpvJ5kH7I/nj6wJLV4JkaVs46eiaQn1A/watch?utm_content=DAEpvJ5kH7I&utm_campaign=designshare&utm_medium=link&utm_source=publishsharelink",
    ),
    Thinking(
      id: 3,
      key: "donationAvantCessionEnfant",
      name: "Donner aux enfants des titres avant leur cession",
      url:
          "https://www.canva.com/design/DAEptQXgzlU/nMHh9U4QO0P3NlkpRheF-w/watch?utm_content=DAEptQXgzlU&utm_campaign=designshare&utm_medium=link&utm_source=publishsharelink",
    ),
    Thinking(
      id: 4,
      key: "paiementDiffere",
      name: "Acquitter les droits de donation en différé et fractionné",
      url:
          "https://www.canva.com/design/DAEpttdzj-s/94e2dZwdgMtAVQ9kjjkmIQ/watch?utm_content=DAEpttdzj-s&utm_campaign=designshare&utm_medium=link&utm_source=publishsharelink",
    ),
    Thinking(
      id: 6,
      key: "remploiPdtCessionScpCapi",
      name:
          "Souscrire un contrat de capitalisation : remploi du produit de cession démembré",
      url:
          "https://www.canva.com/design/DAEptjlVauI/K_zJQrLXOJnJK2KIOuyhLQ/watch?utm_content=DAEptjlVauI&utm_campaign=designshare&utm_medium=link&utm_source=publishsharelink",
    ),
    Thinking(
      id: 7,
      key: "dutreil",
      name:
          "Conclure un Pacte Dutreil : 75% d'abattement sur l'assiette taxable",
      url:
          "https://www.canva.com/design/DAEpt-ttYU4/qTED8O7cMVr0V5u1bbovfg/watch?utm_content=DAEpt-ttYU4&utm_campaign=designshare&utm_medium=link&utm_source=publishsharelink",
    ),
    Thinking(
      id: 8,
      key: "simplificationGroupe",
      name: "Simplifier l'organigramme du groupe",
      url:
          "https://www.canva.com/design/DAEpucnQrp8/sJxM3xaeGPjKohgteboMKQ/watch?utm_content=DAEpucnQrp8&utm_campaign=designshare&utm_medium=link&utm_source=publishsharelink",
    ),
    Thinking(
      id: 9,
      key: "ddv",
      name:
          "Augmenter les droits du conjoint dans la succession : la donation au dernier vivant",
      url:
          "https://www.canva.com/design/DAEpuKhxjRQ/lBn-tM2f14NCQcVWIj4Pyw/watch?utm_content=DAEpuKhxjRQ&utm_campaign=designshare&utm_medium=link&utm_source=publishsharelink",
    ),
    Thinking(
      id: 10,
      key: "steAcquet",
      name: "Aménager votre régime séparatiste : la clause de société acquêts",
      url:
          "https://www.canva.com/design/DAEpxzxv_u8/rvKbPI6TZHmT9geq7BHz-Q/watch?utm_content=DAEpxzxv_u8&utm_campaign=designshare&utm_medium=link&utm_source=publishsharelink",
    ),
    Thinking(
      id: 11,
      key: "donationPpConjoint",
      name: "Donner en faveur de votre conjoint",
      url:
          "https://www.canva.com/design/DAEpt-yztIA/Kp09XmhJK7ozNp7iGo1cAQ/watch?utm_content=DAEpt-yztIA&utm_campaign=designshare&utm_medium=link&utm_source=publishsharelink",
    ),
    Thinking(
      id: 12,
      key: "signerPacs",
      name: "Conclure un PACS",
      url:
          "https://www.canva.com/design/DAEpuY9s0Ds/AF8l_EWmt_b4e_NeUHhbew/watch?utm_content=DAEpuY9s0Ds&utm_campaign=designshare&utm_medium=link&utm_source=publishsharelink",
    ),
    Thinking(
      id: 13,
      key: "assVieAvant70Sdb",
      name: "Souscrire un contrat d'assurance-vie pour protéger vos proches",
      url:
          "https://www.canva.com/design/DAEpuEzCiu0/Gv9s85jZDUMRRPRsMu3i1w/watch?utm_content=DAEpuEzCiu0&utm_campaign=designshare&utm_medium=link&utm_source=publishsharelink",
    ),
    Thinking(
      id: 14,
      key: "assVieAvant70Cte",
      name: "Souscrire un contrat d'assurance-vie pour protéger vos proches",
      url:
          "https://www.canva.com/design/DAEpuH58O7U/KX2xDGZ3OW_NAs12XlO6Ug/watch?utm_content=DAEpuH58O7U&utm_campaign=designshare&utm_medium=link&utm_source=publishsharelink",
    ),
    Thinking(
      id: 15,
      key: "assuranceVie",
      name: "Souscrire un contrat d'assurance-vie",
      url:
          "https://www.canva.com/design/DAEptBDOPtk/Vj5epqlOVFgxuOFzKfhYFQ/watch?utm_content=DAEptBDOPtk&utm_campaign=designshare&utm_medium=link&utm_source=publishsharelink",
    ),
    Thinking(
      id: 16,
      key: "assVieIr",
      name: "Effectuer des rachats périodiques sur un contrat d'assurance-vie",
      url:
          "https://www.canva.com/design/DAEpuJ0m3n8/6p2iU2m92JUxrnUfDrcYNg/watch?utm_content=DAEpuJ0m3n8&utm_campaign=designshare&utm_medium=link&utm_source=publishsharelink",
    ),
    Thinking(
      id: 17,
      key: "garantieActifPassif",
      name: "Rédiger la clause de  garantie d'actif-passif",
      url:
          "https://www.canva.com/design/DAEpWCYhHuw/oITZPYfb1biVBNN5I_dM0Q/watch?utm_content=DAEpWCYhHuw&utm_campaign=designshare&utm_medium=link&utm_source=publishsharelink",
    ),
    Thinking(
      id: 18,
      key: "ipvFiscalite",
      name: "Acquisition costs and real estate wealth tax 'IFI'",
      url:
          "https://www.canva.com/design/DAFAsPOA4e8/stgcfq5QqgtTdPmx58NUYQ/watch?utm_content=DAFAsPOA4e8&utm_campaign=designshare&utm_medium=link&utm_source=publishsharelink",
    ),
    Thinking(
      id: 19,
      key: "nlleActivite",
      name:
          "Apporter vos titres à une société pour démarrer une nouvelle activité",
      url:
          "https://www.canva.com/design/DAElXu5ykP8/H9ps5ZxnqLZfqt-lMNxy3g/watch?utm_content=DAElXu5ykP8&utm_campaign=designshare&utm_medium=link&utm_source=publishsharelink",
    ),
    Thinking(
      id: 20,
      key: "devPatImmoEndettement",
      name: "Acquérir un bien immobilier locatif",
      url:
          "https://www.canva.com/design/DAEpuF1loR0/AdVOVWgf3NnqOZqwH2TkVg/watch?utm_content=DAEpuF1loR0&utm_campaign=designshare&utm_medium=link&utm_source=publishsharelink",
    ),
    Thinking(
      id: 21,
      key: "fboImmo",
      name: "Céder l'immobilier locatif à une SCI familiale",
      url:
          "https://www.canva.com/design/DAEptpd0TyU/nvS2xq0DJAzcyHXyBoeYjw/watch?utm_content=DAEptpd0TyU&utm_campaign=designshare&utm_medium=link&utm_source=publishsharelink",
    ),
  ];

}