import 'dart:convert';
import 'dart:io';

import 'package:blog_posts/feed.dart';

import 'src/util.dart';

final Uri blogAddress = new Uri(
    scheme: 'https',
    host: 'stwupton.com',
    path: '/');

final List<Person> authors = [
  new Person('Steven Upton', email: 'supton.sz@gmail.com', link: blogAddress)
];

final Uri feedAddress = new Uri(
    scheme: 'https',
    host: 'raw.githubusercontent.com',
    pathSegments: ['stwupton', 'blog_posts', 'master', 'feed.xml']);

final Uri imageAddress = Uri.parse(
    'https://lh3.googleusercontent.com/BLSrE-x7j-XcGei1MlwVeRKxez75Md0Ho2cEtV2F' +
    'T9QLTt6il4zMlC1t4w-pvfeYNL0PIbSOWEdUbw=s179-rw-no');

void main() {
  Feed feed = new Feed('Steven Upton\'s Blog', blogAddress, blogAddress,
      authors: authors, feed: feedAddress, image: imageAddress);

  List<Item> items = [];
  _populateItems(items);
  feed.items = items;

  new File(rootPath + '\\feed.xml')
      .writeAsStringSync(feed.toXmlString(pretty: true));
}

void _populateItems(List<Item> items, {int maximum: 20}) {
  for (int year = now.year; year >= 2018; year--) {
    if (items.length >= maximum) return;

    Map index;
    try {
      String contents =
          new File(rootPath + '\\index\\$year.json').readAsStringSync();
      index = json.decode(contents);
    } catch (_) {
      continue;
    }

    for (int month = 12; month > 0; month--) {
      if (items.length >= maximum) return;

      List posts = index[month.toString()];
      if (posts == null) continue;
      posts = posts.reversed.toList();

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
