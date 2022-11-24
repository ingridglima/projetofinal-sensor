import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../entities/Medida.dart';
import '../services/http_service.dart';

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
  // ignore: prefer_const_constructors_in_immutables
  _MyHomePage({Key? key}) : super(key: key);
  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
  
class _MyHomePageState extends State<_MyHomePage> {

  var uri = Uri.http('waterhelp.000webhostapp.com', '/esp-data.php');

  late List<Medida> medidas = [];

  final HttpService httpService = HttpService();

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
          debugPrint(medidas.elementAt(0).data);
          debugPrint(medidas.elementAt(0).litros.toString());
       });

    } else {
      throw "Unable to retrieve medidas." + res.body;
    }
  }
  
  //  Future<void> getDados() async{ 
  //     medidas = await httpService.getMedidas();
  //     debugPrint('GETDADOS $medidas');
    
  //  }

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
            title: ChartTitle(text: "Litros X Data"),
            // Enable legend
            legend: Legend(isVisible: true),
            // Enable tooltip
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <ChartSeries<Medida, String>>[
              LineSeries<Medida, String>(
                  dataSource: medidas,
                  xValueMapper: (Medida medidas, _) => medidas.data,
                  yValueMapper: (Medida medidas, _) => medidas.litros,
                  // Enable data label
                  dataLabelSettings: DataLabelSettings(isVisible: true))
            ])
            
      );
  }

}