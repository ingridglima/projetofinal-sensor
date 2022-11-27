import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../entities/Medida.dart';

import 'package:flutter/foundation.dart';
  
void main() {
  return runApp(History());
}
  
class History extends StatelessWidget{

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
  _MyHomePage({Key? key}) : super(key: key);
  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
  
class _MyHomePageState extends State<_MyHomePage> {

  var uri = Uri.http('waterhelp.000webhostapp.com', '/esp-data.php');

  late List<Medida> medidas = [];

   @override
    initState() {
      super.initState();
      setState(() {
        getMedidas();
      });
      
    }

  Future<void> getMedidas() async {

    Map<String, String> requestHeaders = {
       'Content-type': 'application/json',
       'Accept': 'application/json',
       'Access-Control-Allow-Origin': '*'
     };

    debugPrint('Iniciando requisição HTTP...');

    Response res = await get(uri, headers: requestHeaders);


    if (res.statusCode == 200) {

      debugPrint('Requisição realizada com sucesso...');

      dynamic body = jsonDecode(res.body);

      List<dynamic> bodyList = body['result'];

      setState(() {
        medidas = bodyList
          .map(
            (dynamic item) => Medida.fromJson(item),
          )
          .toList();
       });

    } else {
      debugPrint('Falha na requisição...');
      throw "Unable to retrieve medidas." + res.body;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text(
          "Histórico de Volumes",
          style: TextStyle(
            color: Color.fromARGB(255, 151, 38, 38),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
      ),
        body: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            // Chart title
            title: ChartTitle(text: "Quantidade de Litros do Reservatório de acordo com a Data de Medição"),
            // Enable legend
            legend: Legend(isVisible: true),
            // Enable tooltip
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <ChartSeries<Medida, String>>[
              LineSeries<Medida, String>(
                  dataSource: medidas.reversed.toList(),
                  xValueMapper: (Medida medidas, _) => medidas.data,
                  yValueMapper: (Medida medidas, _) => medidas.litros,
                  // Enable data label
                  dataLabelSettings: DataLabelSettings(isVisible: true))
            ])
            
      );
  }

}