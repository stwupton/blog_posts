import 'dart:convert';
import 'dart:io';

DateTime now = new DateTime.now();
JsonEncoder jsonEncoder = new JsonEncoder.withIndent('  ');

String get rootPath => Directory.current.uri.toFilePath();
