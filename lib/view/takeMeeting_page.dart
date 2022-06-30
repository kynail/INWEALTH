import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inwealth/view/dashboardProject_page.dart';
import 'package:inwealth/view/meeting_page.dart';
import 'package:inwealth/view/onboard_page.dart';
import 'package:inwealth/view/ressources_page.dart';

import '../utils/calendar/calendar.dart';

class TakeMeeting extends StatefulWidget {
  TakeMeeting({Key? key}) : super(key: key);

  @override
  State<TakeMeeting> createState() => _TakeMeetingState();
}

class _TakeMeetingState extends State<TakeMeeting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Color(0xFF665840),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(
                image: AssetImage(profileController.residenceFiscall == "france"
                    ? "assets/images/france.png"
                    : profileController.residenceFiscall == "uk"
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
        body: Container(
          height: 500,
          margin: EdgeInsets.symmetric(horizontal: 20),

            child: Center(
              
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 30,
                    ),
                    Container(
                      height: 40,
                      child: Text("Make an appointment"),
                    ),
                                        profileController.date != null ? 
                    Text(profileController.date.toString())
                    : Container(),
                    Container(height: 20,),
                    Container(
                      height: 300,
                        child: Container(
                          height: 200,
                          child: Calendar(
                            selected: profileController.date,
                            saveChanges: (value) {
                              setState(() {
                                profileController.date = value;
                                
                              });
                            },
                          ),
                        ),
                    ),
                    Container(height: 20,),
                    TextButton(
                      onPressed: () {
                        // if (_formKey.currentState!.validate()) {
                        //   _formKey.currentState!.save();
                        // }
                        profileController.currentIndex = 2;
                        Get.to(dashboardProjectPage());
                      },
                      child: const Text('Take a meeting and choose an expert',
                      style: TextStyle(color: Colors.black),),
                    ),
                    profileController.date != null ? 
                    Text(profileController.date.toString())
                    : Container(),
                    // Container(height: 20,),
                          
                          
                  ],
                ),
              ),
            ),
        ));
  }
}
