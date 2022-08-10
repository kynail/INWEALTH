import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:inwealth/controller/parameters.dart';
import 'package:inwealth/utils/parameters.dart';
import 'package:inwealth/utils/translations.dart';
import 'package:inwealth/view/dashboard_page.dart';
import 'package:inwealth/view/dashboarddashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controller/store_controller.dart';
import '../controller/profil_controller.dart';
import '../utils/data/security_data_provider.dart';
import '../utils/data/user_token_transfert.dart';

class OnboardPage extends StatefulWidget {
  OnboardPage({Key? key}) : super(key: key);

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

// final storeController = Get.find<StoreController>();
final parametersController = Get.put(ParametersController());

final profileController = Get.put(ProfilController());
SharedPreferences? prefs;
SecurityDataProvider test = SecurityDataProvider();

Parameters parameters = Parameters();

Future<void> saveUserToken() async {
  prefs = await SharedPreferences.getInstance();
}

ahfu() async {
  profileController.userToken == null
      ? test.authentifyUser().then((value) {
          profileController.userToken = value;
          profileController.userId = value.id;
          prefs!.setString('userID', profileController.userToken!.id);
          print("valuuuue : " + value.id.toString());
          print("value 2 : " + profileController.userToken!.id);
        })
      : null;

  saveUserToken().then(((value) {
    prefs!.setString('userID', profileController.userToken!.id);
    if (profileController.residenceFiscall == "") {
      prefs!.setString('residenceFiscal', profileController.residenceFiscall);
    }
    print("ben ben ben : " + profileController.residenceFiscall);
    // print("whyyyyyy : " + prefs!.getString('residenceFiscal').toString());
  }));
  // print("testestest : " + prefs!.getString('residenceFiscal').toString());
}

class _OnboardPageState extends State<OnboardPage> {
// @override
// void initState() {
//   profileController.userToken == null
//     ? test.authentifyUser().then((value) {
//     profileController.userToken = value;
//     print("valuuuue : " + value.id.toString());
//     print("value 2 : " + profileController.userToken!.id);
//   })
//   : null;

//   saveUserToken().then(((value) {
//     prefs!.setString('userID', profileController.userToken!.id);
//     // prefs!.setString('residenceFiscal', profileController.residenceFiscall);
//     print("ben ben ben : " + profileController.userToken!.id);
//     // print("whyyyyyy : " + prefs!.getString('residenceFiscal').toString());
//   }));
//   super.initState();
// }

  @override
  Widget build(BuildContext context) {
    saveUserToken();

    String? selectedValue;

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Color(0xFF665840),
        title: Align(
          alignment: Alignment.center,
          child: Center(
            child: Text(
              "iNwealth",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'assets/fonts/SFPRODISPLAYBOLD.OTF',
                // color: Color(0xFF524D69)
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        centerTitle: true,
        // backgroundColor: Color(0xFFFFFFFF),
        // backgroundColor: Color(0xFFBAAB90),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Image(image: AssetImage("assets/iNw_app.png")),
            SizedBox(
              height: 50,
            ),
            SizedBox(height: 10,),
            
            SizedBox(height: 10,),
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
              hint: profileController.residenceFiscall != ""
                  ? Text(profileController.residenceFiscall)
                  : Text(
                      'Country'.tr,
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
                if (profileController.residenceFiscall != "") {
                } else if (value == null) {
                  return 'PlzCountry'.tr;
                }
              },
              onChanged: (value) {
                setState(() {
                  selectedValue = value as String;
                  if (profileController.residenceFiscall == "") {
                    profileController.residenceFiscall = selectedValue!;
                    print(
                        "mais what ?? : " + profileController.residenceFiscall);
                    prefs!.setString(
                        'residenceFiscale', profileController.residenceFiscall);
                  }
                });
              },
              onSaved: (value) {
                selectedValue = value.toString();
              },
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 1),
              child: DropdownButtonFormField2(
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
                hint: profileController.nationality != ""
                    ? Text(profileController.nationality)
                    : Text(
                        'Nationality'.tr,
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
                items: parameters.nationality
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
                  if (profileController.nationality != "") {
                  } else if (value == null) {
                    return 'plzNationality'.tr;
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
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 40,
              width: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color(0xFF7F7A93)
              ),
              child: TextButton(
                // ignore: prefer_const_constructors
                onPressed: () {
                  print("residence " + profileController.residenceFiscall);
                  FutureBuilder(
                      future: ahfu(),
                      builder: (context, snapshot) {
                        // return DashboardPage();
            
                        if (snapshot.hasData) {
                          prefs!.setString(
                              'userID', profileController.userToken!.id);
                          prefs!.setString('residenceFiscal',
                              profileController.residenceFiscall);
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
            
                  print("ben ben ben : " + profileController.residenceFiscall);
                  print("teeeeeeeest");
                  prefs!.setString(
                      'residenceFiscal', profileController.residenceFiscall);
                  print(prefs?.getString('residenceFiscal'));
                  print("fiiiiiin test");
                  if (profileController.residenceFiscall != "" && profileController.nationality != "") {
                    Get.to(DashboardNavigation());
                  }
                  else {
                  }
                },
                child: Text("Next",
                    style: TextStyle(
                        color: Colors.white
                        )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
