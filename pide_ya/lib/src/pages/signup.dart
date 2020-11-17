import 'package:flutter/material.dart';
import 'package:pide_ya/colors/colors.dart';
import 'package:http/http.dart' as http;
import 'package:pide_ya/src/models/user.dart';
import 'dart:async';
import 'dart:convert';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();

  static const String ROUTE = "/signup";
}

class _SignUpPageState extends State<SignUpPage> {
  
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _directionController = TextEditingController();
  final _emailController = TextEditingController();
  final _telefeonoController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  // ignore: missing_return
  Future<User> createUser(String displayName, String email, String password, String phoneNumber, String direction, String type) async {

    await http.post(
      'http://192.168.20.29:4000/api/users/create',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'phoneNumber': phoneNumber,
        'password': password,
        'displayName': displayName,
        'photoURL': 'https://firebasestorage.googleapis.com/v0/b/pide-ya-db.appspot.com/o/PideYa.png?alt=media&token=a9f2a265-3d4f-4f9c-9828-2d125b63a950',
        'direction': direction,
        'type': type
      }),
    );
  }

  String hasType = 'Persona';
  Future<User> futureUser;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            children: <Widget>[
              SizedBox(height: 10.0),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: IconButton(icon: Icon(Icons.chevron_left),
                      onPressed: () {
                        Navigator.pop(context);
                      }
                    )
                  ),
                  Expanded(flex: 7, child: Text("LOGIN"))
                ],
              ),
              SizedBox(height: 15.0),
              Column(
                children: <Widget>[
                  Image.asset('assets/Pide_Ya.png'),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(flex: 1, child: Container(),),
                      Expanded( 
                        child: Text(
                          'Sign UP',
                          style: Theme.of(context).textTheme.headline6,
                        )
                      ),
                      Expanded(
                        child: DropdownButton<String>(
                          value: hasType,
                          icon: Icon(Icons.arrow_downward, color: cPideYaRedGray,),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: cPideYaRedGray),
                          underline: Container(
                            height: 2,
                            color: cPideYaAmber300,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              hasType = newValue;
                            });
                          },
                          items: <String>['Persona', 'Tienda']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        )
                      ),
                      Expanded(flex: 1, child: Container(),),

                    ]
                  )
                ],
              ),
              SizedBox(height: 20.0),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _usernameController,
                      validator: (value){
                        if (value.isEmpty) {
                          return "Dato faltante";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        //filled: true,
                        prefixIcon: Icon(Icons.person),
                        labelText: 'Nombre',
                      ),
                    ),
                    SizedBox(height: 12.0),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      validator: (value){
                        if (value.isEmpty) {
                          return "Dato faltante";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        //filled: true,
                        prefixIcon: Icon(Icons.email),
                        labelText: 'Email',
                      ),
                    ),
                    // spacer
                    SizedBox(height: 12.0),
                    // [Password]
                    TextFormField(
                      controller: _passwordController,
                      validator: (value){
                        if (value.length < 6) {
                          return "6 Caracteres o mas";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        //filled: true,
                        prefixIcon: Icon(Icons.lock),
                        labelText: 'Password',
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 12.0),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                      controller: _telefeonoController,
                      validator: (value){
                        if (value.isEmpty) {
                          return "Dato faltante";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        //filled: true,
                        prefixIcon: Icon(Icons.call),
                        labelText: 'Telefeno',
                      ),
                    ),
                    SizedBox(height: 12.0),
                    TextFormField(
                      controller: _directionController,
                      validator: (value){
                        if (value.isEmpty) {
                          return "Dato faltante";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        //filled: true,
                        prefixIcon: Icon(Icons.person_pin_circle),
                        labelText: 'Direccion',
                      ),
                    ),
                    SizedBox(height: 10.0),
                    ButtonBar(
                      children: [
                        FlatButton(
                          onPressed: () {
                            _emailController.clear();
                            _telefeonoController.clear();
                            _directionController.clear();
                            _usernameController.clear();
                            _passwordController.clear();
                            Navigator.pop(context);
                          }, 
                          child: Text("Cancelar")
                        ),
                        SizedBox(
                          width: 100,
                          height: 50,
                          child: RaisedButton(
                            elevation: 5.0,
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                createUser(_usernameController.text, _emailController.text, _passwordController.text, '+57' + _telefeonoController.text, _directionController.text, hasType);
                                Navigator.pop(context);
                              }
                            },
                            child: Text("SingUp")
                          ),
                        )
                      ],
                    )
                  ]
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}