import 'package:flutter/material.dart';
import 'package:pide_ya/colors/colors.dart';

class DirectionPage extends StatefulWidget {
  @override
  _DirectionPageState createState() => _DirectionPageState();

  static const String ROUTE = "/direction";

}

class _DirectionPageState extends State<DirectionPage> {
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
                                child: Container()
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
                                Icons.map,
                                color: cPideYaRedGray
                              )
                            ),
                            Expanded(
                              child: Text("Mapa")
                            ),
                            Expanded(
                              child: Container()
                            ),
                            Expanded(
                              child: IconButton(
                                color: cPideYaRedGray,
                                icon: Icon(Icons.add_circle_rounded),
                                onPressed: () {
                                  print("OK");
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
              height: MediaQuery.of(context).size.height - 200.0,
              child: ListView(
                children: [
                  _listPedidos(context),
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
        title: Text("CASA"),
        subtitle: Text("DIR: Cl 11A #29-2 a 29-150"),
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