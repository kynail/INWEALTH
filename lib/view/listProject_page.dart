import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inwealth/view/dashboardProject_page.dart';
import 'package:inwealth/view/onboard_page.dart';

class ListProject extends StatefulWidget {
  ListProject({Key? key}) : super(key: key);

  @override
  State<ListProject> createState() => _ListProjectState();
}

  List<bool> test = [];

class _ListProjectState extends State<ListProject> {

  
  @override
  Widget build(BuildContext context) {

  print("liste de projets fini");
  print(profileController.endProject);


    return Scaffold(
      body: ListView.separated(
        itemCount: profileController.listProjet.length,
        itemBuilder: (context, index) {
        return Container(
          height: 50,
          child: Center(child: TextButton(
            onPressed: () => Get.to(dashboardProjectPage()),
            child:  
            Text(profileController.listProjet[index])))
        );
      }
      , separatorBuilder: (BuildContext context, int index) => const Divider(),
    ));
  }
}