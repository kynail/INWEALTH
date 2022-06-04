import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inwealth/view/dashboardProject_page.dart';
import 'package:inwealth/view/onboard_page.dart';
import 'package:inwealth/view/ressources_page.dart';

import '../controller/profil_controller.dart';
import '../utils/translations.dart';

class MaritalPage extends StatefulWidget {
  MaritalPage({Key? key}) : super(key: key);

  @override
  State<MaritalPage> createState() => _MaritalPageState();
}

class _MaritalPageState extends State<MaritalPage> {
  String? selectedValue;
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];

  final List<String> nationality = [
    'French',
    'Swiss',
    'Belgian',
    'Luxembourgish',
    'Monegasque',
    'British',
    'Russian',
    'Italian',
    'Spanish',
    'German'
  ];

  final List<String> maritalSta = [
    'divorced',
    'in civil partnership',
    'married',
    'single',
    'widowed'
  ];

  final List<String> genderItems = [
    'Male',
    'Female',
  ];

  final _formKey = GlobalKey<FormState>();
  final profileController = Get.put(ProfilController());
  bool isChecked = false;

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

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Color(0xFF665840),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image(
              image: AssetImage(profileController.residenceFiscall == "France"
                  ? "assets/images/france.png"
                  : profileController.residenceFiscall == "United Kingdom"
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
                  "INWEALTH",
                  style: TextStyle(
                      fontFamily: 'assets/fonts/SFPRODISPLAYBOLD.OTF',
                      color: Color(0xFF524D69)),
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
        backgroundColor: Color(0xFFBAAB90),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Text("Marital Information"),
                const SizedBox(height: 30),
                DropdownButtonFormField2(
                  decoration: InputDecoration(
                    //Add isDense true and zero Padding.
                    //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    //Add more decoration as you want here
                    //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                  ),
                  isExpanded: true,
                  hint: profileController.gender != ""
                      ? Text(profileController.gender)
                      : const Text(
                          'Select your gender',
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
                  items: genderItems
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  validator: (value) {
                    if (profileController.gender != "") {
                    } else if (value == null) {
                      return 'Please select your gender.';
                    }
                  },
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value as String;
                      profileController.gender = selectedValue!;
                    });
                  },
                  onSaved: (value) {
                    selectedValue = value.toString();
                  },
                ),
                const SizedBox(height: 30),
                TextFormField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    hintText: 'Enter Your Full Name.',
                    hintStyle: const TextStyle(fontSize: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value as String;
                      profileController.name = selectedValue!;
                    });
                  },
                  onSaved: (value) {
                    selectedValue = value.toString();
                  },
                ),
                const SizedBox(height: 30),
                DropdownButtonFormField2(
                  decoration: InputDecoration(
                    //Add isDense true and zero Padding.
                    //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    //Add more decoration as you want here
                    //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                  ),
                  isExpanded: true,
                  hint: profileController.nationality != ""
                      ? Text(profileController.nationality)
                      : const Text(
                          'Select your nationality',
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
                  items: nationality
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  validator: (value) {
                    if (profileController.nationality != "") {
                    } else if (value == null) {
                      return 'Please select your nationality.';
                    }
                  },
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value as String;
                      profileController.nationality = selectedValue!;
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
                    hintText: 'Select your Age.',
                    hintStyle: const TextStyle(fontSize: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value as String;
                      profileController.age = selectedValue!;
                    });
                  },
                  onSaved: (value) {
                    selectedValue = value.toString();
                  },
                ),
                const SizedBox(height: 30),
                DropdownButtonFormField2(
                  decoration: InputDecoration(
                    //Add isDense true and zero Padding.
                    //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    //Add more decoration as you want here
                    //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                  ),
                  isExpanded: true,
                  hint: profileController.maritalStatus != ""
                      ? Text(profileController.maritalStatus)
                      : const Text(
                          'Select your maritalStatus',
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
                  items: maritalSta
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  validator: (value) {
                    if (profileController.maritalStatus != "") {
                    } else if (value == null) {
                      return 'Please select your marital status.';
                    }
                  },
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value as String;
                      profileController.maritalStatus = selectedValue!;
                      print(profileController.maritalStatus);
                    });
                  },
                  onSaved: (value) {
                    selectedValue = value.toString();
                    // _formKey.currentState!.save();
                    // profileController.maritalstatus = value.toString();

                    // print(profileController.maritalstatus);
                  },
                ),
                const SizedBox(height: 30),
                profileController.maritalStatus == "married"
                    ? TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          hintText: 'Enter Your Partner Age.',
                          hintStyle: const TextStyle(fontSize: 14),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value as String;
                            profileController.ageWife = selectedValue!;
                          });
                        },
                        onSaved: (value) {
                          selectedValue = value.toString();
                        },
                      )
                    : Container(),
                // const SizedBox(height: 30),
                profileController.maritalStatus == "married"
                    ? Row(
                        children: [
                          const Text(
                            'Do you have children ?',
                            style: TextStyle(fontSize: 14),
                          ),
                          Checkbox(
                              value: profileController.haveChild != false ? profileController.haveChild : isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  profileController.haveChild = value!;
                                  isChecked = value;
                                });
                              }),
                        ],
                      )
                    : Container(),
                // const SizedBox(height: 30),
                profileController.haveChild == true
                    ? TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          hintText: 'Minor children.',
                          hintStyle: const TextStyle(fontSize: 14),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value as String;
                            profileController.minorChild = selectedValue!;
                          });
                        },
                        onSaved: (value) {
                          selectedValue = value.toString();
                        },
                      )
                    : Container(),
                // const SizedBox(height: 30),
                profileController.haveChild == true
                    ? TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          hintText: 'Adult children.',
                          hintStyle: const TextStyle(fontSize: 14),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value as String;
                            profileController.adultChild = selectedValue!;
                          });
                        },
                        onSaved: (value) {
                          selectedValue = value.toString();
                        },
                      )
                    : Container(),
                // const SizedBox(height: 30),
                profileController.haveChild == true
                    ? DropdownButtonFormField2(
                        decoration: InputDecoration(
                          //Add isDense true and zero Padding.
                          //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          //Add more decoration as you want here
                          //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                        ),
                        isExpanded: true,
                        hint: profileController.childResidenceFisc != ""
                            ? Text(profileController.childResidenceFisc)
                            : const Text(
                                'Select your children tax residency',
                                style: TextStyle(fontSize: 14),
                              ),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black45,
                        ),
                        iconSize: 30,
                        buttonHeight: 60,
                        buttonPadding:
                            const EdgeInsets.only(left: 20, right: 10),
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        items: country
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ))
                            .toList(),
                        validator: (value) {
                          if (profileController.childResidenceFisc != "") {
                          } else if (value == null) {
                            return 'Please select your children tax residency.';
                          }
                        },
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value as String;
                            profileController.childResidenceFisc =
                                selectedValue!;
                            print(profileController.childResidenceFisc);
                          });
                        },
                        onSaved: (value) {
                          selectedValue = value.toString();
                          // _formKey.currentState!.save();
                          // profileController.maritalstatus = value.toString();

                          // print(profileController.maritalstatus);
                        },
                      )
                    : Container(),
                const SizedBox(height: 30),
                TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                    }
                    Get.to(RessourcesPage());
                  },
                  child: const Text('Next'),
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