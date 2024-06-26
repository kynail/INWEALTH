import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inwealth/view/financialWealth_page.dart';
import 'package:inwealth/view/onboard_page.dart';

import '../controller/profil_controller.dart';

class RessourcesPage extends StatefulWidget {
  RessourcesPage({Key? key}) : super(key: key);

  @override
  State<RessourcesPage> createState() => _RessourcesPageState();
}

class _RessourcesPageState extends State<RessourcesPage> {
  final List<String> wealth = [
    'Less than 2M',
    'between 2 and 5M',
    'between 5 and 10M',
    'between 10 and 20M',
    'more than 20M'
  ];
  Color purp1 = Color(0xFF5E5B74);
  Color purp2 = Color(0xFF272243);
  Color gold1 = Color(0xFFD5C6AC);
  Color gold2 = Color(0xFFBAAB90);
  Color gold3 = Color(0xFF97876A);
  final _formKey = GlobalKey<FormState>();
  final profileController = Get.put(ProfilController());
  bool isChecked = false;
  String? selectedValue;
  String grossAnual = "0";
  String loan = "0";

  @override
  Widget build(BuildContext context) {
    int netRessources = int.parse(grossAnual) - int.parse(loan);
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Color(0xFF665840),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image(
              image: AssetImage(profileController.residenceFiscall == "france"
                  ? "assets/images/france.png"
                  : profileController.residenceFiscall == "uk"
                      ? "assets/royaume-uni.png"
                      : "assets/images/switzerland.png"),
              height: 40,
              width: 40,
            ),
            // SizedBox(width: 80,),
            const Align(
              alignment: Alignment.center,
              child: Center(
                child: Text(
                  "iNwealth",
                  style: TextStyle(
                    fontFamily: 'assets/fonts/SFPRODISPLAYBOLD.OTF',
                    // color: Color(0xFF524D69)
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              width: 40,
            ),
          ],
        ),
        centerTitle: true,
        // backgroundColor: Color(0xFFBAAB90),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 30,
                ),
                Image(image: AssetImage("assets/iNw_app.png")),
                SizedBox(
                  height: 50,
                ),
                Text("Ressources / Liabilities"),
                const SizedBox(height: 30),
                DropdownButtonFormField2(
                  decoration: InputDecoration(
                    //Add isDense true and zero Padding.
                    //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(15),
                    // ),
                    //Add more decoration as you want here
                    //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                  ),
                  isExpanded: true,
                  hint: profileController.wealth != ""
                      ? Text(profileController.wealth)
                      : const Text(
                          'Select your wealth',
                          style: TextStyle(fontSize: 14),
                        ),
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black45,
                  ),
                  iconSize: 30,
                  buttonHeight: 60,
                  buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  items: parameters.fortuneLevels
                      .map((item) => DropdownMenuItem<String>(
                            value: item.key,
                            child: Text(
                              item.name,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  validator: (value) {
                    if (profileController.wealth != "") {
                    } else if (value == null) {
                      return 'Please select your wealth.';
                    }
                  },
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value as String;
                      profileController.wealth = selectedValue!;
                    });
                  },
                  onSaved: (value) {
                    selectedValue = value.toString();
                  },
                ),
                const SizedBox(height: 30),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    hintText: 'Gross Anual loan payment.',
                    hintStyle: const TextStyle(fontSize: 14),
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(15),
                    // ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value as String;
                      profileController.grossAnual = selectedValue!;
                      grossAnual = profileController.grossAnual;
                    });
                  },
                  onSaved: (value) {
                    selectedValue = value.toString();
                  },
                ),
                const SizedBox(height: 30),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    hintText: 'Annual loan payment.',
                    hintStyle: const TextStyle(fontSize: 14),
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(15),
                    // ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value as String;
                      profileController.annualLoan = selectedValue!;
                    });
                  },
                  onSaved: (value) {
                    selectedValue = value.toString();
                  },
                ),
                const SizedBox(height: 30),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    hintText: 'Loan outstanding.',
                    hintStyle: const TextStyle(fontSize: 14),
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(15),
                    // ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value as String;
                      profileController.loan = selectedValue!;
                      loan = profileController.loan;
                    });
                  },
                  onSaved: (value) {
                    selectedValue = value.toString();
                  },
                ),
                const SizedBox(height: 30),
                Text(netRessources.toString()),
                const SizedBox(height: 30),
                Container(
                  width: 150,
                  decoration: BoxDecoration(color: purp1,
                  borderRadius: BorderRadius.circular(15),),
                  child: TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                      }
                      print(profileController.locality);
                      Get.to(financialWealth());
                    },
                    child: const Text('Next'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
