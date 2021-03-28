import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    home: Racha()
  ));
}

class Racha extends StatefulWidget {
  @override
  _RachaState createState() => _RachaState();
}

class _RachaState extends State<Racha> {
  final _controller = TextEditingController();

  double _var1; //valor da conta
  int _var2; //num de pessoas
  int _var3 = 0;  //pessoas que bebem
  int _var4 = 0;
  double _percent = 0.0;
  double _total = 0;
  int _num = 0;
  double _drunk = 0;
  double _notDrunk = 0;
  double _tip = 0;
  double _subTotal;
  String _s1 = '0.00', _s2 = '0.00', _s3 = '0.00', _s4 = '0.00';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Racha Conta'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),

      resizeToAvoidBottomInset: false,


      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[


          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                labelText: "Digite o valor da conta: "
              ),
              onChanged: (String value){
                setState(() {
                  _var1 = double.parse(value);
                });
              }
            ),
          ),

          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: TextField(
              keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Digite o numero de pessoas: "
                ),
                onChanged: (String value){
                  setState(() {
                    _var2 = int.parse(value);
                  });
                }
            ),
          ),

          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Digite o numero de pessoas que bebem: "
                ),
                onChanged: (String value){
                  setState(() {
                    _var3 = int.parse(value);
                  });
                }
            ),
          ),

          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Digite a quantidade de bebidas ao preco de R\$10.00: "
                ),
                onChanged: (String value){
                  setState(() {
                    _var4 = int.parse(value);
                  });
                }
            ),
          ),

          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text('Porcentagem do garcom'),
          ),

          Slider(
            value: _percent,
            min: 0,
            max: 100,
            label: "$_percent",
            divisions: 10,
            onChanged: (double value){
              setState(() {
                _percent = value;
              });
            }
          ),


          ElevatedButton(
            child: Text('Calcular'),
            onPressed:(){
              setState(() {
                _tip = _var1 * (_percent/100);
                _total = _var1 + _tip;
                _subTotal = drunk(_total, _var2, _var3, _var4);
                _drunk = _subTotal/_var3;
                _notDrunk = (_total - _subTotal) / (_var2 - _var3);
                _s1 = _tip.toStringAsFixed(2);
                _s2 = _total.toStringAsFixed(2);
                _s3 = _drunk.toStringAsFixed(2);
                _s4 = _notDrunk.toStringAsFixed(2);
              });
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green),
            ),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 5),
            child: Text('Valor garcom: R\$ $_s1'),
          ),

          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 5),
            child: Text('Valor total: R\$ $_s2'),
          ),

          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 5),
            child: Text('Valor individual para os que bebem: R\$ $_s3'),
          ),

          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 5),
            child: Text('Valor individual: R\$ $_s4'),
          ),

        ]
      ),

    );
  }
}

double drunk(double conta, int num, int drunk, int beverage){
  double subTotal;
  int y = beverage*10;
  subTotal = conta - (y);
  subTotal = subTotal/num * drunk + y;
  return subTotal;
}