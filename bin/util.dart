import 'dart:convert';
import 'dart:io';

DateTime now = new DateTime.now();
JsonEncoder jsonEncoder = new JsonEncoder.withIndent('  ');

String resolveRootPath(String scriptName) =>
  Platform.script
    .toFilePath()
    .replaceAll('bin\\$scriptName.dart', '');
