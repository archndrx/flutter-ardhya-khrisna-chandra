import 'package:flutter/foundation.dart';
import 'package:soal_app/core/enums/state.dart';
import 'package:soal_app/model/helper/database_helper.dart';
import 'package:soal_app/model/contacts_model.dart';

class ContactProvider extends ChangeNotifier {
  List<Contact> _listContact = [];

  ContactViewState state = ContactViewState.none;
  changeState(ContactViewState s) {
    state = s;
    notifyListeners();
  }

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

  Future<void> deleteContact(int id) async {
    await _dbHelper.deleteContact(id);
    _getAllContacts();
  }
}
