import 'dart:convert';
import 'dart:io';

import 'package:markdown/markdown.dart';

final DateTime now = new DateTime.now();
final JsonEncoder jsonEncoder = new JsonEncoder.withIndent('  ');

String get rootPath => Directory.current.uri.toFilePath();

String extractSnippet(String markdown) {
  String html = markdownToHtml(markdown);
  String snippet = new RegExp('<p>(.+)</p>').firstMatch(html).group(1);
  snippet = snippet.replaceAll(new RegExp(r'<\/?[a-zA-z\s\=\.\"\-\:\_\/1-9]+>'), '');
  snippet = snippet.length > 280
      ? snippet.replaceRange(280, snippet.length, '...')
      : snippet;
  return snippet;
}
