
import 'package:flutter/cupertino.dart';
import 'package:inwealth/utils/translations.dart';

class CustomList extends StatefulWidget {
  const CustomList({Key? key}) : super(key: key);

  @override
  State<CustomList> createState() => _CustomListState();
  
}

class _CustomListState extends State<CustomList> {
  @override
  Widget build(BuildContext context) {


  Map<int, String?> matrimonialRegimes = {
    1:AppLocalizations.of(context)?.translate('communauteReduite', 1) ?? " ",
    2:'Séparations de biens',
  };

    return Text(matrimonialRegimes[1].toString());
  }
}


// class List {

// //FR


// //EN


// //CH

// }
