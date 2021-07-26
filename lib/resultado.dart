import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int nota;
  final void Function() reiniciarQuestionario;

  Resultado(this.nota, this.reiniciarQuestionario);

  String get fraseResultado {
    if(nota < 8){
      return 'Parabéns';
    } else if(nota < 12){
      return 'Você é bom';
    } else if(nota < 16){
      return 'Impressionante';
    } else {
      return 'Nível Jedi';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
          ),
      ),
        TextButton(
            onPressed: reiniciarQuestionario,
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
            child:
              Text(
                'Reiniciar Questionário',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              )
        )
      ],
    );
  }
}
