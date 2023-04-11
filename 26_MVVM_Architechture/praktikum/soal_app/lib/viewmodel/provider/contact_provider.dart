import 'package:flutter/foundation.dart';
import 'package:soal_app/viewmodel/helper/database_helper.dart';
import 'package:soal_app/model/contacts_model.dart';

class ContactProvider extends ChangeNotifier {
  List<Contact> _listContact = [];
  final DatabaseHelper _dbHelper;

  List<Contact> get contacts => _listContact;

  ContactProvider() : _dbHelper = DatabaseHelper() {
    _getAllContacts();
  }

  void _getAllContacts() async {
    _listContact = (await _dbHelper.getContacts());
    notifyListeners();
  }

  Future<void> addContacts(Contact contact) async {
    await _dbHelper.insertContact(contact);
    _getAllContacts();
  }

  Future<Contact> getContactsbyId(int id) async {
    return await _dbHelper.getContactbyId(id);
  }

  void updateContacts(Contact contact) async {
    await _dbHelper.updateContact(contact);
    _getAllContacts();
  }

  void deleteContacts(int id) async {
    await _dbHelper.deleteContact(id);
    _getAllContacts();
  }
}
