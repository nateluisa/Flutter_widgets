import 'package:flutter/material.dart';
import 'package:flutter_api/screens/nova_contagem.dart';
import 'package:flutter_api/widgets/dashboard.dart';
import 'package:flutter_api/widgets/dropdown.dart';

class Emissao extends StatelessWidget {
  const Emissao({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[100],
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 49, 63, 137),
        title: Text('Emissão'),
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
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsetsDirectional.all(28.0),
                  child: MyDropdown(),
                ),
                Container(
                  padding: EdgeInsetsDirectional.all(28.0),
                  child: SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(
                              Color.fromARGB(255, 49, 63, 137))),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (contextNew) => const MyDashboard(),
                          ),
                        );
                        // Navigator.of(context).pushNamed(NovaContagem.tag);
                      },
                      child: Text('CONTINUAR'),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
