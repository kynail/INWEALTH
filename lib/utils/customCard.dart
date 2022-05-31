import 'package:badges/badges.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cardhome extends StatelessWidget {
  final String project;
  const Cardhome({
    required this.project,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FlipCardController controller = FlipCardController();
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(15),
          child: FlipCard(
            fill: Fill.fillBack,
            flipOnTouch: false,
            controller: controller,
            direction: FlipDirection.HORIZONTAL,
            front: Container(
              child: Badge(
                elevation: 10,
                position: BadgePosition.topEnd(top: -9, end: -5),
                badgeContent:
                    Text('7', style: TextStyle(fontWeight: FontWeight.w500)),
                badgeColor: Color(0xFF7F7A93),
                child: Stack(
                  fit: StackFit.passthrough,
                  children: [
                    Container(
                      height: 150.0,
                      width: 150.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF5E5B74),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                                Color(0xFFD5C6AC).withOpacity(1.0),
                                BlendMode.srcATop),
                            image: AssetImage('assets/test.png'),
                            fit: BoxFit.cover),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 150,
                        width: 150,
                        child: Center(
                          child: Text(
                            project,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -8,
                      right: -5,
                      child: TextButton(
                        onPressed: () => controller.toggleCard(),
                        style: ButtonStyle(),
                        // padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Icon(Icons.info_rounded, color: Colors.white)
                          ],
                        ),
                      ),
                    )
                    // InkWell(
                    //   onTap: () => controller.toggleCard(),
                    //   child: Align(
                    //     alignment: Alignment.topRight,
                    //     child: Badge(
                    //       badgeContent: Text('7'),
                    //       badgeColor: Color(0xFF7F7A93),
                    //       // child: Icon(Icons.settings),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            back: Container(
              child: Badge(
                position: BadgePosition.topEnd(top: -9, end: -5),
                badgeContent: Text('7'),
                badgeColor: Color(0xFF5E5B74),
                child: Stack(
                  children: [
                    Container(
                      height: 150.0,
                      width: 150.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                                Color(0xFF7F7A93).withOpacity(1.0),
                                BlendMode.srcATop),
                            image: AssetImage('assets/test.png'),
                            fit: BoxFit.cover),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 150,
                        width: 150,
                        child: Center(
                          child: Text(
                            "BACK",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    // Align(
                    //   alignment: Alignment.topRight,
                    //   child: Badge(
                    //     badgeContent: Text('7'),
                    //     position: BadgePosition.topEnd(),
                    //     badgeColor: Color(0xFF5E5B74),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Text("test"),
      ],
    );
  }
}

class Card2home extends StatelessWidget {
  const Card2home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FlipCardController controller = FlipCardController();

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(15),
          child: FlipCard(
            fill: Fill.fillBack,
            direction: FlipDirection.HORIZONTAL,
            //flipOnTouch: false,
            front: Container(
              child: Badge(
                position: BadgePosition.topEnd(top: -9, end: -5),
                badgeContent: Text('6'),
                badgeColor: Color(0xFF5E5B74),
                child: Stack(
                  fit: StackFit.passthrough,
                  children: [
                    Container(
                      height: 190.0,
                      width: 250.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                                Color(0xFF7F7A93).withOpacity(1.0),
                                BlendMode.srcATop),
                            image: AssetImage('assets/test.png'),
                            fit: BoxFit.cover),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 190,
                        width: 250,
                        child: Center(
                          child: Text(
                            "FRONT",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -6,
                      right: -5,
                      child: TextButton(
                        onPressed: () => controller.toggleCard(),
                        style: ButtonStyle(),
                        // padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Icon(Icons.info_rounded, color: Colors.white)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            back: Container(
              child: Badge(
                position: BadgePosition.topEnd(top: -9, end: -5),
                badgeContent: Text('6'),
                badgeColor: Color(0xFF5E5B74),
                child: Stack(
                  //fit: StackFit.passthrough,
                  children: [
                    Container(
                      height: 190.0,
                      width: 250.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.2),
                                BlendMode.srcATop),
                            image: AssetImage('assets/test.png'),
                            fit: BoxFit.cover),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 190.0,
                        width: 250.0,
                        child: Center(
                          child: Text(
                            "BACK",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Text("test"),
      ],
    );
  }
}