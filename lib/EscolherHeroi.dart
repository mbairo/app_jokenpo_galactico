import 'package:flutter/material.dart';
import 'package:mb_jokenpo/TelaPrincipal.dart';

class EscolherHeroi extends StatefulWidget {
  const EscolherHeroi({super.key});

  @override
  State<EscolherHeroi> createState() => _EscolherHeroiState();
}

var _heroiEscolhido;

// Métodos
void _escolherHeroi(String heroi) {
  _heroiEscolhido = heroi;
}




class _EscolherHeroiState extends State<EscolherHeroi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Escolha do Heroi", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold), ),

          Padding(padding: EdgeInsets.only(bottom: 70)),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                child: Image.asset('img/pedra.png', height: 100),
                onTap: () => _escolherHeroi("pedra"),
              ),
              GestureDetector(
                child: Image.asset('img/pedra.png', height: 100),
                onTap: () => _escolherHeroi("papel"),
              ),
              GestureDetector(
                child: Image.asset('img/pedra.png', height: 100),
                onTap: () => _escolherHeroi("tesoura"),
              ),
            ],
          ),

          Padding(padding: EdgeInsets.only(top: 20)),


          ElevatedButton(
            child: Text(
              "Jogar",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
              ),
            ),
            onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TelaPrincipal())
              );
            },
          )
        ],
      ),
    );
  }
}