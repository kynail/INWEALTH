import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inwealth/controller/expert_controller.dart';
import 'package:inwealth/utils/calendar/date_service.dart';
import 'package:inwealth/view/onboard_page.dart';
import 'package:inwealth/view/takeMeeting_page.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class MeetingPage extends StatefulWidget {
  MeetingPage({Key? key}) : super(key: key);

  @override
  State<MeetingPage> createState() => _MeetingPageState();
}

_onClick() async {
  final Uri _url =
      Uri.parse('https://pexipdemo.com/webapp/home?conference=9999');
  // await Permission.microphone.request();
  // await Permission.camera.request();
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}

final expertController = Get.put(ExpertController());

class _MeetingPageState extends State<MeetingPage> {
  static String username = 'kadage.eg@gmail.com';
  static String mdp = 'miedbvbxobfjojzw';
  Color purp1 = Color(0xFF5E5B74);
  Color purp2 = Color(0xFF272243);
  Color gold1 = Color(0xFFD5C6AC);
  Color gold2 = Color(0xFFBAAB90);
  Color gold3 = Color(0xFF97876A);
  final _formKey = GlobalKey<FormState>();
  
  int _currentIndex2 = 0;

    void _onItemTapped(int index) {
    setState(() {
      _currentIndex2 = index;
    });
  }

  // Future<File> _downloadDocument(DocumentCubit documentCubit, int iff) async {
  //   setState(() {
  //     _isLoading = true;
  //   });

  //   File document = await SecurityService.getUserGuid()
  //       .then((userGuid) => documentCubit.saveDocument(userGuid!));

  //   setState(() {
  //     _isLoading = false;
  //   });
  //   if (iff == 1) await Share.shareFiles(["${document.path}"]);
  //   return document;
  // }

  sendEmail(String email, String nom, DateTime datetest) async {
    final smtpServer = gmail(username, mdp);
    print("EMAIL:  " + email);
    Directory directory = await getTemporaryDirectory();
    String date = DateService.toCompleteDayHourMinutes(datetest);
    // File document = await _downloadDocument(documentCubit, 2);
    // File document = File ("assets/document.pdf");
    //File document = File ("${directory.path}/Réflexion_Patrimoniale_UK.pdf");
    // ByteData byteData = await rootBundle.load("/assets/pisteReflexion_UK.pdf");
    // document = await document.writeAsBytes(byteData.buffer.asUint8List());
    // File document2 = new File("${directory.path}/Réflexion_Patrimoniale_UK.pdf");
    // File document3 = new File("${directory.path}/PisteReflexion_UK.pdf");

    // print(document.path);
    final message = Message()
      ..from = Address(email, "INWEALTH")
      ..recipients.add(email)
      // ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
      // ..bccRecipients.add(Address('bccAddress@example.com'))
      ..subject = 'Invitation participation visio'
      ..text = 'https://pexipdemo.com/webapp/home?conference=9999'
      // ..attachments = [(FileAttachment(document))]
      ..html =
          '<h1>Invitation visio-conférence INWEALTH</h1>\n<p>Bonjour Monsieur $nom, vous avez été invité à participer à une visioconférence le $date </p>\n<a href="https://pexipdemo.com/webapp/home?conference=9999">Lien vers la visio</a>';

    try {
      final SendReport = await send(message, smtpServer);
      print('message sent');
    } on MailerException catch (e) {
      print('message not sent');
      print(e);
      for (var p in e.problems) {
        print('problem: ${p.code}: ${p.msg}');
      }
    }
    // await FlutterEmailSender.send(email);
  }

  void _sendSMS(String nom, List<String> recipents, DateTime datetest) async {
    String date = DateService.toCompleteDayHourMinutes(datetest);
    String msg =
        "Bonjour Monsieur $nom, vous avez été invité à participer à une visioconférence https://pexipdemo.com/webapp/home?conference=9999";
    String _result = await sendSMS(message: msg, recipients: recipents)
        .catchError((onError) {
      print(onError);
    });
    print(_result);
  }

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime;
    profileController.date != null
        ? endTime = profileController.date!.add(const Duration(hours: 1))
        : endTime = startTime.add(const Duration(hours: 1));

