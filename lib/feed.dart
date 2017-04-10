import 'package:xml/xml.dart';

class Person {
  final String email;
  final Uri link;
  final String name;

  const Person(this.name, {this.email, this.link});
}

class Item {
  List<Person> authors;
  List<Person> contributors;
  String title;
  Uri link;
  String description;
  DateTime date;
  DateTime published;
  Uri image;
  String guid;
  Uri id;
  String content;
  String copyright;

  Item(this.title, this.link, this.date,
      {this.authors: const [],
      this.contributors: const [],
      this.description,
      this.published,
      this.image,
      this.id,
      this.guid,
      this.content,
      this.copyright});
}

class Feed {
  List<Person> authors;
  List<String> categories;
  List<Person> contributors;
  String copyright;
  String description;
  Uri feed;
  Uri hub;
  Uri id;
  Uri image;
  List<Item> items;
  Uri link;
  String title;
  DateTime updated;

  Feed(this.title, this.id, this.link,
      {this.authors: const [],
      this.categories: const [],
      this.contributors: const [],
      this.copyright,
      this.description,
      this.feed,
      this.hub,
      this.image,
      this.items: const [],
      this.updated});

  XmlNode _renderAtom() {
    XmlBuilder builder = new XmlBuilder();

    // Utility function for building an xml element describing the properties of
    // a [Person].
    void buildPerson(String element, Person person) {
      builder.element(element, nest: () {
        builder.element('name', nest: person.name);

        if (person.email != null)
          builder.element('email', nest: person.email);

        if (person.link != null)
          builder.element('uri', nest: person.link.toString());
      });
    }

    // Utility function for converting all [DateTime] objects to UTC timezones
    // and to an ISO 8601 formatted [String].
    String standardiseDateTime(DateTime dateTime) =>
        dateTime.toUtc().toIso8601String();

    builder
      ..processing('xml', 'version="1.0" encoding="utf-8"')
      ..element('feed', attributes: {'xmlns': 'http://www.w3.org/2005/Atom'},
          nest: () {
        // Build required elements.
        builder
          ..element('id', nest: id.toString())
          ..element('title', nest: title)
          ..element('link', attributes: {
            'rel': 'alternate',
            'href': link.toString()
          })
          ..element('updated',
              nest: standardiseDateTime(updated ?? new DateTime.now()));

        // Build recommended elements.
        for (Person author in authors) buildPerson('author', author);

        if (feed != null) {
          builder.element('link', attributes: {
            'rel': 'self',
            'href': feed.toString()
          });
        }

        if (hub != null) {
          builder.element('link', attributes: {
            'rel': 'hub',
            'href': hub.toString()
          });
        }

        // Build optional elements.
        if (description != null) builder.element('subtitle', nest: description);
        if (image != null) builder.element('logo', nest: image.toString());
        if (copyright != null) builder.element('rights', nest: copyright);

        for (String category in categories)
          builder.element('category', attributes: {'term': category});

        for (Person contributor in contributors)
          buildPerson('contributor', contributor);

        for (Item item in items) {
          builder.element('entry', nest: () {
            // Build required item elements.
            builder
              ..element('title', attributes: {'type': 'html'}, nest: () {
                builder.cdata(item.title);
              })
              ..element('id', nest: (item.id ?? item.link).toString())
              ..element('link', attributes: {'href': item.link.toString()})
              ..element('updated', nest: standardiseDateTime(item.date));

            // Build recommended item elements.
            if (item.description != null) {
              builder.element('summary', attributes: {'type': 'html'},
                  nest: () {
                builder.cdata(item.description);
              });
            }

            if (item.content != null) {
              builder.element('content', attributes: {'type': 'html'},
                  nest: () {
                builder.cdata(item.content);
              });
            }

            for (Person author in item.authors) buildPerson('author', author);

            // Build optional item elements.
            for (Person contributor in item.contributors)
              buildPerson('contributor', contributor);

            if (item.published != null) {
              builder.element('published',
                  nest: standardiseDateTime(item.published));
            }

            if (item.copyright != null)
              builder.element('rights', nest: item.copyright);
          });
        }
      });

    return builder.build();
  }

  String toXmlString({bool pretty: false, String indent: '  '}) =>
      _renderAtom().toXmlString(pretty: pretty, indent: indent);
}
