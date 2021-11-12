import 'dart:convert';
import 'dart:io';

import 'package:test/test.dart';

import 'package:diplomacy/model/model.dart';

void main() {
  tearDown(() async {
    for (var file in await Directory('data/users').list().toList()) {
      await file.delete();
    }

    for (var file in await Directory('data/gameMasters').list().toList()) {
      await file.delete();
    }

    expect(await Directory('data/users').list().length, equals(0));
    expect(await Directory('data/gameMasters').list().length, equals(0));
  });

  test('Test FilePersistence setup', () async {
    Persistence filePersistence = FilePersistence();
    await filePersistence.waitForInitialization();

    expect(await Directory('data').exists(), equals(true));
    expect(await Directory('data/users').exists(), equals(true));
    expect(await Directory('data/gameMasters').exists(), equals(true));
  });

  test('Test FilePersistence storeObject', () async {
    Persistence filePersistence = FilePersistence();
    await filePersistence.waitForInitialization();

    Map<String, dynamic> object = {
      'id': '1',
      'testField1': 'Test Data 1',
      'testField2': 'Test Data 2'
    };

    // Verify store in users table
    await filePersistence.storeObject(object, Table.users);

    expect(await File('data/users/1').exists(), equals(true));

    String contents = await File('data/users/1').readAsString();
    Map<String, dynamic> resultObject = jsonDecode(contents);
    expect(resultObject, equals(object));

    // Verify store in gameMasters table
    await filePersistence.storeObject(object, Table.gameMasters);

    expect(await File('data/gameMasters/1').exists(), equals(true));

    contents = await File('data/gameMasters/1').readAsString();
    resultObject = jsonDecode(contents);
    expect(resultObject, equals(object));

    // Verify error checking
    object = {
      'testField1': 'Test Data 1',
      'testField2': 'Test Data 2',
    };

    expect(
      () async => await filePersistence.storeObject(object, Table.users),
      throwsA(isA<StateError>()),
    );
    expect(
      () async => await filePersistence.storeObject(object, Table.gameMasters),
      throwsA(isA<StateError>()),
    );
  });

  test('Test FilePersistence readObject', () async {
    Persistence filePersistence = FilePersistence();

    // Create test files
    Map<String, dynamic> object = {
      'id': '1',
      'testField1': 'Test Data 1',
      'testField2': 'Test Data 2'
    };
    await File('data/users/2').writeAsString(jsonEncode(object));
    await File('data/gameMasters/2').writeAsString(jsonEncode(object));

    // Verify read from user table
    var resultUser = await filePersistence.readObject('2', Table.users);
    expect(resultUser, equals(object));

    // Verify read from gameMasters table
    var resultGameMaster =
        await filePersistence.readObject('2', Table.gameMasters);
    expect(resultGameMaster, equals(object));

    // Verify error checking
    expect(() async => await filePersistence.readObject('3', Table.users),
        throwsA(isA<StateError>()));
  });
}
