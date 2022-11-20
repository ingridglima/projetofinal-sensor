import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../entities/Medida.dart';
import '../services/http_service.dart';
  
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

  final HttpService httpService = HttpService();

  late List<Medida> medidas = [];

   @override
    initState() {
      super.initState();
      getDados();
    }
  
   Future<void> getDados() async{
    medidas = await httpService.getMedidas();
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
            ]));
  }

}