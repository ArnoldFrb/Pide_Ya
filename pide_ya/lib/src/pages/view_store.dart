import 'package:flutter/material.dart';
import 'package:pide_ya/colors/colors.dart';
import 'package:pide_ya/src/pages/list_products.dart';

class VStorePage extends StatefulWidget {
  @override
  _VStorePageState createState() => _VStorePageState();

  static const String ROUTE = "/vstore";

}

class _VStorePageState extends State<VStorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: <Widget> [
                Container(
                  height: 300
                ),
                Container(
                  height: 250,
                  child: Center(
                    child: Image.asset('assets/PideYa.png', fit: BoxFit.fitWidth)
                  )
                ),
                Opacity(
                  opacity: 1,
                  child: Container(
                    color: Colors.white10,
                    height: 250,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: IconButton(
                                  icon: Icon(Icons.keyboard_arrow_left), 
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                )
                              ),
                              Expanded(
                                flex: 8,
                                child: Text(
                                  "TIENDA",
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
                                  icon: Icon(Icons.favorite), 
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                )
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 4,
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
                        color: Colors.amber[400],
                      ),
                      height: 100,
                      child: Center(
                        child: Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container()
                            ),
                            Text("DIR: Cl 11A #29-2 a 29-150",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18
                              )
                            ),
                            Text("Viveres y mas",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16
                              )
                            ),
                            Expanded(
                              flex: 1,
                              child: Container()
                            ),
                          ]
                        )
                      )
                    )
                  )
                )
              ]
            ),
            Card(
              elevation: 0.0,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: cPideYaAmber50,
                          child: IconButton(
                            color: cPideYaRedGray,
                            icon: Icon(Icons.add_shopping_cart_rounded),
                            onPressed: () {
                              Navigator.pushNamed(context, LProductsPage.ROUTE);
                            }
                          )
                        ),
                        Text("Pedir")
                      ]
                    )
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: cPideYaAmber50,
                          child: IconButton(
                            color: cPideYaRedGray,
                            icon: Icon(Icons.remove_shopping_cart_rounded),
                            onPressed: () {
                              print("OK");
                            }
                          )
                        ),
                        Text("Cancelados")
                      ]
                    )
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: cPideYaAmber50,
                          child: IconButton(
                            color: cPideYaRedGray,
                            icon: Icon(Icons.remove_circle),
                            onPressed: () {
                              print("OK");
                            }
                          )
                        ),
                        Text("Rechazados")
                      ]
                    )
                  )
                ]
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 220.0,
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
    margin: const EdgeInsets.all(10.0),
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
      height: 100,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Expanded(
                  child: ListTile(
                    title: Text("PEDIDO"),
                    subtitle: Text("Estado: Procesando"),
                  )
                ),
                Expanded(child: Container()),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: [
                        Icon(Icons.attach_money),
                        Text("0.0")
                      ]
                    )
                  )
                  )
              ]
            )
          ),
          Expanded(
            flex: 1,
            child: IconButton(
              color: cPideYaRedGray,
              icon: Icon(Icons.cancel),
              onPressed: () {
                print("Ok");
              }
            )
          )
        ]
      ),
    )
  );
}