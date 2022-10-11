import 'package:flutter/material.dart';
import 'package:flutter_api/dao/conferencia_dao.dart';
import 'package:flutter_api/model/conferencia.dart';
import 'package:flutter_api/widgets/dashboard1.dart';

import '../initial_pages/home.dart';
import '../widgets/dashboard.dart';

class NovaContagem extends StatelessWidget {
  NovaContagem({
    Key? key,
  }) : super(key: key);
  static String tag = 'contagem';

  final TextEditingController _codigoController = TextEditingController();

  final ConferenciaDao _dao = ConferenciaDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[100],
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        actionsIconTheme:
            IconThemeData(size: 30.0, color: Colors.white, opacity: 10.0),
        backgroundColor: Color.fromARGB(255, 49, 63, 137),
        title: Text(
          "Nova contagem",
          style: TextStyle(color: Colors.white),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_outlined, // add custom icons also
          ),
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(Icons.more_vert),
              )),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.white,
                Color.fromARGB(255, 49, 63, 137),
              ],
            )),
        child: ListView(children: [
           Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: _codigoController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      label: Text('Código', style: TextStyle(
                        fontSize: 19
                      ),)
                    ),
                  ),
                ],
              ),
            ),

        ]),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 2.0,
        onPressed: () {
          // print('salvou');
          // final String codigo = _codigoController.text;
          // final Conferencia newConferencia = Conferencia(
          //   0,
          //   codigo,
          // );
          // _dao.saveConferencia(newConferencia).then((id) =>
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      const MyDashboard(),
                ),
              );
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Criada com sucesso!'),
          ));
        },
        backgroundColor: const Color.fromARGB(255, 49, 63, 137),
        child: const Icon(Icons.save),
      ),
    );
  }
}
