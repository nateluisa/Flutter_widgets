import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_api/widgets/checkbox.dart';

import '../initial_pages/home.dart';

class Configuracao extends StatelessWidget {
  const Configuracao({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[100],
      appBar: AppBar(
        title: Text('Configurações'),
        backgroundColor: Color.fromARGB(255, 49, 63, 137),
        // actions: <Widget>[
        //   Container(
        //     width: 60.0,
        //     child: PopupMenuButton<String>(itemBuilder: (BuildContext context) {
        //       return [
        //         const PopupMenuItem<String>(
        //           value: '1',
        //           child: Text('http'),
        //         ),
        //         const PopupMenuItem<String>(
        //           value: '2',
        //           child: Text('https'),
        //         ),
        //       ];
        //     }),
        //   )
        // ],
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.white,
                Color.fromARGB(255, 49, 63, 137),
              ],
            )),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextFormField(
                validator: (String? value) {
                  if (value != null && value.isEmpty) {
                    return 'Informe o endereço do servidor!';
                  }
                },
                inputFormatters: [

                ],
                decoration: InputDecoration(label: Text('Endereço do servidor')),
              ),
              TextFormField(
                validator: (String? value) {
                  if (value != null && value.isEmpty) {
                    return 'Informe a porta do servidor!';
                  }
                },
                decoration: InputDecoration(label: Text('Porta do servidor')),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text('Protocolo', style: TextStyle(fontSize: 16)),
                    MyCheckbox(
                      activeColor: Color.fromARGB(255, 49, 63, 137),
                      title: Text('Https'),
                    ),
                    MyCheckbox(
                      activeColor: Color.fromARGB(255, 49, 63, 137),
                      title: Text('Http'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 2.0,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => HomePage(
                homeContext: context,
              ),
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Salvo com sucesso!'),
          ));
          // saveClient(widget.name, widget.adress, widget.number,
          //     widget.district, widget.telephone);
        },
        backgroundColor: const Color.fromARGB(255, 49, 63, 137),
        child: const Icon(Icons.save),
      ),
    );
  }
}
