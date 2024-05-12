import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jokenpo_galactico/regras.dart';
import 'package:jokenpo_galactico/sobre.dart';
import 'package:jokenpo_galactico/telaPrincipal.dart';
import 'package:jokenpo_galactico/sobre.dart';

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

  Widget _constroiImgDoHeroi(String imagePath, String nomeDoHeroi) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: _heroiEscolhido == nomeDoHeroi ? Colors.greenAccent : Colors.transparent,
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
            "Escolha do Herói",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),

          Padding(padding: EdgeInsets.only(bottom: 30)),

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     _constroiImgDoHeroi('assets/img/robot.png', 'robot'),
          //     _constroiImgDoHeroi('assets/img/et.png', 'et'),
          //     _constroiImgDoHeroi('assets/img/astronautaMulher.png', 'humano'),
          //   ],
          // ),

          Wrap(
            alignment: WrapAlignment.spaceEvenly,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              _constroiImgDoHeroi('assets/img/robot.png', 'robot'),
              _constroiImgDoHeroi('assets/img/et.png', 'et'),
              // _buildHeroImage('assets/img/astronauta.png', 'humano'),
              _constroiImgDoHeroi('assets/img/astronautaMulher.png', 'humano'),
            ],
          ),

          Padding(padding: EdgeInsets.only(top: 30)),

          if (_heroiSelecionado)
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.greenAccent),
              ),
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
                    builder: (context) => TelaPrincipal(nomeDaImgHeroi: _heroiEscolhido),
                  ),
                );
              },
            )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black, // ícons
        unselectedItemColor: Colors.black.withOpacity(0.5),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.rule),
            label: 'Regras',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Sobre',
          ),
        ],
        onTap: (int index) {
          if (index == 0) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Regras()),
            );
          } else if (index == 1) {
            // Clicou em "Sobre"
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Sobre(),
              ),
            );
          }
        },
      ),
    );
  }
}




