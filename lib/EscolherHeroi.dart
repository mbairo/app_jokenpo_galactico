import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mb_jokenpo/TelaPrincipal.dart';

class EscolherHeroi extends StatefulWidget {
  const EscolherHeroi({Key? key}) : super(key: key);

  @override
  State<EscolherHeroi> createState() => _EscolherHeroiState();
}

class _EscolherHeroiState extends State<EscolherHeroi> {
  String? _heroiEscolhido;
  bool _heroiSelecionado = false;

  void _escolherHeroi(String heroi) {
    setState(() {
      _heroiEscolhido = heroi;
      _heroiSelecionado = true;
    });
  }

  Widget _buildHeroImage(String imagePath, String nomeDoHeroi) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: _heroiEscolhido == nomeDoHeroi
                ? Colors.yellow
                : Colors.transparent,
            width: 4.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Image.asset(imagePath, height: 200),
      ),
      onTap: () => _escolherHeroi(nomeDoHeroi),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Escolha do Heroi",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),

          Padding(padding: EdgeInsets.only(bottom: 50)),

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     _buildHeroImage('img/robot.png', 'robot'),
          //     _buildHeroImage('img/et.png', 'et'),
          //     _buildHeroImage('img/astronautaMulher.png', 'humano'),
          //   ],
          // ),

          Wrap(
            alignment: WrapAlignment.spaceEvenly,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              _buildHeroImage('img/robot.png', 'robot'),
              _buildHeroImage('img/et.png', 'et'),
              // _buildHeroImage('img/astronauta.png', 'humano'),
              _buildHeroImage('img/astronautaMulher.png', 'humano'),
            ],
          ),

          Padding(padding: EdgeInsets.only(top: 40)),

          if (_heroiSelecionado)
            ElevatedButton(
              child: Text(
                "Jogar",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          TelaPrincipal(nomeDaImgHeroi: _heroiEscolhido)),
                );
              },
            )
        ],
      ),
    );
  }
}
