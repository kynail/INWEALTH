import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:inwealth/controller/data_controller.dart';
import 'package:inwealth/controller/expert_controller.dart';
import 'package:inwealth/controller/store_controller.dart';
import 'package:inwealth/view/dashboardProject_page.dart';
import 'package:inwealth/view/meeting_page.dart';
import 'package:inwealth/view/onboard_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/pisteReflexion_controller.dart';
import '../utils/customCheckbox.dart';

class pisteReflexion extends StatefulWidget {
  const pisteReflexion({Key? key}) : super(key: key);

  @override
  State<pisteReflexion> createState() => _pisteReflexionState();
}


// final storeController = Get.find<StoreController>();
  Future<void> getResiFisc() async {
    prefs = await SharedPreferences.getInstance();
  }
// final thinkingController = Get.put(ThinkingController());
ThinkingController thinkingController = ThinkingController();
List<String> lastlastTab = [];
List<String> zzzTab = [];
DataController test = DataController();

getPistefromData() {
  int i = 0;
  print(thinking.pisteExperte);
  List<String> newtab = new List.from(thinking.pisteExperte)
    ..addAll(thinking.pistePrioritaire)
    ..addAll(thinking.pisteNonPrioritaire);
  List<String> tabKey = [];
  for (int i = 0; i < thinkingController.thinkings.length; i++) {
    tabKey.add(thinkingController.thinkings[i].key);
    print("line add : " + thinkingController.thinkings[i].key);
  }
  List<String> tabwthDouble = new List.from(newtab)..addAll(tabKey);
  // print("first tab : " + newtab.toString());

  List<String> lastTab = [];
  tabwthDouble.forEach((element) {
    if (lastTab.contains(element)) {
      // print("duplicate : ${element}");
    } else {
      lastTab.add(element);
    }
  });
  // print("big tab :  " + newtab.toString());
  // print("last tab : " + lastTab.toString());
  // List<String> lastlastTab = [];
  if (thinking.already == false) {
    for (int w = 0; w < newtab.length; w++) {
      for (int x = 0; x < thinking.thinkings.length; x++) {
        if (newtab[w] == thinking.thinkings[x].key) {
          lastlastTab.add(thinking.thinkings[x].name);
        }
      }
    }
    thinking.already = true;
  }
  // lastlastTab.forEach((element) {
  //   if (zzzTab.contains(element)) {
  //     // print("duplicate : ${element}");
  //   } else {
  //     zzzTab.add(element);
  //   }
  // });
  // print("big tab :  " + lastlastTab.toString());
}

  getRetainedThink() {
    int k = 0;


    for(int i = 0; i < thinkingController.thinkings.length; i++) {
      print("fuuuuuuu\n" + profileController.rtnThinking[k].toString());
      if (thinkingController.thinkings[i].name == profileController.rtnThinking[k]) {
        if (profileController.rtnThinking.length <= k) {
          k++;
        }
        profileController.keythink.add(thinkingController.thinkings[i].key);
      }
    }
    profileController.keythink = profileController.keythink.toSet().toList();
    print("show new tab retained thinking \n" + profileController.keythink.toString() + "  fuu");
  }


class _pisteReflexionState extends State<pisteReflexion> {

@override
void initState() {
  profileController.keythink == [];
  super.initState(); 
}

  @override
  Widget build(BuildContext context) {
    if (thinking.selectedPiste == []) {}
    getPistefromData();
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: lastlastTab.length,
              // itemCount: thinking.thinkings.length,

              itemBuilder: (context, index) => Row(
                children: <Widget>[
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(child: Text(lastlastTab[index])),
                  CustomCheckBox(
                    // value: value,
                    // key: Key(index.toString()),
                    onChanged: (value) {
                      thinking.selectedPiste.add(lastlastTab[index]);
                    },
                  ),
                ],
              ),
            ),
            TextButton(     
                onPressed: () {
                        profileController.rtnThinking = thinking.selectedPiste;
                        getRetainedThink();
                        test.postRetainedThinking(profileController.userId);
                        profileController.rtnThinking.clear();
                        profileController.currentIndex = 0;
                        Get.to(dashboardProjectPage());
                },
                child: const Text("Return to home page"))
          ],
        ),
      ),
    );
  }
}
