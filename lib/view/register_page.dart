import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inwealth/controller/data_controller.dart';
import 'package:inwealth/view/dashboardProject_page.dart';
import 'package:inwealth/view/juridique_page.dart';
import 'package:inwealth/view/login_page.dart';
import 'package:inwealth/view/onboard_page.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
DataController test = DataController();

  postLogin() {
    test.postLogin(profileController.userId).then((value) {
      
    });
  }

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Image(image: AssetImage("assets/iNw_app.png")),
              SizedBox(
                height: 10,
              ),
              Text("register".tr),
              SizedBox(
                height: 30,
              ),
              DropdownButtonFormField2(
                decoration: InputDecoration(
                  //Add isDense true and zero Padding.
                  //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(15),
                  // ),
                  //Add more decoration as you want here
                  //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                ),
                isExpanded: true,
                hint: profileController.indic != ""
                    ? Text(profileController.indic)
                    : Text(
                        'indicatif'.tr,
                        style: TextStyle(fontSize: 14),
                      ),
                icon: const Icon(
                  Icons.arrow_drop_down,
                  // color: Colors.black45,
                ),
                iconSize: 30,
                buttonHeight: 60,
                // buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                items: parameters.indicatif
                    .map((item) => DropdownMenuItem<String>(
                          value: item.key,
                          child: Text(
                            item.name,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                validator: (value) {
                  if (profileController.indic != "") {
                  } else if (value == null) {
                    return 'Please select your indic.';
                  }
                },
                onChanged: (value) {
                  setState(() {
                    selectedValue = value as String;

                      profileController.indic = selectedValue!;
                      print("mais what ?? : " + profileController.indic);
                      prefs!
                          .setString('residenceFiscale', profileController.indic);
                    
                  });
                },
                onSaved: (value) {
                  selectedValue = value.toString();
                },
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                    keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 0,
                    vertical: 0,
                  ),
                  hintText: 'phone'.tr,
                  hintStyle: const TextStyle(fontSize: 14),
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(15),
                  // ),
                ),
                onChanged: (value) {
                  setState(() {
                    selectedValue = value as String;
                    profileController.phone = selectedValue!;
                  });
                },
                onSaved: (value) {
                  selectedValue = value.toString();
                },
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 0,
                    vertical: 0,
                  ),
                  hintText: 'password'.tr,
                  hintStyle: const TextStyle(fontSize: 14),
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(15),
                  // ),
                ),
                onChanged: (value) {
                  setState(() {
                    selectedValue = value as String;
                    profileController.mdp = selectedValue!;
                  });
                },
                onSaved: (value) {
                  selectedValue = value.toString();
                },
              ),
              SizedBox(
                height: 30,
              ),
              // Text("forget password ?"),
              // SizedBox(height: 30,),
              Container(
                height: 60,
                width: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color(0xFF7F7A93)),
                child: TextButton(
                    onPressed: () {
        
                      FutureBuilder(
                        future: postLogin()
                        ,builder: (context, snapshot) {
                          return LoginPage();
                        }
                        );
                        print("TTTTTTTTTEEEEEEST TEST : \n indic: "+ profileController.indic + "\n phone: "+ profileController.phone + "\n pwd : " + profileController.mdp);
                        postLogin();
        
                        Get.to(LoginPage());
                      },
                    child: Text("return".tr,
                    style: TextStyle(color: Colors.white) )),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(15),
        child: Container(
          child: Row(children: <Widget>[
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                color: const Color(0xFF494661),
                height: 2,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Image(
              image: AssetImage('assets/images/inw-logo.png'),
              height: 30,
              width: 30,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                color: const Color(0xFF494661),
                height: 2,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
          ]),
        ),
      ),
    );
  }
}
