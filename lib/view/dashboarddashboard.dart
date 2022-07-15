import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inwealth/view/dashboardBody_page.dart';
import 'package:inwealth/view/dashboard_page.dart';
import 'package:inwealth/view/document_page.dart';
import 'package:inwealth/view/listProject_page.dart';
import 'package:inwealth/view/login_page.dart';
import 'package:inwealth/view/meeting_page.dart';
import 'package:inwealth/view/onboard_page.dart';

class DashboardNavigation extends StatefulWidget {
  DashboardNavigation({Key? key}) : super(key: key);

  @override
  State<DashboardNavigation> createState() => _DashboardNavigationState();
}

int _currentIndex2 = 0;

class _DashboardNavigationState extends State<DashboardNavigation> {
  static List<Widget> _widgetOptions = <Widget>[
    DashboardPage(),
    ListProject(),
    MeetingPage(),
    Text(
      'Index 3: Settings',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex2 = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    ahtchoum();
                    print("test bool end project ");
                // log("testteeeeeeeeeeeest");
                print(profileController.endProject);
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Color(0xFF665840),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.center,
              child: Center(
                child: Text(
                  "iNwealth",
                  style: TextStyle(
                      // fontFamily: 'assets/fonts/SFPRODISPLAYBOLD.OTF',
                      fontSize: 34,
                      // color: Colors.black,
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
      body: _widgetOptions.elementAt(_currentIndex2),
      bottomNavigationBar: profileController.islog == false
          ? TextButton(
              onPressed: () => Get.to(LoginPage()),
              child: const Text(
                'INwealth ? Connectez-vous',
                // style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            )
          : BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                  backgroundColor: gold1,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.list_alt_outlined),
                  label: 'Projets',
                  backgroundColor: purp1,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_month),
                  label: 'Meeting',
                  backgroundColor: gold3,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.document_scanner),
                  label: 'documents',
                  backgroundColor: purp2,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notification_important),
                  label: 'Notification',
                  backgroundColor: purp2,
                ),
              ],
              currentIndex: _currentIndex2,
              selectedItemColor: Colors.amber[800],
              onTap: _onItemTapped,
            ),
    );
  }
}
