import 'package:flutter/material.dart';

void main() {
  runApp(MyCalculator());
}

class MyCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora IMC',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  // Variáveis para armazenar os valores dos operandos
  double _value1 = 0;
  double _value2 = 0;
  double _resultAltura = 0;

  // Variável para armazenar o resultado das operações
  double _result = 0;

  //função da altura
  void altura() {
    setState(() {
      _resultAltura = _value2 * _value2;
    });
  }

  // Função para o imc
  void _imc() {
    setState(() {
      _result = _value1 / _resultAltura;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora IMC'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Campo de entrada para o primeiro operando
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Digite seu peso em kg:'),
              onChanged: (value) {
                _value1 = double.tryParse(value) ?? 0;
              },
            ),
            SizedBox(height: 20.0),
            // Campo de entrada para o segundo operando
            TextField(
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(labelText: 'Digite sua altura em cm:'),
              onChanged: (value) {
                _value2 = double.tryParse(value) ?? 0;
                altura();
              },
            ),
            SizedBox(height: 20.0),
            // Botões para realizar as operações
            ElevatedButton(
              onPressed: _imc,
              child: Text('Calcular:'),
            ),

            // Exibição do resultado
            Text(
              'De acordo com seu peso e altura, o IMC ideal é: ${_value1 / (_resultAltura / 10000)}',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'Giovana Duarte n°08',
            )
          ],
        ),
      ),
    );
  }
}
