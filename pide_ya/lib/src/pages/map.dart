import 'package:flutter/material.dart';
import 'package:pide_ya/colors/colors.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();

  static const String ROUTE = "/map";

}

class _MapPageState extends State<MapPage> {
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
                                  "MAPA",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18
                                  )
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
                )
              ]
            ),
            Card(
              margin: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                height: MediaQuery.of(context).size.height - 150.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.amber[100],
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