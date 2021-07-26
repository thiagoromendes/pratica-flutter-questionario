import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/resultado.dart';
import './questionario.dart';
main() => runApp(PerguntaApp());

class PerguntaApp extends StatefulWidget {

  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _notaTotal = 0;
  final List<Map<String, Object>> _perguntas = const [
    {
      'texto':'Qual a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'nota': 10},
        {'texto': 'Vermelho', 'nota': 8},
        {'texto': 'Verde', 'nota': 5},
        {'texto': 'Branco', 'nota': 1}
      ],
    },
    {
      'texto':'Qual seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'nota': 10},
        {'texto': 'Cobra', 'nota': 5},
        {'texto': 'Elefante', 'nota': 8},
        {'texto': 'Leão', 'nota': 1}
      ],
    },
    {
      'texto':'Qual seu instrutor favorito?',
      'respostas': [
        {'texto': 'Maria', 'nota': 10},
        {'texto': 'João', 'nota': 9},
        {'texto': 'Leo', 'nota': 10},
        {'texto': 'Pedro', 'nota': 1}
      ],
    }
  ];

  void _responder(int nota){
    if(temPerguntaSelecionada){
      setState(() {
        _perguntaSelecionada++;
        _notaTotal += nota;
      });
    }
  }

  void _reiniciarQuestionario(){
    setState(() {
      _perguntaSelecionada = 0;
      _notaTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text('Perguntas')),
        ),
        body: temPerguntaSelecionada ? Questionario(
          perguntas: _perguntas,
          perguntaSelecionada: _perguntaSelecionada,
          responder: _responder,
        ): Resultado(_notaTotal, _reiniciarQuestionario)
      ),
    );
  }
}