import 'package:flutter/material.dart';
import 'package:pide_ya/colors/colors.dart';
import 'package:pide_ya/src/pages/facturar.dart';

class AskForsPage extends StatefulWidget {
  @override
  _AskForsPageState createState() => _AskForsPageState();

  static const String ROUTE = "/askfors";

}

class _AskForsPageState extends State<AskForsPage> {
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
              height: MediaQuery.of(context).size.height - 110.0,
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
    child: Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: 95,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: Colors.amber[200],
                width: 8,
              )
            ),
            child: Image.asset('assets/PideYa.png', fit: BoxFit.fitWidth),
          )
        ),
        SizedBox(width: 5.0),
        Expanded(
          flex: 3,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0)
                ),
                child: ListTile(
                  title: Text("ARNOLD FRAGOZO"),
                  subtitle: Text("DIR: Cl 11A #29-2 a 29-150"),
                  trailing: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, FacturarPage.ROUTE);
                    },
                    icon: Icon(Icons.more)
                  ),
                  isThreeLine: false,
                )
              ),
              Text("23.000")
            ]
          )
        )
      ]
    )
  );
}