import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List> fetchWpPostforTopPage() async {
  final response = await http.get(
      'https://news.tv24africa.com/wp-json/wp/v2/posts/?per_page=1',
      headers: {"Accept": "application/json"});

  var convertDatatoJson = jsonDecode(response.body);
  print('Converted data = ${convertDatatoJson.runtimeType}');
  return convertDatatoJson;
}