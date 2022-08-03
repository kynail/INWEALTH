// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:io';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' hide Response;
import 'package:inwealth/utils/data/data_provider.dart';
import 'package:inwealth/view/meeting_page.dart';
import 'package:inwealth/view/onboard_page.dart';
import 'package:inwealth/view/takeMeeting_page.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:http/http.dart';

import '../controller/expert_controller.dart';
import 'dashboardBody_page.dart';

class DocumentPage extends StatefulWidget {
  DocumentPage({Key? key}) : super(key: key);

  @override
  State<DocumentPage> createState() => _DocumentPageState();
}

class _DocumentPageState extends State<DocumentPage> {
  String documentPath = "";
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

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex2 = index;
    });
  }

  Future<PDFDocument> fetchDocument(
    String userGuid,
  ) {
    return PDFDocument.fromURL(
        "${DataProvider.baseUri}/user/getReflexPatFile/$userGuid");
  }

  Future<File> saveDocument(
    String userGuid,
  ) async {
    Directory directory = await getTemporaryDirectory();

    File document = new File("${directory.path}/Réflexion_Patrimoniale_UK.pdf");

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

  getPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.storage,
    ].request();
  }

  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();

  Future<File> fromAsset(String asset, String filename) async {
    Completer<File> completer = Completer();
    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

  @override
  void initState() {
    super.initState();
    fromAsset('assets/PisteReflexion_UK.pdf', 'PisteReflexion_UK.pdf')
        .then((f) {
      setState(() {
        documentPath = f.path;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // _checkPermission();
    // loadPdf();
    return Scaffold(
        appBar: expertController.docu != false
            ? AppBar(
                // backgroundColor: Color(0xFF665840),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image(
                      image: AssetImage(
                          profileController.residenceFiscall == "france"
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
                            // color: Color(0xFF524D69)
                          ),
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
                // backgroundColor: const Color(0xFFBAAB90),
              )
            : null,
        body: Column(
          children: [
            Container(
              height: 20,
            ),
            Container(
              height: 30,
              child: Text("Preview of your document"),
            ),
            Container(
              height: 20,
            ),
            SizedBox(
              height: 450,
              child: getDoc() == null
                  ? Text("No document load yet")
                  : SfPdfViewer.file(getDoc()!),
            ),
            Container(
              height: 20,
            ),
            TextButton(
                onPressed: () => Get.to(TakeMeeting()),
                child: Text('Take appointment and download')),
          ],
        ),
        bottomNavigationBar: expertController.docu != false
            ? BottomNavigationBar(
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
                currentIndex: _currentIndex2,
                selectedItemColor: Colors.amber[800],
                onTap: _onItemTapped,
              )
            : null);
  }
}
