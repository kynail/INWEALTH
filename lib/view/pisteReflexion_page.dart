import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:inwealth/controller/expert_controller.dart';
import 'package:inwealth/view/dashboardProject_page.dart';
import 'package:inwealth/view/meeting_page.dart';
import 'package:inwealth/view/onboard_page.dart';

import '../controller/pisteReflexion_controller.dart';
import '../utils/customCheckbox.dart';

class pisteReflexion extends StatefulWidget {
  const pisteReflexion({Key? key}) : super(key: key);

  @override
  State<pisteReflexion> createState() => _pisteReflexionState();
}

class _pisteReflexionState extends State<pisteReflexion> {

  @override
  Widget build(BuildContext context) {
          final thinkingController = Get.put(ThinkingController());

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
            const SizedBox(
              width: 40,
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFBAAB90),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: thinkingController.thinkings.length,
              itemBuilder: (context, index) => Row(
                children: <Widget>[
                  Expanded(child: Text(thinkingController.thinkings[index].name)),
                  CustomCheckBox(
                    // value: value,
                    // key: Key(index.toString()),
                    onChanged: (value) {
                      Thinking thinking = thinkingController.thinkings[index];

                    },
                  ),

                ],
              ),
              
            ),
                          TextButton(onPressed: () =>
              Get.to(dashboardProjectPage()), child: Text("Return to home page"))
          ],
        ),
      ),
    );
  }
}
