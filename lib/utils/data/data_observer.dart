import 'package:http/http.dart';
import 'package:inwealth/utils/data/http_status_code.dart';

class DataObserver {
  void onFetch(Uri uri, Response response) {
    if (response.statusCode != HttpStatusCode.Ok) {
      throw Exception(
          "Failed to fetch @ ${uri.path} : ${response.reasonPhrase} - ${response.body}");
    }
  }

  void onDelete(Uri uri, Response response) {
    if (response.statusCode != HttpStatusCode.Ok) {
      throw Exception(
          "Failed to delete @ ${uri.path} : ${response.reasonPhrase} - ${response.body}");
    }
  }

  void onPost(Uri uri, Response response) {
    if (response.statusCode != HttpStatusCode.Ok) {
      throw Exception(
          "Failed to post @ ${uri.path} : ${response.reasonPhrase} - ${response.body}");
    }
  }

  void onPut(Uri uri, Response response) {
    if (response.statusCode != HttpStatusCode.Ok) {
      throw Exception(
          "Failed to put @ ${uri.path} : ${response.reasonPhrase} - ${response.body}");
    }
  }
}
