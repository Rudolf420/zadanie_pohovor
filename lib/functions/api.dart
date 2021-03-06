import 'package:http/http.dart' as http;
import 'package:zadanie_praca/classes/book.dart';
import 'dart:convert';

class Api {
  static Future<int> getTotal(String name) async {
    String url = "https://api.itbook.store/1.0/search/$name";
    var uri = Uri.parse(url);

    final response = await http.get(uri);

    Map data = jsonDecode(response.body);
    return int.parse(data['total']);
  }

  static Future<List<Book>> getBooks(String name, String page) async {
    String url = "https://api.itbook.store/1.0/search/$name/$page";
    var uri = Uri.parse(url);

    final response = await http.get(uri);

    print(response.body);

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['books']) {
      _temp.add(i);
    }

    return Book.recipesFromSnapshot(_temp);
  }
}
