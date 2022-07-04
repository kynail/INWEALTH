import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inwealth/utils/parameters.dart';
import 'package:inwealth/view/marital_page.dart';
import 'package:inwealth/view/onboard_page.dart';

class JuridiquePage extends StatefulWidget {
  JuridiquePage({Key? key}) : super(key: key);

  @override
  State<JuridiquePage> createState() => _JuridiquePageState();
}

bool isChecked = false;
bool isChecked2 = false;


final _formKey = GlobalKey<FormState>();
String? selectedValue;

Parameters parameters = Parameters();

class _JuridiquePageState extends State<JuridiquePage> {
  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                                              Container(
                  height: 30,
                ),
                            Image(
              image: AssetImage("assets/iNw_app.png")
            ),
                Container(
                  height: 60,
                ),
                Text("Forme juridique"),
                const SizedBox(height: 30),
                DropdownButtonFormField2(
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  isExpanded: true,
                  hint: profileController.locality != ""
                      ? Text(profileController.locality)
                      : const Text(
                          'Horizon souhaité ',
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
                  items: parameters.horizons
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
                    if (profileController.horizon != "") {
                    } else if (value == null) {
                      return 'Please select your horizont.';
                    }
                  },
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value as String;
                      profileController.horizon = selectedValue!;
                    });
                  },
                  onSaved: (value) {
                    selectedValue = value.toString();
                  },
                ),
                const SizedBox(height: 30),
                DropdownButtonFormField2(
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  isExpanded: true,
                  hint: profileController.locality != ""
                      ? Text(profileController.locality)
                      : const Text(
                          'Select your legal Forms',
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
                  items: parameters.legalForms
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
                    if (profileController.formeJuridique != "") {
                    } else if (value == null) {
                      return 'Please select your legal form.';
                    }
                  },
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value as String;
                      profileController.formeJuridique = selectedValue!;
                      print(
                          "secteur act :  " + profileController.formeJuridique);
                    });
                  },
                  onSaved: (value) {
                    selectedValue = value.toString();
                  },
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: const Text(
                        "Détenez vous une socité holding ?",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    Expanded(
                      child: Checkbox(
                          value: profileController.ifHolding != false
                              ? profileController.ifHolding
                              : isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              profileController.ifHolding = value!;
                              isChecked = value;
                            });
                          }),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: const Text(
                        "Détenez vous de l'immobilier d'exploitation ?",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    Expanded(
                      child: Checkbox(
                          value: profileController.ifImmoExploit != false
                              ? profileController.ifImmoExploit
                              : isChecked2,
                          onChanged: (bool? value) {
                            setState(() {
                              profileController.ifImmoExploit = value!;
                              isChecked2 = value;
                            });
                          }),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                profileController.ifImmoExploit == true
                    ? DropdownButtonFormField2(
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        isExpanded: true,
                        hint: profileController.locality != ""
                            ? Text(profileController.locality)
                            : const Text(
                                "Selectionnez votre immoblier d'exploitation",
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
                        items: parameters.operatingRealEstateTypes
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
                          if (profileController.immobilierExploitation != "") {
                          } else if (value == null) {
                            return 'Please select your business segment.';
                          }
                        },
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value as String;
                            profileController.immobilierExploitation =
                                selectedValue!;
                            print("changement residence ? : " +
                                profileController.immobilierExploitation);
                          });
                        },
                        onSaved: (value) {
                          selectedValue = value.toString();
                        },
                      )
                    : Container(),
                const SizedBox(height: 30),
                TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                    }
                    print(profileController.locality);
                    Get.to(MaritalPage());
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
