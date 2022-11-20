import 'package:flutter/material.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sistema de Controle e Supervisório",
          style: TextStyle(
            color: Color.fromARGB(255, 151, 38, 38),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF0f928c),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Introdução',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Image.asset('assets/images/Logo.png'),
            const SizedBox(
              height: 15,
            ),
            const Text('Descrição',
                style: TextStyle(
                  fontSize: 16,
                )),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                 Flexible(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.analytics,
                          color: Color.fromARGB(255, 151, 38, 38),
                          size: 35,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text('Nível do Reservatório',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 151, 38, 38))),
                        const SizedBox(
                          height: 10,
                        ),
                        const Center(
                            child: Text('Indica, com imagens, o nível atual do reservatório.',
                                style: TextStyle(fontSize: 16))),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.auto_graph,
                          color: Color.fromARGB(255, 151, 38, 38),
                          size: 35,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text('Histórico de Volumes',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 151, 38, 38))),
                        const SizedBox(
                          height: 10,
                        ),
                        const Center(
                            child: Text('Indica, através de um gráfico, os resultados das medições considerando Litros X Data.',
                                style: TextStyle(fontSize: 16))),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const Center(
              child: Text(
                'Integrantes',
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
                'Gabriel Evaristo',
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
                'Ingrid Lima',
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
                'Larissa Maria',
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
                'Melissa Akatuka',
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
