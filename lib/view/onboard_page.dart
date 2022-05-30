import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:inwealth/utils/translations.dart';
import 'package:inwealth/view/dashboard_page.dart';
import '../controller/store_controller.dart';
import '../controller/profil_controller.dart';

class OnboardPage extends StatefulWidget {
  OnboardPage({Key? key}) : super(key: key);

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

final storeController = Get.find<StoreController>();
final profileController = Get.put(ProfilController());

class _OnboardPageState extends State<OnboardPage> {
  @override
  Widget build(BuildContext context) {
    List<String> country = [
      AppLocalizations.of(context)?.translate('France', 0) ?? " ",
      AppLocalizations.of(context)?.translate('Suisse', 0) ?? " ",
      AppLocalizations.of(context)?.translate('Belgique', 0) ?? " ",
      AppLocalizations.of(context)?.translate('Luxembourg', 0) ?? " ",
      AppLocalizations.of(context)?.translate('Monaco', 0) ?? " ",
      AppLocalizations.of(context)?.translate('Royaume-Uni', 0) ?? " ",
      AppLocalizations.of(context)?.translate('Russie', 0) ?? " ",
      AppLocalizations.of(context)?.translate('Italie', 0) ?? " ",
      AppLocalizations.of(context)?.translate('Espagne', 0) ?? " ",
      AppLocalizations.of(context)?.translate('local_realEstate', 0) ?? " ",
    ];
    String? selectedValue;

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Color(0xFF665840),
        title: Align(
          alignment: Alignment.center,
          child: Center(
            child: Text(
              "INWEALTH",
              style: TextStyle(
                  fontFamily: 'assets/fonts/SFPRODISPLAYBOLD.OTF',
                  color: Color(0xFF524D69)),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFBAAB90),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton2(
                isExpanded: true,
                hint: Row(
                  children: [
                    Icon(
                      Icons.list,
                      size: 16,
                      color: Color(0xFF524D69),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: Text(
                        profileController.residenceFiscall ?? "Select item",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF524D69),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                items: country
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                    .toList(),
                value: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value as String;
                    profileController.residenceFiscall = selectedValue!;
                  });
                },
                icon: const Icon(
                  Icons.arrow_forward_ios_outlined,
                ),
                iconSize: 14,
                iconEnabledColor: Color(0xFF524D69),
                iconDisabledColor: Colors.grey,
                buttonHeight: 50,
                buttonWidth: 160,
                buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                buttonDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: Colors.black26,
                  ),
                  color: Color(0xFFBAAB90),
                ),
                buttonElevation: 2,
                itemHeight: 40,
                itemPadding: const EdgeInsets.only(left: 14, right: 14),
                dropdownMaxHeight: 200,
                dropdownWidth: 200,
                dropdownPadding: null,
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Color(0xFFBAAB90),
                ),
                dropdownElevation: 8,
                scrollbarRadius: const Radius.circular(40),
                scrollbarThickness: 6,
                scrollbarAlwaysShow: true,
                offset: const Offset(-20, 0),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              // ignore: prefer_const_constructors
              onPressed: () => Get.to(DashboardPage()),
              child: Text("Next", style: TextStyle(color: Color(0xFF524D69))),
            ),
          ],
        ),
      ),
    );
  }
}
