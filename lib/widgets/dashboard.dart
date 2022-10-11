import 'package:flutter/material.dart';
import 'package:flutter_api/screens/continue_conferencia.dart';
import 'package:flutter_api/screens/nova_contagem.dart';
import 'package:flutter_api/widgets/dashboard1.dart';
import 'package:flutter_api/widgets/menu.dart';

import 'dialog.dart';

class MyDashboard extends StatelessWidget {
  const MyDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return MyAlertDialog(
                    icon: const Icon(Icons.warning_rounded,
                        size: 50, color: Colors.yellow),
                    title: const Text('Deseja voltar para a pagina inicial?'),
                    content: const Text(
                      'Após a confirmação você perderá o progresso!',
                      style: TextStyle(fontSize: 17),
                    ),
                    onCancel: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (contextNew) => const MyDashboard(),
                        ),
                      );
                    },
                    onConfirm: () {
                      Navigator.pop(
                          context); // context temporario, inserir função para sincronia off de conferencias
                      print('dialogo aberto');
                    },
                  );
                }).then((value) => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (contextNew) => const Menu(),
                  ),
                ));
          },
          child: Icon(
            Icons.arrow_back_outlined, // add custom icons also
          ),
        ),
        backgroundColor: Color.fromARGB(255, 49, 63, 137),
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
        child: GridView.count(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(8),
          crossAxisSpacing: 1,
          mainAxisSpacing: 3,
          crossAxisCount: 1,
          primary: false,
          childAspectRatio: 10 / 4,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(1),
              alignment: Alignment.center,
              height: 150,
              child: SizedBox(
                height: 150,
                child: Card(
                  elevation: 6,
                  shadowColor: Colors.grey,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          leading: Icon(
                            Icons.add,
                            size: 35,
                            color: Color.fromARGB(255, 49, 63, 137),
                          ),
                          title: Text(
                            'Iniciar contagem',
                            style: TextStyle(fontSize: 23),
                          ),
                          subtitle: Text('Iniciar nova contagem'),
                          // isThreeLine: true,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            // TextButton(
                            //   child: const Text('REMOVER'),
                            //   onPressed: () {
                            //
                            //   },
                            // ),
                            const SizedBox(width: 8),
                            TextButton(
                              child: const Text('INICIAR'),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (contextNew) => NovaContagem(),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 150,
              child: SizedBox(
                height: 150,
                child: Card(
                  elevation: 6,
                  shadowColor: Colors.grey,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          leading: Icon(
                            Icons.check,
                            size: 35,
                            color: Color.fromARGB(255, 49, 63, 137),
                          ),
                          title: Text(
                            'Continuar contagem',
                            style: TextStyle(fontSize: 23),
                          ),
                          subtitle:
                              Text('Deseja continuar contagem nao finalizada?'),
                          // isThreeLine: true,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            // TextButton(
                            //   child: const Text('REMOVER'),
                            //   onPressed: () {},
                            // ),
                            const SizedBox(width: 8),
                            TextButton(
                              child: const Text('CONTINUAR'),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (contextNew) =>
                                          ContinueConferencia()),
                                );
                              },
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 150,
              child: SizedBox(
                height: 150,
                child: Card(
                  elevation: 6,
                  shadowColor: Colors.grey,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          leading: Icon(
                            Icons.cloud_off_sharp,
                            size: 35,
                            color: Color.fromARGB(255, 49, 63, 137),
                          ),
                          title: Text(
                            'Enviar offline',
                            style: TextStyle(fontSize: 23),
                          ),
                          subtitle:
                              Text('Enviar todas as conferências offline?'),
                          //isThreeLine: true,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            // TextButton(
                            //   child: const Text('REMOVER'),
                            //   onPressed: () {
                            //     /* ... */
                            //   },
                            // ),
                            const SizedBox(width: 8),
                            TextButton(
                              child: const Text('ENVIAR'),
                              onPressed: () {
                                print('send off');
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return MyAlertDialog(
                                        icon: const Icon(Icons.warning_rounded,
                                            size: 50, color: Colors.yellow),
                                        title: const Text(
                                            'Deseja enviar todas as conferências?'),
                                        content: const Text(
                                          'Após a confirmação a lista de conferência ficará vazia!',
                                          style: TextStyle(fontSize: 17),
                                        ),
                                        onCancel: () {
                                          Navigator.pop(context);
                                        },
                                        onConfirm: () {
                                          Navigator.pop(
                                              context); // context temporario, inserir função para sincronia off de conferencias
                                          print('dialogo aberto');
                                        },
                                      );
                                    });
                              },
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
