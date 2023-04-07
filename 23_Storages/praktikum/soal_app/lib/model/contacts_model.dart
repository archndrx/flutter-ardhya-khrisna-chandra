import 'dart:ui';

class Contact {
  late int? id;
  late String name;
  late String number;
  late String date;
  late String color;
  late String file;

  Contact({
    this.id = null,
    required this.name,
    required this.number,
    required this.date,
    required this.color,
    required this.file,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'number': number,
      'date': date,
      'color': color,
      'file': file,
    };
  }

  Contact.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    number = map['number'];
    date = map['date'];
    color = map['color'];
    file = map['file'];
  }
}
