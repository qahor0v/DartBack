import 'dart:io';

import 'package:sqlite3/sqlite3.dart';

void main() {
  print('Using sqlite3 ${sqlite3.version}');
  final db = sqlite3.open('data.db');
  // db.execute('''
  //   CREATE TABLE artists (
  //     id INTEGER NOT NULL PRIMARY KEY,
  //     name TEXT NOT NULL
  //   );
  // ''');
  //
  // final stmt = db.prepare('INSERT INTO artists (name) VALUES (?)');
  // stmt
  //   ..execute(['The Beatles'])
  //   ..execute(['Led Zeppelin'])
  //   ..execute(['The Who'])
  //   ..execute(['Nirvana']);
  //
  // stmt.dispose();

  final ResultSet resultSet =
      db.select('SELECT * FROM artists WHERE name LIKE ?', ['The %']);

  for (final Row row in resultSet) {
    print('Artist[id: ${row['id']}, name: ${row['name']}]');
  }
  db.createFunction(
    functionName: 'dart_version',
    argumentCount: const AllowedArgumentCount(0),
    function: (args) => Platform.version,
  );
  print(db.select('SELECT dart_version()'));

  db.dispose();
}
