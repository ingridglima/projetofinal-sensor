import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

import '../entities/Medida.dart';
import '../services/http_service.dart';

import 'package:flutter/foundation.dart';

void main() {
  return runApp(Reservoir());
}

class Reservoir extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Histórico',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  _MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  var uri = Uri.http('waterhelp.000webhostapp.com', '/esp-data.php');

  late List<Medida> medidas = [];

  late Medida ultimaMedida = Medida("", 0, "");

  final HttpService httpService = HttpService();

  var imagem = 'nivel_agua_vazio';

  @override
  initState() {
    super.initState();
    setState(() {
      getMedidas();
      debugPrint('saiu do getDados');
    });
  }

  Future<void> getMedidas() async {
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

      setState(() {
        medidas = bodyList
            .map(
              (dynamic item) => Medida.fromJson(item),
            )
            .toList();
        ultimaMedida = getLast();
        if (ultimaMedida.litros <= 0) {
          imagem = 'nivel_agua_vazio';
        } else if (ultimaMedida.litros > 0 && ultimaMedida.litros <= 5) {
          imagem = 'nivel_agua_5';
        } else if (ultimaMedida.litros > 5 && ultimaMedida.litros <= 10) {
          imagem = 'nivel_agua_10';
        } else if (ultimaMedida.litros > 10 && ultimaMedida.litros <= 15) {
          imagem = 'nivel_agua_15';
        } else if (ultimaMedida.litros > 15 && ultimaMedida.litros <= 20) {
          imagem = 'nivel_agua_20';
        } else if (ultimaMedida.litros > 20 && ultimaMedida.litros <= 25) {
          imagem = 'nivel_agua_25';
        } else if (ultimaMedida.litros > 25 && ultimaMedida.litros <= 30) {
          imagem = 'nivel_agua_30';
        } else if (ultimaMedida.litros > 30 && ultimaMedida.litros <= 35) {
          imagem = 'nivel_agua_35';
        } else if (ultimaMedida.litros > 35 && ultimaMedida.litros <= 40) {
          imagem = 'nivel_agua_40';
        } else if (ultimaMedida.litros > 40 && ultimaMedida.litros <= 45) {
          imagem = 'nivel_agua_45';
        } else if (ultimaMedida.litros > 45 && ultimaMedida.litros <= 50) {
          imagem = 'nivel_agua_50';
        } else if (ultimaMedida.litros > 50 && ultimaMedida.litros <= 55) {
          imagem = 'nivel_agua_55';
        } else if (ultimaMedida.litros > 55 && ultimaMedida.litros <= 60) {
          imagem = 'nivel_agua_60';
        } else if (ultimaMedida.litros > 60 && ultimaMedida.litros <= 65) {
          imagem = 'nivel_agua_65';
        } else if (ultimaMedida.litros > 55 && ultimaMedida.litros <= 70) {
          imagem = 'nivel_agua_70';
        } else if (ultimaMedida.litros > 70 && ultimaMedida.litros <= 75) {
          imagem = 'nivel_agua_75';
        } else if (ultimaMedida.litros > 75 && ultimaMedida.litros <= 80) {
          imagem = 'nivel_agua_80';
        } else if (ultimaMedida.litros > 80 && ultimaMedida.litros <= 85) {
          imagem = 'nivel_agua_85';
        } else if (ultimaMedida.litros > 85 && ultimaMedida.litros <= 90) {
          imagem = 'nivel_agua_90';
        } else if (ultimaMedida.litros > 90 && ultimaMedida.litros <= 95) {
          imagem = 'nivel_agua_95';
        } else if (ultimaMedida.litros > 95 && ultimaMedida.litros <= 100) {
          imagem = 'nivel_agua_100';
        } else if (ultimaMedida.litros > 100 && ultimaMedida.litros <= 105) {
          imagem = 'nivel_agua_105';
        } else if (ultimaMedida.litros > 105 && ultimaMedida.litros <= 110) {
          imagem = 'nivel_agua_110';
        } else if (ultimaMedida.litros > 110 && ultimaMedida.litros <= 115) {
          imagem = 'nivel_agua_115';
        } else if (ultimaMedida.litros > 115 && ultimaMedida.litros <= 120) {
          imagem = 'nivel_agua_120';
        } else if (ultimaMedida.litros > 120 && ultimaMedida.litros <= 125) {
          imagem = 'nivel_agua_125';
        } else if (ultimaMedida.litros > 125 && ultimaMedida.litros <= 130) {
          imagem = 'nivel_agua_130';
        } else if (ultimaMedida.litros > 130 && ultimaMedida.litros <= 135) {
          imagem = 'nivel_agua_135';
        } else if (ultimaMedida.litros > 135 && ultimaMedida.litros <= 140) {
          imagem = 'nivel_agua_140';
        } else {
          imagem = 'nivel_agua_transbordado';
        }

        debugPrint(imagem);
      });
    } else {
      throw "Unable to retrieve medidas." + res.body;
    }
  }

  Medida getLast() {
    return medidas.elementAt(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Nível do Reservatório",
          style: TextStyle(
            color: Color.fromARGB(255, 151, 38, 38),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 15,
            ),
            Image.asset(
              'assets/images/' + imagem + '.png',
              height: 350,
              width: 250,
            ),
            const SizedBox(
              height: 15,
            ),
            // Text(
            //   ultimaMedida.data +
            //      ' ' +
            //     ultimaMedida.litros.toString() +
            //   ' ' +
            // ultimaMedida.temperatura.toString(),
            //   style: TextStyle(
            //    fontSize: 16,
            //   )),

            const Center(
              child: Text(
                'Dados da última medição',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'Momento da Medição: ' + ultimaMedida.data,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                'Nível do Reservatório: ' + ultimaMedida.litros.toString(),
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                'Temperatudo do Chip: ' +
                    ultimaMedida.temperatura.toString() +
                    ' ºC',
                // ignore: prefer_const_constructors
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
