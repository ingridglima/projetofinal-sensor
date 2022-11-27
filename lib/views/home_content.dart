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
              height: 40,
            ),
             const Text('A medição dos níveis de águas fluviais torna-se necessária para propiciar a criação de estratégias mitigadoras para prevenção de enchentes e para períodos de estiagem. Além disso, possibilita a melhor gestão e utilização da água para outros fins, como a agricultura, psicultura, geração de energia, entre outros.',
             textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16,
              )),

              const Text('A utilização de sensores de onda ultrasônicas, neste viés, possibilitam que seja feita uma medicação segura, alcançando lugares remotos. Tais sensores medem o tempo que um pulso de onda emitido leva até ser refletido pela superfície da água até o receptor. Tal medição pode ser considerada de baixo custo, com uma implantação relativamente barata.',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16,
              )),
            const SizedBox(
              height: 40,
            ),
            const SizedBox(
              height: 15,
            ),
            Image.asset('assets/images/Imagem1.jpg',
            width: 300,
            height: 300,),
            const SizedBox(
              height: 15,
            ),
             const SizedBox(
              height: 40,
            ),
             const Text('A placa ESP-32 pode ser considera uma aliada na medição dos níveis das águas fluviais. A placa tem um custo barato e possui diversas ferramentas já acopladas. O ESP32 apresenta-se como um meio inovador no desenvolvimento de projetos automatizados. Esse pequeno componente demonstra ser mais versátil do que seu antecessor, o ESP8266, pois além do clássico módulo de comunicação Wi-Fi, apresenta um sistema com processador Dual Core, Bluetooth híbrido, leitor de cartão SD e múltiplos sensores embutidos, tornando a construção de sistema como internet das coisas (IoT) muito mais simples e compacto.',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16,
              )),
            const SizedBox(
              height: 40,
            ),
            const SizedBox(
              height: 15,
            ),
            Image.asset('assets/images/Imagem2.jpg',
            width: 300,
            height: 300,),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(
              height: 40,
            ),
             const Text('Dessa forma, podemos utilizar a ESP-32 juntamente com o sensor ultrassônico para realizarmos uma medicação segura dos níveis das águas fluviais utilizando Wi-Fi, Bluetooth ou rede telefônica móvel:',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16,
              )),
            const SizedBox(
              height: 40,
            ),
            const SizedBox(
              height: 15,
            ),
            Image.asset('assets/images/Imagem3.png'),
            const SizedBox(
              height: 40,
            ),
            const Center(
              child: Text(
                'Integrantes',
                style: TextStyle(
                  fontSize: 25,
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
                'Larissa Ribeiro',
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
