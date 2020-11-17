import 'package:flutter/material.dart';
import 'package:pide_ya/colors/colors.dart';
import 'package:pide_ya/src/pages/ask_fors.dart';
import 'package:pide_ya/src/pages/facturar.dart';

class HStorePage extends StatefulWidget {
  @override
  _HStorePageState createState() => _HStorePageState();

  static const String ROUTE = "/hstore";

}

class _HStorePageState extends State<HStorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                  Text(
                    "Home",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35
                    )
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(),
                  )
                ]
              ),
              height: 60,
            ),
            Card(
              margin: const EdgeInsets.all(10.0),
              elevation: 20.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.amber,
                ),
                height: 170,
                child: Column(
                  children: [
                    Expanded(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: cPideYaAmber50,
                          radius: 30,
                          child: IconButton(
                            icon: Icon(Icons.account_circle, color: cPideYaRedGray), onPressed: () {}
                          )
                        ),
                        title: Text("TIENDA"),
                        subtitle: Text("DIR: Cl 11A #29-2 a 29-150"),
                        trailing: IconButton(
                          icon: Icon(Icons.history),
                          onPressed: () {
                            Navigator.pushNamed(context, AskForsPage.ROUTE);
                          }
                        ),
                      )
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Completados",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18
                                    )
                                  )
                                ),
                                Expanded(
                                  child: Text(
                                    "20",
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context).textTheme.subtitle1
                                  )
                                )
                              ]
                            )
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Canelados",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18
                                    )
                                  )
                                ),
                                Expanded(
                                  child: Text(
                                    "5",
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context).textTheme.subtitle1
                                  )
                                )
                              ]
                            )
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Rechazados",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18
                                    )
                                  )
                                ),
                                Expanded(
                                  child: Text(
                                    "5",
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context).textTheme.subtitle1
                                  )
                                )
                              ]
                            )
                          )
                        ]
                      )
                    )
                  ],
                ),
              )
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
                            icon: Icon(Icons.shopping_cart_rounded),
                            onPressed: () {
                              print("OK");
                            }
                          )
                        ),
                        Text("Pedidos")
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
            SizedBox(height: 10),
            Container(
              height: MediaQuery.of(context).size.height - 310.0,
              child: ListView(
                children: [
                  _listStore(context),
                  _listStore(context),
                  _listStore(context),
                  _listStore(context),
                  _listStore(context),
                  _listStore(context),
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

Widget _listStore(context){
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
            height: 90,
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
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0)
            ),
            height: 90,
            child: ListTile(
              title: Text("ARNOLD FRAGOZO"),
              subtitle: Text("DIR: Cl 11A #29-2 a 29-150"),
              trailing: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, FacturarPage.ROUTE);
                },
                icon: Icon(Icons.more)
              ),
              isThreeLine: true,
            )
          )
        )
      ]
    )
  );
}