import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'util.dart';

Future main() async {

  Map draft = getDraft();
  publish(draft);

}

void disposeDraftCorpse(String id) {

  File index = new File(rootPath + 'index\\drafts.json');
  List indexData = JSON.decode(index.readAsStringSync());
  indexData.removeWhere((Map draft) => draft['id'] == id);
  index.writeAsStringSync(jsonEncoder.convert(indexData));

  File md = new File(rootPath + 'drafts\\$id.md');
  md.deleteSync(recursive: true);

}

Map getDraft() {

  File index;
  String indexPath = rootPath + 'index\\drafts.json';
  if (FileSystemEntity.isFileSync(indexPath))
    index = new File(indexPath);
  else
    throw new Exception('Could not find unpublished posts.');

  List<Map> indexData = JSON.decode(index.readAsStringSync());

  if (indexData.isEmpty)
    throw new Exception('Could not find unpublished posts.');

  StringBuffer titles = new StringBuffer();
  for (int i = 0; i < indexData.length; i++)
    titles.writeln('$i. ${indexData[i]['title']}');

  titles
    ..writeln('')
    ..write('Please choose which post you want to publish... ');

  stdout.write(titles.toString());

  int i = int.parse(stdin.readLineSync());
  Map draft = indexData[i];

  return draft;

}

void publish(Map draft) {

  // Get markdown contents and delete file
  File md;
  String mdPath = rootPath + 'drafts\\${draft['id']}.md';
  if (FileSystemEntity.isFileSync(mdPath))
    md = new File(mdPath);
  else
    throw new Exception('Cannot find markdown located at: $mdPath');

  String mdContent = md.readAsStringSync();

  mdPath = rootPath + 'posts\\${now.year}\\${now.month}\\${draft['id']}.md';
  md = new File(mdPath)
    ..createSync(recursive: true)
    ..writeAsStringSync(mdContent);

  // Create index entry
  draft.addAll({
    'published': now.toUtc().toString()
  });

  String indexPath = rootPath + 'index\\${now.year}.json';
  File index = new File(indexPath);
  Map<String, List<Map>> indexData;
  try {
    indexData = JSON.decode(index.readAsStringSync());
  } catch (_) {
    indexData = {};
    index.createSync(recursive: true);
  }

  List posts = indexData['${now.month}'] ??= [];
  posts.add(draft);

  index.writeAsStringSync(jsonEncoder.convert(indexData));

  disposeDraftCorpse(draft['id']);

}
