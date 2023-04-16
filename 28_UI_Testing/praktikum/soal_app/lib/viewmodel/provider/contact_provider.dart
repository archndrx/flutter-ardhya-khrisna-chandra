import 'package:flutter/foundation.dart';
import 'package:soal_app/model/contacts_model.dart';

class ContactProvider extends ChangeNotifier {
  List<Contact> _listContact = [];

  List<Contact> get contacts => _listContact;

  void addContact(var name, var number, var date, var color, var file) {
    _listContact.add(
      Contact(
        name: name,
        number: number,
        date: date,
        color: color,
        file: file,
      ),
    );
    notifyListeners();
  }

  // void updateContact(int index, Contact updatedContact) {
  //   _listContact[index] = updatedContact;
  //   notifyListeners();
  // }

  // void deleteContact(int index) {
  //   _listContact.removeAt(index);
  //   notifyListeners();
  // }
}
