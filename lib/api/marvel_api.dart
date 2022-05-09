import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:marvel_app/models/mavelDTO.dart';

class MarvelApi {
  Future<List<MarvelDTO>> buscarDados() {
    String uri = "https://mcuapi.herokuapp.com/api/v1/movies";
    return http.get(Uri.parse(uri)).then((response) {
      var data = jsonDecode(response.body);
      var list = data['data'] as List;
      return list.map((e) => MarvelDTO.map(e)).toList();
    }).catchError((e) {
      return e;
    });
  }
}
