import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:inwealth/controller/expert_controller.dart';
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
        child: ListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: thinkingController.thinkings.length,
          itemBuilder: (context, index) => Row(
            children: <Widget>[
              Expanded(child: Text(thinkingController.thinkings[index].name)),
              // TextButton(
      
              //   // child: SvgPicture.asset("assets/icons/info.svg"),
              //   onPressed: () {
              //     showCupertinoModalPopup(
              //       context: context,
              //       builder: (context) {
              //         return DismissibleModal(
              //           dismissibleCrossBackgroundColor:
              //               CustomColors.contrastPrimaryColor,
              //           displayDismissibleCross: true,
              //           key: ValueKey(Parameters.thinkings[index]),
              //           child: CustomWebView(
              //             url: Parameters.thinkings[index].url,
              //           ),
              //         );
              //       },
              //     );
              //   },
              // ),
              CustomCheckBox(
                // value: value,
                // key: Key(index.toString()),
                onChanged: (value) {
                  Thinking thinking = thinkingController.thinkings[index];
                  // List<Thinking> retainedThinkings = stateParcours
                  //         .roadmap.retainedThinkings
                  //         .contains(thinking)
                  //     ? stateParcours.roadmap.retainedThinkings
                  //         .where((element) => element != thinking)
                  //         .toList()
                  //     : [
                  //         ...stateParcours
                  //             .roadmap.retainedThinkings,
                  //         thinking,
                  //       ];
      
                  // SecurityService.getUserGuid()
                  //     .then((userGuid) =>
                  //         parcoursCubit.saveRetainedThinkings(
                  //             userGuid!, retainedThinkings))
                  //     .then(
                  //       (value) => parcoursCubit.updateParcours(
                  //         Roadmap.copy(
                  //           stateParcours.roadmap,
                  //           retainedThinkings:
                  //               Optional.value(retainedThinkings),
                  //           areThinkingsSaved:
                  //               Optional.value(value),
                  //         ),
                  //       ),
                  //     )
                  //     .then(
                  //       (_) => documentCubit.resetDocument(),
                  //     );
                },
              )
            ],
          ),
        ),
      ),
      // footer: CustomButton(
      //   color: CustomColors.primaryColor,
      //   borderRadius: const BorderRadius.all(Radius.circular(6.0)),
      //   padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      //   child: Text(
      //     AppLocalizations.of(context)?.translate('Button_finish') ??
      //         "Finish",
      //     style: TextStyle(color: Colors.white),
      //   ),
      //   onPressed: widget.submit,
      // ),
    );
  }
}
