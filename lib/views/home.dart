import 'package:flutter/material.dart';
import 'package:projeto_final/views/Doors.dart';
import 'package:projeto_final/views/control_panel.dart';
import 'package:projeto_final/views/history.dart';
import 'package:projeto_final/views/home_content.dart';
import 'package:projeto_final/views/reservoir.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  int _indiceAtual = 0;
  List<Widget> views = [HomeContent(), Reservoir(), History()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: views[_indiceAtual]
        ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        type: BottomNavigationBarType.shifting,
        fixedColor: Color.fromARGB(255, 239, 168, 159),
        items: const [
          BottomNavigationBarItem(
            label: "Inicio",
            icon: Icon(Icons.home),
            backgroundColor: Color.fromARGB(255, 151, 38, 38),
          ),
          BottomNavigationBarItem(
            label: "Nível do Reservatório",
            icon: Icon(Icons.analytics),
            backgroundColor: Color.fromARGB(255, 151, 38, 38),
          ),
          BottomNavigationBarItem(
            label: "Histórico de Volumes",
            icon: Icon(Icons.auto_graph),
            backgroundColor: Color.fromARGB(255, 151, 38, 38),
          ),
        ],
        onTap: (indice) {
          setState(() {
            _indiceAtual = indice;
          });
        },
      ),
    );
  }
}
