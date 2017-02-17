import 'dart:convert';
import 'dart:async';
import 'dart:io';

import 'util.dart';

void main() {

  int year = getYear();
  File postsFile = new File(rootPath + 'index\\$year.json');
  Map posts = JSON.decode(postsFile.readAsStringSync());
  String month = getMonth(posts);
  Map post = getPost(posts[month]);

  File mdFile = new File(rootPath + 'posts\\$year\\$month\\${post['id']}.md');
  post['snippet'] = extractSnippet(mdFile.readAsStringSync());

  post['updated'] = now.toUtc().toString();
  postsFile.writeAsStringSync(jsonEncoder.convert(posts));
  stdout.writeln('Updated post: ${post['id']}');

}

int getYear() {
  for (int year = 2016; year < now.year; year++) {
    stdout.writeln('${year - 2016}. $year');
  }
  stdout.write('\n\nEnter year of the post you wish to update... ');
  int selection = int.parse(stdin.readLineSync());
  return selection + 2016;
}

String getMonth(Map months) {
  for (int i = 0; i < months.keys.length; i++) {
    stdout.writeln('$i. ${months.keys.toList()[i]}');
  }
  stdout.write('\n\nEnter month of the post you wish to update... ');
  int selection = int.parse(stdin.readLineSync());
  return months.keys.toList()[selection];
}

Map getPost(List posts) {
  for (int i = 0; i < posts.length; i++) {
    stdout.writeln('$i. ${posts[i]['id']}');
  }
  stdout.write('\n\nEnter id of the post you wish to update... ');
  int selection = int.parse(stdin.readLineSync());
  return posts[selection];
}
