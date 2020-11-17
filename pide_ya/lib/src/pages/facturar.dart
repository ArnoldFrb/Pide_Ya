import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pide_ya/colors/colors.dart';

class FacturarPage extends StatefulWidget {
  @override
  _FacturarPageState createState() => _FacturarPageState();

  static const String ROUTE = "/facturar";

}

class _FacturarPageState extends State<FacturarPage> {

  //final _formKey = GlobalKey<FormState>();
  final _costoController = TextEditingController();
  final _comentarioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: <Widget> [
                Card(
                  margin: const EdgeInsets.all(0),
                  elevation: 5,
                  child: Container(
                  height: 105
                )
                ),
                Opacity(
                  opacity: 1,
                  child: Container(
                    color: Colors.amber[400],
                    height: 105,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: IconButton(
                                  color: cPideYaRedGray,
                                  icon: Icon(Icons.keyboard_arrow_left), 
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                )
                              ),
                              Expanded(
                                flex: 8,
                                child: Text(
                                  "PEDIDO",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18
                                  )
                                )
                              ),
                              Expanded(
                                flex: 2,
                                child: IconButton(
                                  color: cPideYaRedGray,
                                  icon: Icon(Icons.call), 
                                  onPressed: () {
                                    print("OK");
                                  },
                                )
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            "0.0",
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        )
                      ]
                    ),
                  )
                )
              ]
            ),
            Container(
              height: MediaQuery.of(context).size.height - 250.0,
              child: ListView(
                children: [
                  _listPedidos(context),
                  _listPedidos(context),
                  _listPedidos(context),
                  _listPedidos(context),
                  _listPedidos(context),
                  _listPedidos(context)
                ]
              )
            ),
            SizedBox(height: 10),
            Center(
              child: Row(
                children: [
                  Expanded(child: SizedBox()),
                  SizedBox(
                    width: 120,
                    height: 50,
                    child: FlatButton(
                      onPressed: () {
                        print("OK");
                      }, 
                      child: Text("Rechazar")
                    )
                  ),
                  SizedBox(
                    width: 120,
                    height: 50,
                    child: RaisedButton(
                      elevation: 5,
                      child: Text(
                        "Aceptar",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      onPressed: () {
                        _showMyDialog(context, _costoController, _comentarioController);
                      },
                    )
                  ),
                  Expanded(child: SizedBox()),
                ]
              )
            ),
            SizedBox(height: 10),
            Center(
              child: SizedBox(
                width: 120,
                height: 50,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  }, 
                  child: Text("Cancelar")
                )
              )
            )
          ]
        )
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}

Widget _listPedidos(context){
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    margin: const EdgeInsets.all(5.0),
    color: Colors.white,
    elevation: 5,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.amber[200],
          width: 8,
        )
      ),
      height: 90,
      child: ListTile(
        title: Text("VERDURAS"),
        subtitle: Text("3 Tomates rojos"),
        trailing: IconButton(
          color: cPideYaRedGray,
          icon: Icon(Icons.check_circle),
          onPressed: () {
            print("OK");
          }
        )
      )
    )
  );
}

Future<void> _showMyDialog(context, _costoController, _comentarioController) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Agregar producto'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              TextField(
                controller: _costoController,
                keyboardType: TextInputType.number,
                maxLength: 7,
                decoration: InputDecoration(
                  //filled: true,
                  labelText: 'Costo',
                ),
              ),
              // spacer
              SizedBox(height: 5.0),
              // [Password]
              TextField(
                controller: _comentarioController,
                decoration: InputDecoration(
                  //filled: true,
                  labelText: 'Detalle',
                ),
                obscureText: true,
              )
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.pop(context);
              _costoController.clear();
              _comentarioController.clear();
            }, 
            child: Text("Cancelar")
          ),
          RaisedButton(
            elevation: 5.0,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Enviar")
          ),
        ],
      );
    },
  );
}