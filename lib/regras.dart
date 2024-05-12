import 'package:flutter/material.dart';

class Regras extends StatelessWidget {
  const Regras({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/regrasDoJogo.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
