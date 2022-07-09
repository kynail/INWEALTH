import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:inwealth/controller/parameters.dart';
import 'package:inwealth/utils/data/data_model.dart';
import 'package:inwealth/utils/parameters.dart';
import 'package:inwealth/utils/translations.dart';
import 'package:inwealth/view/juridique_page.dart';
import 'package:inwealth/view/marital_page.dart';
import 'package:inwealth/view/onboard_page.dart';
import 'package:inwealth/controller/langue_controller.dart';
import 'dashboard_page.dart';

class ProjectFrPage extends StatefulWidget {
  ProjectFrPage({Key? key}) : super(key: key);

  @override
  State<ProjectFrPage> createState() => _ProjectFrPageState();
}

class _ProjectFrPageState extends State<ProjectFrPage> {
  String? selectedValue;

  Parameters parameters = Parameters();

  Color purp1 = Color(0xFF5E5B74);
  Color purp2 = Color(0xFF272243);
  Color gold1 = Color(0xFFD5C6AC);
  Color gold2 = Color(0xFFBAAB90);
  Color gold3 = Color(0xFF97876A);

  final List<String> locality = [
    'Autres',
    'BTP',
    'Hotellerie',
    'Industrie',
    'Informatique',
    'Negoce et distribution',
    'restauration',
    'santé',
    'services'
  ];

  final List<String> type = [
    'Commercial real estate',
    'Rental invesment',
    'Secondary residence',
  ];

  final List<String> genderItems = [
    'Male',
    'Female',
  ];

  bool isChecked = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // List<DataModel> country = [
    // DataModel(name: 'France'.tr, key: "france"),
    // DataModel(name: 'Suisse'.tr, key: "suisse"),
    // DataModel(name: 'Belgique'.tr, key: "belgique"),
    // DataModel(name: 'Luxembourg'.tr, key: "luxembourg"),
    // DataModel(name: 'Monaco'.tr, key: "monaco"),
    // DataModel(name: 'Royaume-Uni'.tr, key: "uk"),
    // // DataModel(name: "Middle-East", key: "middleEast"),
    // DataModel(name: 'Russie'.tr, key: "russie"),
    // DataModel(name: 'Italie'.tr, key: "italie"),
    // DataModel( name: 'Espagne'.tr, key: "espagne"),
    // DataModel( name: 'Allemagne'.tr, key: "allemagne"),

    //   // 'France'.tr,
    //   // 'Suisse'.tr,
    //   // 'Belgique'.tr,
    //   // 'Luxembourg'.tr,
    //   // 'Monaco'.tr,
    //   // 'Royaume-Uni'.tr,
    //   // 'Russie'.tr,
    //   // 'Italie'.tr,
    //   // 'Espagne'.tr,
    //   // 'Allemagne'.tr
    // ];

