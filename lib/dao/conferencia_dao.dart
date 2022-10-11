import 'package:flutter_api/model/conferencia.dart';
import 'package:sqflite/sqlite_api.dart';

import '../data/conferencia_db.dart';

class ConferenciaDao {



  static const String tableConferencias = 'conferencias';

  static const String tableSql = 'CREATE TABLE conferencias('
      'id INTEGER PRIMARY KEY, '
      'codigo INTEGER, )';


  Future<int> saveConferencia(Conferencia conferencia) async {
    final Database db = await createDatabase();
    final Map<String, dynamic> conferenciaMap = {};
    conferenciaMap['codigo'] = conferencia.codigo;

    return db.insert('conferencias', conferenciaMap);
  }

  Future<List<Conferencia>> findAllConferencias() async {
    final Database db = await createDatabase();
    final List<Map<String, dynamic>> result = await db.query('conferencias');
    final List<Conferencia> conferencias = [];
    for (Map<String, dynamic> row in result) {
      final Conferencia conferencia = Conferencia(row['id'], row['codigo']);
      conferencias.add(conferencia);
    }
    return conferencias;
  }

  Future<Conferencia> findById(Conferencia conferencia) async {
    final Database db = await createDatabase();
    final List<Map<String, dynamic>> result = await db
        .query(tableConferencias, where: 'id =?', whereArgs: [conferencia.id]);
    for (Map<String, dynamic> row in result) {
      final Conferencia conferencia = Conferencia(row['id'], row['codigo']);
      break;
    }
    return conferencia;
  }

  Future<void> updateConferencia(Conferencia conferencia) async {
    final db = await createDatabase();
    await db.update(
      tableConferencias,
      conferencia.toMap(),
      where: 'id = ?',
      whereArgs: [conferencia.id],
    );
  }

  Future<void> deleteConferencia(int id) async {
    final db = await createDatabase();
    await db.delete(
      'conferencias',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
