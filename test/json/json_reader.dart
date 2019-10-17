import 'dart:io';

String jsonReader(String fileName) => File('test/json/$fileName').readAsStringSync();
