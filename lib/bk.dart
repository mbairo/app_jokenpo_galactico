import 'package:flutter/material.dart';
import 'dart:math';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  var _imgEscolhidaPeloApp = AssetImage("img/padrao.png");
  var _imgSelecionadoPeloUsuario = AssetImage("img/padrao.png");
  var _msgDoResultado = "X";
  var placarApp = 0;
  var placarUsuario = 0;

  Color corDaBordaApp = Colors.transparent;
  Color corDaBordaUsuario = Colors.transparent;
  Color corDoTextoResultado = Colors.red;
  Color corDaBordaEmpate = Colors.transparent;

  void _escolhaDoUsuario(String imgEscolhidaPeloUsuario) {
    var listaDeOpcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaDoApp = listaDeOpcoes[numero];

    this._imgSelecionadoPeloUsuario =
        AssetImage("img/$imgEscolhidaPeloUsuario.png");

    switch (escolhaDoApp) {
      case "pedra":
        setState(() {
          this._imgEscolhidaPeloApp = AssetImage("img/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this._imgEscolhidaPeloApp = AssetImage("img/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imgEscolhidaPeloApp = AssetImage("img/tesoura.png");
        });
        break;
    }

    if ((imgEscolhidaPeloUsuario == "pedra" && escolhaDoApp == "tesoura") ||
        (imgEscolhidaPeloUsuario == "tesoura" && escolhaDoApp == "papel") ||
        (imgEscolhidaPeloUsuario == "papel" && escolhaDoApp == "pedra")) {
      _msgDoResultado = "Usuário ganhou!";
      corDoTextoResultado = Colors.green;
      corDaBordaUsuario = Colors.green;
      corDaBordaApp = Colors.transparent;
      placarUsuario += 1;
    } else if ((escolhaDoApp == "pedra" &&
        imgEscolhidaPeloUsuario == "tesoura") ||
        (escolhaDoApp == "tesoura" && imgEscolhidaPeloUsuario == "papel") ||
        (escolhaDoApp == "papel" && imgEscolhidaPeloUsuario == "pedra")) {
      _msgDoResultado = "App ganhou!";
      corDoTextoResultado = Colors.blue;
      corDaBordaApp = Colors.blue;
      corDaBordaUsuario = Colors.transparent;
      placarApp += 1;
    } else {
      _msgDoResultado = "Empate";
      corDoTextoResultado = Colors.black;
      corDaBordaUsuario = Colors.black;
      corDaBordaApp = Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // backgroundColor: Colors.black26,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Seção do App  ------------------------------------------------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                child: Image.asset("img/pedra.png", height: 100),
              ),
              GestureDetector(
                child: Image.asset("img/papel.png", height: 100),
              ),
              GestureDetector(
                child: Image.asset("img/tesoura.png", height: 100),
              )
            ],
          ),

          const Padding(
            padding: EdgeInsets.only(top: 0, bottom: 0),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Placar App----
          Container(
            margin: EdgeInsets.only(bottom: 3),
            width: 75,
            decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.blue, width: 3),
              borderRadius: BorderRadius.circular(
                  5),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical:
                  4),
              child: Text(
                placarApp.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Img da esolha do app
          Container(
            child: ClipOval(
              child: Image(image: this._imgEscolhidaPeloApp),
            ),
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              border: Border.all(color: this.corDaBordaApp, width: 4),
              shape: BoxShape.circle,
            ),
          ),
          // Fim da seção App *************************************************

          // Msg Central  ------------------------------------------------
          Padding(
            padding: EdgeInsets.only(top: 0, bottom: 0),
            child: Text(
              this._msgDoResultado,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: this.corDoTextoResultado,
              ),
            ),
          ),
          // Fim da Msg Central  ------------------------------------------

          // Seção do Usuário  ------------------------------------------------
          Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              border: Border.all(color: this.corDaBordaUsuario, width: 4),
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: Image(image: this._imgSelecionadoPeloUsuario),
            ),
          ),

          // Placar Usuário----
          Container(
            margin: EdgeInsets.only(top: 3),
            width: 75,
            decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.green, width: 3),
              borderRadius: BorderRadius.circular(
                  5),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical:
                  4),
              child: Text(
                placarUsuario.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(top: 0, bottom: 0),
            child: Text(
              "Escolha do Usuário",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                child: Image.asset("img/pedra.png", height: 100),
                onTap: () => _escolhaDoUsuario("pedra"),
              ),
              GestureDetector(
                child: Image.asset("img/papel.png", height: 100),
                onTap: () => _escolhaDoUsuario("papel"),
              ),
              GestureDetector(
                child: Image.asset("img/tesoura.png", height: 100),
                onTap: () => _escolhaDoUsuario("tesoura"),
              )
            ],
          )
        ],
      ),
    );
  }
}
