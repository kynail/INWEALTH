// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InterProjectPage extends StatefulWidget {
  InterProjectPage({Key? key}) : super(key: key);

  @override
  State<InterProjectPage> createState() => _InterProjectPageState();
}

class _InterProjectPageState extends State<InterProjectPage> {
  int? groupValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(alignment: AlignmentDirectional.bottomCenter, children: [
            Container(
                decoration: BoxDecoration(
              image: DecorationImage(
                  // colorFilter: ColorFilter.mode(
                  //     Colors.black.withOpacity(0.2),
                  //     BlendMode.srcATop),
                  image: AssetImage("assets/icons/efl_colored.png"),
                  fit: BoxFit.cover),
              shape: BoxShape.rectangle,
            )),
            Container(
              height: 280,
              decoration: BoxDecoration(
                // borderRadius: const BorderRadius.all(Radius.circular(20)),
                image: DecorationImage(
                    // colorFilter: ColorFilter.mode(
                    //     Colors.black.withOpacity(0.2),
                    //     BlendMode.srcATop),
                    image: AssetImage("assets/france.jpg"),
                    fit: BoxFit.cover),
                shape: BoxShape.rectangle,
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Icon(Icons.cancel_outlined, color: Colors.white)),
            // Padding(
            //   padding: EdgeInsets.only(bottom: 10),
            //   child: Container(
            //     height: 80,
            //     decoration: BoxDecoration(
            //                       image: DecorationImage(
            //           // colorFilter: ColorFilter.mode(
            //           //     Colors.black.withOpacity(0.2),
            //           //     BlendMode.srcATop),
            //           image: AssetImage("assets/icons/efl_colored.png"),
            //           // fit: BoxFit.cover
            //           ),
            //       shape: BoxShape.rectangle,
            //     )
            //   ),
            // )
            Padding(
              padding: EdgeInsets.only(bottom: 10, left: 40),
              child: Image(
                  color: Colors.white,
                  height: 40,
                  image: AssetImage("assets/icons/efl_colored.png")),
            )
          ]),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.only(right: 99),
            child: Text("Idées de projet",
                style: TextStyle(fontSize: 38, fontWeight: FontWeight.w500)),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(right: 10, left: 20),
            child: Text(
                "Nous vous proposons des pistes de réflexion patrimoniale adaptées à votre résidence fiscale et validées par nos partenaires.",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300)),
          ),
          Padding(
              padding: EdgeInsets.only(top: 10, right: 30, left: 30),
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: CupertinoSlidingSegmentedControl<int>(
                    backgroundColor: CupertinoColors.systemGrey5,
                    thumbColor: CupertinoColors.systemGrey,
                    padding:
                        EdgeInsets.only(right: 25, left: 25, top: 5, bottom: 5),
                    groupValue: groupValue,
                    children: {
                      0: Container(
                          child: Text(
                        "     Financer     ",
                      )),
                      1: Container(
                          child: Text(
                        "     Anticiper     ",
                      )),
                      2: Container(
                          child: Text(
                        "     Gérer     ",
                      )),
                    },
                    onValueChanged: (value) {
                      setState(() {
                        groupValue = value;
                      });
                    }),
              )),
          Container(
              decoration: BoxDecoration(
            image: DecorationImage(
                // colorFilter: ColorFilter.mode(
                //     Colors.black.withOpacity(0.2),
                //     BlendMode.srcATop),
                image: AssetImage("assets/icons/efl_colored.png"),
                fit: BoxFit.cover),
            shape: BoxShape.rectangle,
          )),
          SizedBox(height: 10,),
          Container(
              child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 90),
                      child: Text("Investir dans l'immobilier", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15))),
                    Padding(
                      padding: EdgeInsets.only(right: 125),
                      child: Text("Résidence secondaire")),
                  ],
                ),
              ),
              // SizedBox(
              //   width: 10,
              // ),
              Flexible(child: Text("Detail")),
              Flexible(
                child: TextButton(
                  onPressed: () => null,
                  style: const ButtonStyle(),
                  // padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      const Icon(Icons.info_rounded, color: Colors.white),
                    ],
                  ),
                ),
              ),
              Container(
                child: Icon(
                  Icons.chevron_right,
                  // color: gold2,
                ),
              ),
            ],
          )),
          SizedBox(height: 20,),
          Container(
              child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 17),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Transmettre son patrimoine", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                    Padding(
                      padding: EdgeInsets.only(right: 90),
                      child: Text("Situé en France")),
                  ],
                ),
              ),
              SizedBox(
                width: 77,
              ),
              Flexible(child: Text("Detail")),
              Flexible(
                child: TextButton(
                  onPressed: () => null,
                  style: const ButtonStyle(),
                  // padding: EdgeInsets.all(10.0),
                  child: Column(
                    
                    children: [
                      const Icon(Icons.info_rounded, color: Colors.white),
                    ],
                  ),
                ),
              ),
              Container(
                child: Icon(
                  Icons.chevron_right,
                  // color: gold2,
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
