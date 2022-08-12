class UserTokenTransfert {
  final String id;

  UserTokenTransfert({required this.id});

  factory UserTokenTransfert.fromJson(Map<String, dynamic> json) {
    return UserTokenTransfert(id: json["id"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
    };
  }
}

class PisteTokenTransfert {
  final List<String> expertThinkings;
  final List<String> priorityThinkings;
  final List<String> nonPriorityThinkings;

  const PisteTokenTransfert({
    required this.expertThinkings,
    required this.priorityThinkings,
    required this.nonPriorityThinkings,
  });

  factory PisteTokenTransfert.fromJson(Map<String, dynamic> json) {
    return PisteTokenTransfert(
      expertThinkings: List.from(json["pisteExperte"]),
      priorityThinkings: List.from(json["pistePrioritaire"]),
      nonPriorityThinkings: List.from(json["pisteNonPrioritaire"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "pisteExperte": expertThinkings,
      "pistePrioritaire": priorityThinkings,
      "pisteNonPrioritaire": nonPriorityThinkings,
    };
  }
}

class ProjetTokenTransfert {
  final bool cederEntreprise;
  final bool transmettreEntreprise;
  final bool matriserImpot;

  const ProjetTokenTransfert({
    required this.cederEntreprise,
    required this.transmettreEntreprise,
    required this.matriserImpot,
  });

  factory ProjetTokenTransfert.fromJson(Map<String, dynamic> json) {
    return ProjetTokenTransfert(
      cederEntreprise: (json["cederEntreprise"]),
      transmettreEntreprise: (json["transmettreEntreprise"]),
      matriserImpot: (json["matriserImpot"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "cederEntreprise": cederEntreprise,
      "transmettreEntreprise": transmettreEntreprise,
      "matriserImpot": matriserImpot,
    };
  }
}

class MeetingTokenTransfert {
  final String meeting;

  MeetingTokenTransfert({required this.meeting});

  factory MeetingTokenTransfert.fromJson(Map<String, dynamic> json) {
    return MeetingTokenTransfert(meeting: json["meeting"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "meeting": meeting,
    };
  }
}

class LoginTokenTransfert {
  final String phone;
  final String indic;
  final String mdp;
  final String iflog;

  LoginTokenTransfert({
    required this.phone,
    required this.indic,
    required this.mdp,
    required this.iflog,
  });

  factory LoginTokenTransfert.fromJson(Map<String, dynamic> json) {
    return LoginTokenTransfert(
        phone: json["phone"],
        indic: json["indic"],
        mdp: json['mdp'],
        iflog: json['iflog']);
  }

  Map<String, dynamic> toJson() {
    return {
      "phone": phone,
      "indic": indic,
      "mdp": mdp,
      "iflog": iflog,
    };
  }
}
