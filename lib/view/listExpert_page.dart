import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inwealth/controller/expert_controller.dart';
import 'package:inwealth/view/dashboardProject_page.dart';
import 'package:inwealth/view/meeting_page.dart';
import 'package:inwealth/view/onboard_page.dart';

class listExpertPage extends StatefulWidget {
  listExpertPage({Key? key}) : super(key: key);

  @override
  State<listExpertPage> createState() => _listExpertPageState();
}

class _listExpertPageState extends State<listExpertPage> {
  Expert? expert = expertController.experts[1];

  @override
  Widget build(BuildContext context) {
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
                        // fontFamily: 'assets/fonts/SFPRODISPLAYBOLD.OTF',
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
        body: Align(
          // alignment: Alignment.topLeft,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 15, top: 15, bottom: 10),
                  child: Text("Votre cercle iNwealth",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                    "Ajoutez vos conseils dans les échanges avec votre expert iNwealth",
                    style: TextStyle(fontSize: 18)),
              ),
              Padding(
                  padding: EdgeInsets.all(15),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: TextButton(
                      onPressed: () => null,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              child: ClipOval(
                                child: Image.asset(
                                  expert!.url,
                                  height: 75,
                                  width: 75,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      expert!.name,
                                      style: TextStyle(
                                          // color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Ingénieur Patrimonial",
                                      style: TextStyle(
                                        fontSize: 12,
                                        // color:
                                        //  Colors.grey
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 5),
                                    ),
                                    Text(
                                      "Expert Marché France",
                                      style: TextStyle(
                                        fontSize: 12,
                                        // color: Colors.grey
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              child: Icon(
                                Icons.chevron_right,
                                // color: gold2,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.all(15),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: TextButton(
                        onPressed: () => null,
                        child: Row(
                          children: [
                            Column(
                              children: [],
                            )
                          ],
                        )),
                  )),
              Padding(
                  padding: EdgeInsets.all(15),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: TextButton(
                        onPressed: () => null,
                        child: Row(
                          children: [
                            Column(
                              children: [],
                            )
                          ],
                        )),
                  )),
            ],
          ),
        ));
  }
}
