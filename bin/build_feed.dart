import 'dart:convert';
import 'dart:io';

import 'package:blog_posts/feed.dart';

import 'src/util.dart';

final Uri blogAddress =
    new Uri(scheme: 'https', host: 'stwupton.github.io', path: '/');
final List<Person> authors = [
  new Person('Steven Upton', email: 'supton.sz@gmail.com', link: blogAddress)
];

void main() {
  // TODO: Add 'feed' link.
  Feed feed = new Feed('Steven Upton\'s Blog', blogAddress, blogAddress,
      authors: authors);

  List<Item> items = [];
  _populateItems(items);
  feed.items = items;

  new File(rootPath + '\\feed.xml')
      .writeAsStringSync(feed.toXmlString(pretty: true));
}

void _populateItems(List<Item> items, {int maximum: 20}) {
  for (int year = now.year; year >= 2017; year--) {
    if (items.length >= maximum) return;

    Map index;
    try {
      String contents =
          new File(rootPath + '\\index\\$year.json').readAsStringSync();
      index = JSON.decode(contents);
    } catch (_) {
      continue;
    }

    for (int month = 12; month > 0; month--) {
      if (items.length >= maximum) return;

      List<Map> posts = index[month.toString()];
      if (posts == null) continue;
      posts = posts.reversed;

      // Loop throught the posts of the month in reverse order.
      for (Map post in posts) {
        if (items.length >= maximum) return;

        DateTime published = DateTime.parse(post['published']);
        DateTime updated = DateTime.parse(post['updated'] ?? post['published']);
        items.add(new Item(
            post['title'],
            blogAddress.replace(pathSegments: ['$year', '$month', post['id']]),
            updated,
            published: published,
            description: post['snippet']));
      }
    }
  }
}
