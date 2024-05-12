import 'package:flutter/material.dart';
import 'dart:math';

class TelaPrincipal extends StatefulWidget {
  final String? _heroiEscolhido;

  const TelaPrincipal({Key? key, String? nomeDaImgHeroi})
      : _heroiEscolhido = nomeDaImgHeroi,
        super(key: key);

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

  void _escolhaDoUsuario(String ataqueSelecionado) {
    var listaDeOpcoes = ["Pedra", "Papel", "Tesoura"];
    var numero = Random().nextInt(3);
    var escolhaDoApp = listaDeOpcoes[numero];

    print("Ataque escolhido na aba 'TelaPrincipal': $ataqueSelecionado");

    if (widget._heroiEscolhido == "et") {
      this._imgSelecionadoPeloUsuario =
          AssetImage("img/et$ataqueSelecionado.png");
    } else if (widget._heroiEscolhido == "humano") {
      this._imgSelecionadoPeloUsuario =
          AssetImage("img/humano$ataqueSelecionado.png");
    } else {
      this._imgSelecionadoPeloUsuario =
          AssetImage("img/robot$ataqueSelecionado.png");
    }

    switch (escolhaDoApp) {
      case "Pedra":
        setState(() {
          this._imgEscolhidaPeloApp = AssetImage("img/appPedra.png");
        });
        break;
      case "Papel":
        setState(() {
          this._imgEscolhidaPeloApp = AssetImage("img/appPapel.png");
        });
        break;
      case "Tesoura":
        setState(() {
          this._imgEscolhidaPeloApp = AssetImage("img/appTesoura.png");
        });
        break;
    }

    if ((ataqueSelecionado == "Pedra" && escolhaDoApp == "Tesoura") ||
        (ataqueSelecionado == "Tesoura" && escolhaDoApp == "Papel") ||
        (ataqueSelecionado == "Papel" && escolhaDoApp == "Pedra")) {
      _msgDoResultado = "Usuário ganhou!";
      corDoTextoResultado = Colors.green;
      corDaBordaUsuario = Colors.green;
      corDaBordaApp = Colors.transparent;
      placarUsuario += 1;
    } else if ((escolhaDoApp == "Pedra" && ataqueSelecionado == "Tesoura") ||
        (escolhaDoApp == "Tesoura" && ataqueSelecionado == "Papel") ||
        (escolhaDoApp == "Papel" && ataqueSelecionado == "Pedra")) {
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
    // Apagar
    print(
        "Escolha realizada na aba 'EscolherHeroi': ${widget._heroiEscolhido}");

    return Scaffold(
      appBar: AppBar(),
      // backgroundColor: Colors.blueGrey[100],

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Seção do App  ------------------------------------------------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                child: Image.asset("img/appPedra.png", height: 100),
              ),
              GestureDetector(
                child: Image.asset("img/appPapel.png", height: 100),
              ),
              GestureDetector(
                child: Image.asset("img/appTesoura.png", height: 100),
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
              border: Border.all(color: Colors.blue, width: 3),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
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
            width: 150,
            height: 150,
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
            width: 150,
            height: 150,
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
              border: Border.all(color: Colors.green, width: 3),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
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
                child: Image.asset("img/${widget._heroiEscolhido}Pedra.png",
                    height: 100),
                onTap: () => _escolhaDoUsuario("Pedra"),
              ),
              GestureDetector(
                child: Image.asset("img/${widget._heroiEscolhido}Papel.png",
                    height: 100),
                onTap: () => _escolhaDoUsuario("Papel"),
              ),
              GestureDetector(
                child: Image.asset("img/${widget._heroiEscolhido}Tesoura.png",
                    height: 100),
                onTap: () => _escolhaDoUsuario("Tesoura"),
              )
            ],
          )
        ],
      ),
    );
  }
}



//TODO: Para colocar uma img de fundo..
/*
Stack(
children: [
// Imagem de fundo
Positioned.fill(
child: Image.asset(
'img/galaxy.jpg',
fit: BoxFit.cover,
),
),
SingleChildScrollView(
*/