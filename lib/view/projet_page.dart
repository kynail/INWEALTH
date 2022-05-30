import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inwealth/view/onboard_page.dart';

class ProjetPage extends StatefulWidget {
  ProjetPage({Key? key}) : super(key: key);

  @override
  State<ProjetPage> createState() => _ProjetPageState();
}

class _ProjetPageState extends State<ProjetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
        // backgroundColor: Color(0xFF665840),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image(
              image: AssetImage(profileController.residenceFiscall == "France"
                  ? "assets/images/france.png"
                  : profileController.residenceFiscall == "United Kingdom" ? "assets/royaume-uni.png" : "assets/images/switzerland.png"),
              height: 40,
              width: 40,
            ),
            // SizedBox(width: 80,),
            Align(
              alignment: Alignment.center,
              child: Center(
                child: const Text(
                  "INWEALTH",
                  style: TextStyle(
                      fontFamily: 'assets/fonts/SFPRODISPLAYBOLD.OTF',
                      color: Color(0xFF524D69)),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              width: 40,
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFBAAB90),
      ),
      // body: ,
    );
  }
}