    print("fuuu flutter");
    print(AppLocalizations.of(context)?.translate('France', 0));
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Color(0xFF665840),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Align(
              alignment: Alignment.center,
              child: Center(
                child: Text(
                  "iNwealth",
                  style: TextStyle(
                      fontFamily: 'assets/fonts/SFPRODISPLAYBOLD.OTF',
                      fontSize: 34,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Image(
              image: AssetImage(profileController.residenceFiscall == "france"
                  ? "assets/images/france.png"
                  : profileController.residenceFiscall == "uk"
                      ? "assets/royaume-uni.png"
                      : "assets/images/switzerland.png"),
              height: 40,
              width: 40,
            )

            // SizedBox(width: 80,),

            // const SizedBox(
            //   width: 40,
            // ),
          ],
        ),
        centerTitle: true,
        // backgroundColor: Color(0xff121421),

        // backgroundColor: const Color(0xFFFFFFFF),
        // backgroundColor: const Color(0xFFBAAB90),
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
                Container(
                  height: 60,
                ),
                Text("First information"),

                const SizedBox(height: 30),
                DropdownButtonFormField2(
                  decoration: InputDecoration(
                    // isDense: true,
                    contentPadding: EdgeInsets.zero,
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(15),
                    // ),
                  ),
                  isExpanded: true,
                  hint: profileController.locality != ""
                      ? Text(profileController.locality)
                      : const Text(
                          'Select your business segment',
                          style: TextStyle(fontSize: 14),
                        ),
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    // color: Colors.black45,
                  ),
                  iconSize: 30,
                  buttonHeight: 60,
                  buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  items: parameters.businessSectors
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
                    if (profileController.secteurActivite != "") {
                    } else if (value == null) {
                      return 'Please select your business segment.';
                    }
                  },
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value as String;
                      profileController.secteurActivite = selectedValue!;
                      print("secteur act :  " +
                          profileController.secteurActivite);
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
                    hintText: 'Enter Your valuation.',
                    hintStyle: const TextStyle(fontSize: 14),
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(15),
                    // ),
                  ),
                  validator: (value) {
                    if (profileController.valorisation != "") {
                    } else if (value == null) {
                      return 'Please select your valuation.';
                    }
                  },
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value as String;
                      profileController.valorisation = selectedValue!;
                    });
                  },
                  onSaved: (value) {
                    selectedValue = value.toString();
                  },
                ),
                const SizedBox(height: 30),
                DropdownButtonFormField2(
                  decoration: InputDecoration(
                    // isDense: true,
                    contentPadding: EdgeInsets.zero,
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(15),
                    // ),
                  ),
                  isExpanded: true,
                  hint: profileController.locality != ""
                      ? Text(profileController.locality)
                      : const Text(
                          'Un changement de résidence est il prévu ?',
                          style: TextStyle(fontSize: 14),
                        ),
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    // color: Colors.black45,
                  ),
                  iconSize: 30,
                  buttonHeight: 60,
                  buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  items: parameters.country
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
                    if (profileController.changementResi != "") {
                    } else if (value == null) {
                      return 'Please select your business segment.';
                    }
                  },
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value as String;
                      profileController.changementResi = selectedValue!;
                      print("changement residence ? : " +
                          profileController.changementResi);
                    });
                  },
                  onSaved: (value) {
                    selectedValue = value.toString();
                  },
                ),
                // Row(
                //   children: [
                //     Expanded(
                //       child: const Text(
                //         'Un changement de résidence est il prévu ?',
                //         style: TextStyle(fontSize: 14),
                //       ),
                //     ),
                //     Expanded(
                //       child: Checkbox(
                //           value: profileController.haveChild != false
                //               ? profileController.haveChild
                //               : isChecked,
                //           onChanged: (bool? value) {
                //             setState(() {
                //               profileController.haveChild = value!;
                //               isChecked = value;
                //             });
                //           }),
                //     ),
                //   ],
                // ),
                const SizedBox(height: 30),
                DropdownButtonFormField2(
                  decoration: InputDecoration(
                    // isDense: true,
                    contentPadding: EdgeInsets.zero,
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(15),
                    // ),
                  ),
                  isExpanded: true,
                  hint: profileController.locality != ""
                      ? Text(profileController.locality)
                      : const Text(
                          'Avez vous un élément étranger dans votre situation ?',
                          style: TextStyle(fontSize: 14),
                        ),
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    // color: Colors.black45,
                  ),
                  iconSize: 30,
                  buttonHeight: 60,
                  buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  items: parameters.country
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
                    if (profileController.elementEtranger != "") {
                    } else if (value == null) {
                      return 'Please select your business segment.';
                    }
                  },
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value as String;
                      profileController.elementEtranger = selectedValue!;
                    });
                  },
                  onSaved: (value) {
                    selectedValue = value.toString();
                  },
                ),

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
                      Get.to(JuridiquePage());
                    },
                    child: const Text('Next', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // Expanded(
      //   child: ListView.separated(
      //     itemCount: 25,
      //     separatorBuilder: (BuildContext context, int index) => const Divider(),
      //     itemBuilder: (BuildContext context, int index) {
      //       return ListTile(
      //         title: Text("test")
      //       );
      //     },
      //   ),
      // ),
    );
  }
}
