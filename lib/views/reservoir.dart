import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../entities/Medida.dart';
import '../services/http_service.dart';

import 'package:flutter/foundation.dart';
  
void main() {
  return runApp(Reservoir());
}
  
class Reservoir extends StatelessWidget{

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
       });

    } else {
      throw "Unable to retrieve medidas." + res.body;
    }
  }
  
  Medida getLast(){
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
            Image.asset('assets/images/Logo.png'),
            const SizedBox(
              height: 15,
            ),
            Text(ultimaMedida.data + ' ' + ultimaMedida.litros.toString() + ' ' + ultimaMedida.temperatura.toString(),
                style: TextStyle(
                  fontSize: 16,
                )),
            const SizedBox(
              height: 40,
            ),
            const SizedBox(
              height: 40,
            ),
            const Center(
              child: Text(
                'Contato',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                'Rua: Av marginal, 585, Fazenda Nossa Senhora do Jaguari ',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Text(
                'Email: omnimed@gmail.com ',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Text(
                'Telefone: +55 19987654321',
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