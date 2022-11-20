import 'dart:convert';
import 'package:http/http.dart';

import '../entities/Medida.dart';

class HttpService {
  final String apiURL = "https://jsonplaceholder.typicode.com/posts";

  Future<List<Medida>> getMedidas() async {
    Response res = await get(apiURL);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Medida> medidas = body
        .map(
          (dynamic item) => Medida.fromJson(item),
        )
        .toList();

      return medidas;
    } else {
      throw "Unable to retrieve medidas." + res.body;
    }
  }
}