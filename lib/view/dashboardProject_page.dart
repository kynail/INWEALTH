import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;

import 'package:inwealth/controller/data_controller.dart';
import 'package:inwealth/utils/data/data_provider.dart';
import 'package:inwealth/view/dashboard_page.dart';
import 'package:inwealth/view/dashboarddashboard.dart';
import 'package:inwealth/view/document_page.dart';
import 'package:inwealth/view/onboard_page.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart';

import '../controller/pisteReflexion_controller.dart';
import 'dashboardBody_page.dart';
import 'meeting_page.dart';

class dashboardProjectPage extends StatefulWidget {
  dashboardProjectPage({Key? key}) : super(key: key);

  @override
  State<dashboardProjectPage> createState() => _dashboardProjectPageState();
}

DataController test = DataController();

ThinkingController thinking = ThinkingController();

Future<File> saveDocument(
  String userGuid,
) async {
  Directory directory = await getTemporaryDirectory();

  File document = File("${directory.path}/Réflexion_Patrimoniale_UK.pdf");

  Response response =
      await DataProvider.fetch("/user/getReflexPatFile/$userGuid");

  document = await document.writeAsBytes(response.bodyBytes);

  return document;
}

File? getDoc() {
  saveDocument(profileController.userId)
      .then((value) => profileController.doc = value);
  return (profileController.doc);
}

ahtchoum() {
  test.getPistes().then((value) {
    print("list think think : " + thinking.think.toString());
    if (thinking.think == null) {
      thinking.think = value;
      print("think token : " + thinking.think.toString());
      thinking.pisteExperte = value.expertThinkings;
      print("Piste experte : " + thinking.pisteExperte.toString());
      thinking.pistePrioritaire = value.priorityThinkings;
      print("Piste prioritaire : " + thinking.pisteNonPrioritaire.toString());
      thinking.pisteNonPrioritaire = value.nonPriorityThinkings;
      print(
          "Piste non prioritaire : " + thinking.pisteNonPrioritaire.toString());
    } else {
      print("ok ok ok ok ok ok");
      getDoc();
    }
    // thinking.piste = value.retainedThinkings[1];
    print("test récupération pistes ok ");
    // print(thinking.piste);
    // thinking.piste = va
    // profileController.userId = value.id;
    // prefs!.setString('userID', profileController.userToken!.id);
    // print("valuuuue : " + value.id.toString());
    // print("value 2 : " + profileController.userToken!.id);
  });
}

class _dashboardProjectPageState extends State<dashboardProjectPage> {
  String Project = "";
  int _currentIndex = 1;
  // int profileController.current      Index = 0;

  bool _isLoading = false;
  String Country = "";
  String Projets = "";
  Color purp1 = Color(0xFF5E5B74);
  Color purp2 = Color(0xFF272243);
  Color gold1 = Color(0xFFD5C6AC);
  Color gold2 = Color(0xFFBAAB90);
  Color gold3 = Color(0xFF97876A);
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  // ignore: prefer_final_fields
  static List<Widget> _widgetOptions = <Widget>[
    dashboardBodyPage(),
    DocumentPage(),
    MeetingPage(),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      profileController.currentIndex = index;
    });
  }

  @override
  void initState() {
    print("humhumhumhum");
    ahtchoum();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("fuuu");
    print("testhumomfg");

    final thinkingController = Get.put(ThinkingController());

    expertController.docu = false;
    expertController.appbarCalendar = false;

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Get.to(DashboardNavigation()),
          ),
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
        body: profileController.widgetOptions
            .elementAt(profileController.currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: gold1,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.picture_as_pdf),
              label: 'Business',
              backgroundColor: purp1,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: 'Meeting',
              backgroundColor: gold3,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
              backgroundColor: purp2,
            ),
          ],
          currentIndex: profileController.currentIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ));
  }
}
