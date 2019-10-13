import 'dart:io';

String jsonReader(String fileName) => File('test/fixtures/$fileName').readAsStringSync();
