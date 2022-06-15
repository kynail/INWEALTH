import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inwealth/view/document_page.dart';
import 'package:inwealth/view/onboard_page.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../controller/pisteReflexion_controller.dart';
import 'dashboardBody_page.dart';
import 'meeting_page.dart';

class dashboardProjectPage extends StatefulWidget {
  dashboardProjectPage({Key? key}) : super(key: key);

  @override
  State<dashboardProjectPage> createState() => _dashboardProjectPageState();
}

class _dashboardProjectPageState extends State<dashboardProjectPage> {
  String Project = "";
  int _currentIndex = 1;
  int _currentIndex2 = 0;

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
      _currentIndex2 = index;
    });
  }

  @override
  Widget build(BuildContext context) {
      final thinkingController = Get.put(ThinkingController());

    expertController.docu = false;
    expertController.appbarCalendar = false;

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
        body: _widgetOptions.elementAt(_currentIndex2),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home!',
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
          currentIndex: _currentIndex2,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        )
        );
  }
}
