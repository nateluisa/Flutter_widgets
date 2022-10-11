import 'package:flutter/material.dart';
import 'package:flutter_api/dao/conferencia_dao.dart';
import 'package:flutter_api/widgets/dashboard.dart';

import '../model/conferencia.dart';
import '../widgets/progress.dart';

class ContinueConferencia extends StatelessWidget {
  final ConferenciaDao _dao = ConferenciaDao();

  ContinueConferencia({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: Colors.white),
        actionsIconTheme:
            const IconThemeData(size: 30.0, color: Colors.white, opacity: 10.0),
        backgroundColor: Color.fromARGB(255, 49, 63, 137),
        title: const Text(
          "Continuar conferencia",
          style: TextStyle(color: Colors.white),
        ),
        leading: GestureDetector(
          onTap: () {
            //Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (contextNew) => MyDashboard(),
              ),
            );
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
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.white,
                Color.fromARGB(255, 49, 63, 137),
              ],
            )),
        height: 800,
        width: 400,
        child: FutureBuilder(
          future: _dao.findAllConferencias(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                // TODO: Handle this case.
                break;
              case ConnectionState.waiting:
                return Progress();
                break;
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                if (snapshot.data != null) {
                  final List<Conferencia> conferencias =
                      snapshot.data as List<Conferencia>;
                  return ListView.builder(
                    padding: const EdgeInsets.only(bottom: 85),
                    itemBuilder: (context, index) {
                      final Conferencia conferencia = conferencias[index];
                      return _ConferenciaItem(conferencia);
                    },
                    itemCount: conferencias.length,
                  );
                }
                break;
            }
            return
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Wrap(
                  spacing: 4.0,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: const [
                    Icon(Icons.warning_rounded),
                    Text('Sem conferências', style: TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w400,
                    ),
                    ),

                  ]
                ),
              ],
            );

          },
        ),
      ),
    );
  }
}

class _ConferenciaItem extends StatelessWidget {
  // widget privado que fara parte apenas da tela conferenciae - lista
  final Conferencia conferencia;
  final ConferenciaDao _dao = ConferenciaDao();

  _ConferenciaItem(this.conferencia);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      shadowColor: Colors.blueGrey,
      child: ListTile(
        trailing: PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Theme.of(context).colorScheme.outline,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: '1',
                  child: const Text('Editar'),
                  onTap: () {
                    // _dao.findById(conferencia).then((cli) => Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (BuildContext context) => ConferenciasEditScreen(
                    //           conferencia: cli, conferenciasEditContext: context),
                    //     )));
                  },
                ),
                PopupMenuItem<String>(
                  value: '2',
                  onTap: () {
                    // _dao.findById(conferencia).then((cli) => Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (BuildContext context) => ConferenciasViewScreen(
                    //           conferencia: cli, conferenciasViewContext: context),
                    //     )));
                  },
                  child: const Text('Visualizar'),
                ),
                PopupMenuItem<String>(
                  onTap: () {
                    print('delete');
                    _dao
                        .deleteConferencia(conferencia.id)
                        .then((id) => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ContinueConferencia(),
                            )));
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Conferencia deletada!'),
                    ));
                  },
                  value: '3',
                  child: const Text('Excluir'),
                ),
              ];
            }),
        title: Text(
          'Código da conferência',
          style: const TextStyle(fontSize: 18),
        ),
        subtitle: Text(
          conferencia.codigo,
          style: const TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}
