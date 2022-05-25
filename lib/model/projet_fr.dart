import 'package:flutter/cupertino.dart';

import '../utils/translations.dart';

class Project_fr extends StatefulWidget {
  Project_fr({Key? key}) : super(key: key);

  @override
  State<Project_fr> createState() => _Project_frState();
}

class _Project_frState extends State<Project_fr> {
  @override
  Widget build(BuildContext context) {
      Map<int, String?> projetList = {
    1:AppLocalizations.of(context)?.translate('communauteReduite', 1) ?? " ",
    2:'Séparations de biens',
  };
    return Container();
  }
}