import 'package:flutter/material.dart';
import 'package:pide_ya/colors/colors.dart';

class AskForPage extends StatefulWidget {
  @override
  _AskForPageState createState() => _AskForPageState();

  static const String ROUTE = "/askfor";

}

class _AskForPageState extends State<AskForPage> {
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
                  elevation: 10.0,
                  child: Container(
                    height: 85
                  )
                ),
                Opacity(
                  opacity: 1,
                  child: Container(
                    color: Colors.amber[400],
                    height: 85,
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
                )
              ]
            ),
            Container(
              height: MediaQuery.of(context).size.height - 100.0,
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
                    subtitle: Text("Estado: Procesado"),
                  )
                ),
                Expanded(child: Container()),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: [
                        Icon(Icons.attach_money),
                        Text("23.000")
                      ]
                    )
                  )
                )
              ]
            )
          ),
          Expanded(
          flex: 1,
          child: Column(
            children: [
              Expanded(
                child: IconButton(
                  icon: Icon(Icons.monetization_on), 
                  onPressed: () {
                    print("OK");
                  },
                )
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(Icons.money_off), 
                  onPressed: () {
                    print("OK");
                  },
                )
              )
            ]
          )
        )
        ]
      ),
    )
  );
}