
import 'package:inwealth/controller/pisteReflexion_controller.dart';
import 'package:inwealth/utils/data/retained_thinkings_transfert.dart';
import 'package:inwealth/utils/parameters.dart';
import 'package:inwealth/utils/list_management.dart';
import '../../view/onboard_page.dart';

abstract class RetainedThinkingTransformer {
  static RetainedThinkingTransfert toRetainedThinkingTransfert(
    List<Thinking> thinkings,
  ) {
    List<String> retainedThinkings = thinkings
        .map((thinking) => Parameters.thinkings
            .find((element) => element.id == thinking.id)
            ?.key)
        .where((element) => element != null)
        .map((element) => element!)
        .toList();

    return RetainedThinkingTransfert(retainedThinkings: retainedThinkings);
  }
}
