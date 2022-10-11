import 'package:flutter_api/dao/conferencia_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

Future<Database> createDatabase() async {
  return openDatabase(
    join(
      await getDatabasesPath(),
      'project1.db',
    ),
    onCreate: (db, version) async {
      //await db.execute("DROP TABLE IF EXISTS conferencias");
      await db.execute(ConferenciaDao.tableSql);
    },
    version: 1,
   //onDowngrade: onDatabaseDowngradeDelete  //, para limpeza do banco faça upgrade em +1 na versao + hot restart logo depois volte 1 versao e comente esse trecho novamente + hot restart
  );
}



