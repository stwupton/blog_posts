import 'dart:io';
import 'dart:convert';

import 'src/util.dart';

void main(List<String> args) {
  if (args.length == 0) throw new Exception('Expected title argument.');

  String title = args[0];
  String id = title
      .toLowerCase()
      .replaceAll(' ', '-')
      .replaceAll(new RegExp('[^\\w-]'), '');

  File index = new File(rootPath + 'index\\drafts.json');
  List<Map> indexData;
  try {
    indexData = JSON.decode(index.readAsStringSync());
  } catch (_) {
    index.createSync(recursive: true);
    indexData = [];
  }

  if (indexData.where((Map _pi) => _pi['id'] == id).length > 0)
    throw new Exception('Post with id: $id already exists.');

  indexData.add({
    'title': title,
    'id': id
  });

  index.writeAsStringSync(jsonEncoder.convert(indexData));

  File md = new File(rootPath + 'drafts\\$id.md');
  md.createSync(recursive: true);
}
