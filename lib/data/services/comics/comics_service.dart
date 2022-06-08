import 'dart:convert';
import 'package:comics_challenge/data/models/comics_model.dart';
import 'package:comics_challenge/data/models/detail_model.dart';
import 'package:comics_challenge/data/services/ENV.dart' as env;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class ComicsService {
  listComics() async {
    var comics;
    var resp = await http
        .get(Uri.parse('${env.url}/issues/?api_key=${env.apiKey}&format=json'));
    if (resp.statusCode == 200) {
      var result = Comics.fromJson(json.decode(resp.body));
      comics = result.results;
    } else {
      Fluttertoast.showToast(msg: 'Error...');
    }
    return comics;
  }

  comicDetail(url) async {
    var comics;
    var resp =
        await http.get(Uri.parse('$url?api_key=${env.apiKey}&format=json'));
    if (resp.statusCode == 200) {
      var result = Detail.fromJson(json.decode(resp.body));
      comics = result.results;
    } else {
      Fluttertoast.showToast(msg: 'Error...');
    }
    return comics;
  }
}
