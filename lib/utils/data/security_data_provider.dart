import 'dart:convert';
import 'package:inwealth/utils/data/data_provider.dart';
import 'package:inwealth/utils/data/user_token_transfert.dart';
import '../../view/onboard_page.dart';
import 'i_security_data_provider.dart';


class SecurityDataProvider implements ISecurityDataProvider {
  @override
  Future<UserTokenTransfert> authentifyUser() async {
    print("test" + profileController.residenceFiscall);

    String path = "/user/saveProfil";
    // DataProvider.post(path, body: {"residenceFiscale":"France", "nationalite":"france"}).then((response) 
    // {UserTokenTransfert.fromJson(jsonDecode(response.body));
    // profileController.userId = response.body;});
    // print(profileController.userId);
    return DataProvider.post(path, body: {"residenceFiscale":profileController.residenceFiscall}).then(
        (response) => UserTokenTransfert.fromJson(jsonDecode(response.body)));
  }
}
