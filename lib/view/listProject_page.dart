import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inwealth/controller/data_controller.dart';
import 'package:inwealth/view/dashboardProject_page.dart';
import 'package:inwealth/view/onboard_page.dart';

class ListProject extends StatefulWidget {
  ListProject({Key? key}) : super(key: key);

  @override
  State<ListProject> createState() => _ListProjectState();
}

List<bool> test = [];

class _ListProjectState extends State<ListProject> {
  DataController test = DataController();

  getListProject() {
    test.getListeProjet(profileController.userId).then((value) {
      profileController.listProjetEnd = value;
      if (profileController.listProjetEnd?.cederEntreprise == true && profileController.listProjet.contains("Ceder Entreprise") == false) {
        profileController.listProjet.add("Ceder Entreprise");
      }
      if (profileController.listProjetEnd?.transmettreEntreprise == true && profileController.listProjet.contains("Transmettre Entreprise") == false) {
        profileController.listProjet.add("Transmettre Entreprise");
      }
      if (profileController.listProjetEnd?.matriserImpot == true && profileController.listProjet.contains("Maitriser Impot") == false) {
        profileController.listProjet.add("Maitriser Impot");
      }
      // profileController.listProjet.add(profileController.listProjetEnd.cederEntreprise);
      print("TESTESTEST liste de projet BOOL : " + profileController.listProjetEnd!.cederEntreprise.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    print("liste de projets fini");
    print(profileController.endProject);

    return Scaffold(
        body: FutureBuilder(
            future: (getListProject()),
            builder: (context, snapshot) {
              return ListView.separated(
                itemCount: profileController.listProjet.length,
                itemBuilder: (context, index) {
                  return Container(
                      height: 50,
                      child: Center(
                          child: TextButton(
                              onPressed: () => Get.to(dashboardProjectPage()),
                              child:
                                  Text(profileController.listProjet[index]))));
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              );
            }
            // child: ListView.separated(
            //   itemCount: profileController.listProjet.length,
            //   itemBuilder: (context, index) {
            //   return Container(
            //     height: 50,
            //     child: Center(child: TextButton(
            //       onPressed: () => Get.to(dashboardProjectPage()),
            //       child:
            //       Text(profileController.listProjet[index])))
            //   );
            // }
            // , separatorBuilder: (BuildContext context, int index) => const Divider(),
            //   ),
            ));
  }
}
