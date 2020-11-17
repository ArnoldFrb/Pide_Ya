import 'package:flutter/material.dart';
import 'package:pide_ya/colors/colors.dart';

class LProductsPage extends StatefulWidget {
  @override
  _LProductsPageState createState() => _LProductsPageState();

  static const String ROUTE = "/lproducts";

}

class _LProductsPageState extends State<LProductsPage> {

  final _productsController = TextEditingController();
  final _detalleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: <Widget> [
                Container(
                  height: 150
                ),
                Opacity(
                  opacity: 1,
                  child: Container(
                    color: Colors.amber[400],
                    height: 115,
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
                          child: Container(),
                        )
                      ]
                    ),
                  )
                ),
                Positioned(
                  bottom: 0.0,
                  right: 20,
                  left: 20,
                  child: Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.white,
                      ),
                      height: 60,
                      child: Center(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container()
                            ),
                            Expanded(
                              child: Icon(
                                Icons.shopping_basket,
                                color: cPideYaRedGray
                              )
                            ),
                            Expanded(
                              child: Text("5")
                            ),
                            Expanded(
                              child: Container()
                            ),
                            Expanded(
                              child: IconButton(
                                color: cPideYaRedGray,
                                icon: Icon(Icons.add_circle_rounded),
                                onPressed: () {
                                  _showMyDialog(context, _productsController, _detalleController);
                                },
                              )
                            ),
                            Expanded(
                              child: Text("Add")
                            ),
                            Expanded(
                              child: Container()
                            )
                          ]
                        )
                      )
                    )
                  )
                )
              ]
            ),
            Container(
              height: MediaQuery.of(context).size.height - 270.0,
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
            SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: 120,
                height: 50,
                child: RaisedButton(
                  elevation: 5,
                  child: Text(
                    "Enviar",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  onPressed: () {
                    print("OK");
                  },
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
        leading: IconButton(
          color: cPideYaRedGray,
          icon: Icon(Icons.edit),
          onPressed: () {
            print("OK");
          }
        ),
        title: Text("VERDURAS"),
        subtitle: Text("3 Tomates rojos"),
        trailing: IconButton(
          color: cPideYaRedGray,
          icon: Icon(Icons.delete),
          onPressed: () {
            print("OK");
          }
        )
      )
    )
  );
}

Future<void> _showMyDialog(context, _productsController, _detalleController) async {
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
                controller: _productsController,
                decoration: InputDecoration(
                  //filled: true,
                  labelText: 'Nombre',
                ),
              ),
              // spacer
              SizedBox(height: 12.0),
              // [Password]
              TextField(
                controller: _detalleController,
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
              _productsController.clear();
              _detalleController.clear();
            }, 
            child: Text("Cancelar")
          ),
          RaisedButton(
            elevation: 5.0,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Login")
          ),
        ],
      );
    },
  );
}