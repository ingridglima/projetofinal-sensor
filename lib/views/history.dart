import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../entities/Medida.dart';
  
void main() {
  return runApp(History());
}
  
class History extends StatelessWidget {
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
            title: ChartTitle(text: 'Litros X Data'),
            // Enable legend
            legend: Legend(isVisible: true),
            // Enable tooltip
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <ChartSeries<Medida, String>>[
              LineSeries<Medida, String>(
                  dataSource: <Medida>[
                    Medida('Jan', 10),
                    Medida('Feb', 25.5),
                    Medida('Mar', 35.5),
                    Medida('Apr', 45.5),
                    Medida('May', 55.5),
                    Medida('Jun', 65.5)
                  ],
                  xValueMapper: (Medida medidas, _) => medidas.data,
                  yValueMapper: (Medida medidas, _) => medidas.litros,
                  // Enable data label
                  dataLabelSettings: DataLabelSettings(isVisible: true))
            ]));
  }
}