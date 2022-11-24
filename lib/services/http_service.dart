import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/foundation.dart';

import '../entities/Medida.dart';

class HttpService {

  //var uri = Uri.http('localhost:5000', '/getall');
  var uri = Uri.https('waterhelp.000webhostapp.com', '/esp-data.php');
  final String apiURL = "http://localhost:5001/getall";
  //final String apiURL = "http://waterhelp.000webhostapp.com/esp-data.php";

  Future<List<Medida>> getMedidas() async {

    Map<String, String> requestHeaders = {
       'Content-type': 'application/json',
       'Accept': 'application/json',
       'Access-Control-Allow-Origin': '*'
     };

    debugPrint('entrou');
    Response res = await get(uri, headers: requestHeaders);

    debugPrint('chegou');
    //debugPrint('TESTE'+res.body);

    if (res.statusCode == 200) {

      dynamic body = jsonDecode(res.body);

      List<dynamic> bodyList = body['result'];

      //debugPrint(bodyList.toString());
    
      List<Medida> medidas = bodyList
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