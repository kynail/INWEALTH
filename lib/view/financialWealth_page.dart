import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inwealth/view/dashboard_page.dart';
import 'package:inwealth/view/onboard_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/data_controller.dart';
import '../controller/profil_controller.dart';
import 'dashboardProject_page.dart';

class financialWealth extends StatefulWidget {
  financialWealth({Key? key}) : super(key: key);

  @override
  State<financialWealth> createState() => _financialWealthState();
}

DataController test = DataController();

ahfu() {
  test.modifUser().then((value) {
    // profileController.userToken = value;
    // print("valuuuue : " + value.id.toString());
    // print("value 2 : " + profileController.userToken!.id);
  });
  test.addParcours().then(((value) {

  }));

}
  Color purp1 = Color(0xFF5E5B74);
  Color purp2 = Color(0xFF272243);
  Color gold1 = Color(0xFFD5C6AC);
  Color gold2 = Color(0xFFBAAB90);
  Color gold3 = Color(0xFF97876A);

saveEndProject() async {
  prefs = await SharedPreferences.getInstance();
}

endproject() async {
  saveEndProject().then(((value) {
    prefs!.setBool('endProject', true);
    // prefs!.setString('residenceFiscal', profileController.residenceFiscall);
    // print("ben ben ben : " + profileController.userToken!.id);
    // print("whyyyyyy : " + prefs!.getString('residenceFiscal').toString());
  }));
}

class _financialWealthState extends State<financialWealth> {
  final _formKey = GlobalKey<FormState>();
  final profileController = Get.put(ProfilController());
  bool isChecked = false;
  String? selectedValue;
  String financialBank = "0";
  String pensionsFunds = "0";

  @override
  Widget build(BuildContext context) {
    int netRessources = int.parse(financialBank) - int.parse(pensionsFunds);

    print("test last form");
    print(profileController.userId);

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
            FutureBuilder(
                future: ahtchoum(),
                builder: (context, snapshot) {
                  return Image(
                    image: AssetImage(
                        profileController.residenceFiscall == "france"
                            ? "assets/images/france.png"
                            : profileController.residenceFiscall == "uk"
                                ? "assets/royaume-uni.png"
                                : "assets/images/switzerland.png"),
                    height: 40,
                    width: 40,
                  );
                }),

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
                            Image(
              image: AssetImage("assets/iNw_app.png")
            ),
                SizedBox(
                  height: 50,
                ),
                Text("Financial wealth"),
                const SizedBox(height: 30),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: 0,
                    ),
                    hintText: 'Gross Anual pensionsFunds payment.',
                    hintStyle: const TextStyle(fontSize: 14),
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(15),
                    // ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value as String;
                      profileController.financialBank = selectedValue!;
                      financialBank = profileController.financialBank;
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
                      horizontal: 0,
                      vertical: 0,
                    ),
                    hintText: 'Annual pensions Funds.',
                    hintStyle: const TextStyle(fontSize: 14),
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(15),
                    // ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value as String;
                      profileController.pensionsFunds = selectedValue!;
                      pensionsFunds = profileController.pensionsFunds;
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
                                                      decoration: BoxDecoration(color: purp1,
                  borderRadius: BorderRadius.circular(15),),
                  child: TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        profileController.finish = true;
                        print("test test test test");
                        print(profileController.userId);
                        FutureBuilder(
                            future: ahfu(),
                            builder: (context, snapshot) {
                              // return DashboardPage();
                
                              if (snapshot.hasData) {
                                prefs!.setString(
                                    'userID', profileController.userId);
                
                                print("ça marche ?");
                                return DashboardPage();
                              } else if (snapshot.hasError) {
                                print("fuuu error");
                                return DashboardPage();
                              } else {
                                print("fuuu deuxieme error");
                                return DashboardPage();
                              }
                            });
                      }
                      FutureBuilder(
                          future: endproject(),
                          builder: (context, snapshot) {
                            // return DashboardPage();
                
                            if (snapshot.hasData) {
                              prefs!.setBool('endProject', true);
                              // print("ça marche ?");
                              return DashboardPage();
                            } else if (snapshot.hasError) {
                              print("fuuu error");
                              return DashboardPage();
                            } else {
                              print("fuuu deuxieme error");
                              return DashboardPage();
                            }
                          });
                          print("if project end on end form");
                          print(prefs!.getBool('endProject'));
                         parameters.purposesfr[1].isend = true;
                         print("testons testons : " + parameters.purposesfr[1].isend.toString()); 
                      profileController.endProject = true;
                      profileController.listProjet.add(profileController.project);
                      Get.to(dashboardProjectPage());
                    },
                    child: const Text('Finish'),
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
