import 'package:flutter/material.dart';
import 'package:flutter_api/widgets/date_picker.dart';
import 'package:flutter_api/widgets/expansible_card.dart';
import 'package:flutter_api/widgets/input_date.dart';
import 'package:flutter_api/widgets/menu_popup.dart';
import 'package:flutter_api/widgets/tabbar.dart';

import '../widgets/dashboard.dart';

class NovaContagem extends StatelessWidget {
  NovaContagem({
    Key? key,
  }) : super(key: key);
  static String tag = 'contagem';

  final TextEditingController _codigoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[100],
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        actionsIconTheme:
            const IconThemeData(size: 30.0, color: Colors.white, opacity: 10.0),
        backgroundColor: const Color.fromARGB(255, 49, 63, 137),
        title: const Text(
          "Nova contagem",
          style: TextStyle(color: Colors.white),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_outlined, // add custom icons also
          ),
        ),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(Icons.more_vert),
              )),
        ],
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
        child: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _codigoController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      label: Text(
                    'Código',
                    style: TextStyle(fontSize: 19),
                  )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const MyDatePicker(
                        dateLabelText: 'Data inicial', readOnly: false),
                    const MyDatePicker(
                      dateLabelText: 'Data final (read only)',
                      readOnly: true,
                    ),

                  ],
                ),
                MyExpansibleCard()
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
              builder: (BuildContext context) => const MyDashboard(),
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