    profileController.date != null
        ? meetings.add(Meeting('Visio avec experts', profileController.date!,
            endTime, const Color(0xFF0F8644), false))
        : meetings.add(Meeting(
            'test', startTime, endTime, const Color(0xFF0F8644), false));
    return meetings;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: expertController.appbarCalendar != false ?
        AppBar(
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
        ) : null,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Text("calendrier !"),
              // Container(height: 50,
              // child: Text("expert"),),
              SfCalendar(
                view: CalendarView.week,
                dataSource: MeetingDataSource(_getDataSource()),
                timeSlotViewSettings:
                    (TimeSlotViewSettings(startHour: 9, endHour: 18)),
                monthViewSettings: MonthViewSettings(
                    appointmentDisplayMode:
                        MonthAppointmentDisplayMode.appointment),
                // loadMoreWidgetBuilder: (BuildContext context, LoadMoreCallback loadMoreCallback) {
                //   return FutureBuilder(
                //     future: loadMoreCallback(),
                //     builder: (context, snapshot) {
                //       return Container(
                //         alignment: Alignment.center,
                //         child:
                //       )
                //     }
                //     );
                // },
              ),

              TextButton(
                  onPressed: () => {
                    expertController.appbarCalendar = true,
                    Get.to(TakeMeeting())},
                  child: Text('Take appointment')),
              Container(
                height: 10,
              ),
              profileController.date != null
                  ? TextButton(onPressed: _onClick, child: Text('Go to visio'))
                  : Container(),
              Container(
                height: 10,
              ),
              profileController.date != null
                  ? TextButton(
                      onPressed: () => showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                                content: Stack(
                              children: <Widget>[
                                Positioned(
                                    right: -40,
                                    top: -40,
                                    child: Container(
                                      height: 300,
                                      width: 300,
                                      child: InkResponse(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    )),
                                Form(
                                    key: _formKey,
                                    child: Container(
                                      height: 500,
                                      width: 300,
                                      child: ListView(
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: TextFormField(
                                                    decoration: InputDecoration(
                                                        hintText: "Nom"),
                                                    controller: expertController
                                                        .controllerName,
                                                  )),
                                              Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: TextFormField(
                                                    decoration: InputDecoration(
                                                        hintText: "Prénom"),
                                                    controller: expertController
                                                        .controllerSurame,
                                                  )),
                                              Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: TextFormField(
                                                    decoration: InputDecoration(
                                                        hintText: "Job"),
                                                    controller: expertController
                                                        .controllerJob,
                                                  )),
                                              Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: TextFormField(
                                                    decoration: InputDecoration(
                                                        hintText: "Email"),
                                                    controller: expertController
                                                        .controllerEmail,
                                                  )),
                                              Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: TextFormField(
                                                    decoration: InputDecoration(
                                                        hintText: "Numéro"),
                                                    controller: expertController
                                                        .controllerNumber,
                                                  )),
                                              Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: TextButton(
                                                    onPressed: () {
                                                      if (_formKey.currentState!
                                                          .validate()) {
                                                        _formKey.currentState!
                                                            .save();
                                                        print(expertController
                                                            .controllerEmail
                                                            .text);
                                                        print(expertController
                                                            .controllerName.text);
                                                        sendEmail(
                                                            expertController
                                                                .controllerEmail
                                                                .text,
                                                            expertController
                                                                .controllerName
                                                                .text,
                                                            profileController
                                                                .date!);
                                                        final snackbar = SnackBar(
                                                          content:
                                                              Text("Mail send"),
                                                        );
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                snackbar);
                                                      }
                                                    },
                                                    child: Text("Send email",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                        ))),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: TextButton(
                                                    onPressed: () {
                                                      if (_formKey.currentState!
                                                          .validate()) {
                                                        _formKey.currentState!
                                                            .save();
                                                        print(expertController
                                                            .controllerName.text);
                                                        print(expertController
                                                            .controllerNumber
                                                            .text);
                                                        List<String> number = [
                                                          expertController
                                                              .controllerNumber
                                                              .text
                                                        ];
                                                        _sendSMS(
                                                            expertController
                                                                .controllerName
                                                                .text,
                                                            number,
                                                            profileController
                                                                .date!);
                                                        // sendEmail(controllerEmail.text, controllerName.text, documentCubit);
                                                        final snackbar = SnackBar(
                                                          content:
                                                              Text("SMS send"),
                                                        );
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                snackbar);
                                                      }
                                                    },
                                                    child: Text("Send SMS",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                        ))),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ))
                              ],
                            ));
                          }),
                      child: Text('Send invitation to expert'))
                  : Container(),
              Container(
                height: 10,
              ),
            ],
          ),
        ),
                bottomNavigationBar: expertController.appbarCalendar != false 
                ? BottomNavigationBar(
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
        ) : null,
        );
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}
