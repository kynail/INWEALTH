import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:inwealth/utils/data/data_observer.dart';

abstract class DataProvider {
  static String baseUri = "http://51.158.107.134:3000/inwealth";
  static DataObserver dataObserver = DataObserver();

  static Future<http.Response> fetch(String path) async {
    Uri uri = Uri.parse(baseUri + path);
    http.Response response =
        await http.get(uri, headers: {"content-type": "application/json"});

    dataObserver.onFetch(uri, response);

    return response;
  }

  static Future<http.Response> delete(String path) async {
    Uri uri = Uri.parse(baseUri + path);

    http.Response response =
        await http.delete(uri, headers: {"content-type": "application/json"});

    dataObserver.onDelete(uri, response);

    return response;
  }

  static Future<http.Response> post(String path, {Object? body}) async {
    String stringifiedBody = jsonEncode(body);

    Uri uri = Uri.parse(baseUri + path);
    http.Response response = await http.post(uri,
        headers: {"content-type": "application/json"}, body: stringifiedBody);

    dataObserver.onPost(uri, response);

    return response;
  }

  static Future<http.Response> put(String path, {Object? body}) async {
    String stringifiedBody = jsonEncode(body);

    Uri uri = Uri.parse(baseUri + path);
    http.Response response = await http.put(uri,
        headers: {"content-type": "application/json"}, body: stringifiedBody);

    dataObserver.onPut(uri, response);

    return response;
  }
}
